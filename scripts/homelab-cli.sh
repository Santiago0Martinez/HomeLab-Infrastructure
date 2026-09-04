#!/bin/bash

# ==========================================
# Configuración
# Cambia esta ruta a donde esté tu docker-compose.yml principal
HOMELAB_DIR="$HOME/homelab" 
# ==========================================

mostrar_ayuda() {
    echo -e "\n🚀 CLI de Administración del Homelab HP"
    echo "Uso: homelab [comando]"
    echo ""
    echo "Comandos disponibles:"
    echo "  status  - Muestra uso de CPU, RAM, Disco y contenedores activos"
    echo "  clean   - Limpia imágenes huérfanas, volúmenes sin uso y memoria caché"
    echo "  update  - Descarga las últimas imágenes y recrea los contenedores"
    echo "  help    - Muestra este menú de ayuda"
    echo ""
}

case "$1" in
    status)
        echo -e "\n📊 Estado del Servidor HP:"
        echo "-----------------------------------"
        echo "💻 CPU y RAM:"
        free -h | awk 'NR==2{printf "Uso de RAM: %s / %s (%.2f%%)\n", $3,$2,$3*100/$2 }'
        top -bn1 | grep load | awk '{printf "Carga de CPU: %.2f\n", $(NF-2)}'
        echo -e "\n💾 Almacenamiento Raíz (/):"
        df -h / | awk '$NF=="/"{printf "Disco libre: %s / %s (%s ocupado)\n", $4,$2,$5}'
        echo -e "\n🐳 Contenedores Activos:"
        docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
        ;;
    clean)
        echo -e "\n🧹 Limpiando el servidor..."
        echo "Eliminando imágenes y volúmenes huérfanos de Docker..."
        docker system prune -a --volumes -f
        echo "Vaciando caché de RAM del sistema..."
        sudo sync; sudo echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null
        echo "✅ Servidor limpio y optimizado."
        ;;
    update)
        echo -e "\n🔄 Actualizando contenedores del Homelab..."
        if [ -d "$HOMELAB_DIR" ]; then
            cd "$HOMELAB_DIR" || exit
            docker compose pull
            docker compose up -d --remove-orphans
            echo "✅ Contenedores actualizados y corriendo."
        else
            echo "❌ Error: No se encontró el directorio $HOMELAB_DIR."
        fi
        ;;
    *)
        mostrar_ayuda
        ;;
esac
