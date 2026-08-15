# HomeLab Infrastructure & Self-Hosted Services

[![Docker](https://img.shields.io/badge/Docker-24.0+-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Docker Compose](https://img.shields.io/badge/Docker_Compose-v2-blue?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![Linux](https://img.shields.io/badge/Linux_Server-Debian%2FUbuntu-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.kernel.org/)
[![Status](https://img.shields.io/badge/Status-Active%20%26%20Maintained-success?style=for-the-badge)]()

Infraestructura personal basada en contenedores Docker para gestión de red, monitoreo, productividad, almacenamiento y seguridad dentro de la red local.

---

##  Arquitectura y Servicios

| Servicio | Categoría | Puerto Local | Descripción |
| :--- | :--- | :--- | :--- |
| **Flame** | Dashboard | `5005` | Página de inicio y panel de accesos directos |
| **Homepage** | Dashboard | `3000` | Dashboard personalizable con métricas de red |
| **AdGuard Home** | Red & DNS | `8081` / `53` | Servidor DNS y bloqueador de publicidad |
| **Vaultwarden** | Seguridad | `8084` | Servidor compatible con Bitwarden (autoalojado) |
| **Uptime Kuma** | Monitoreo | `3002` | Panel de monitoreo de estado y alertas |
| **Trilium Notes** | Base de Conocimiento| `8082` | Gestión estructurada de apuntes y documentación |
| **Memos** | Notas Rápidas | `5230` | Micro-blogging y snippets rápidos de código |
| **IT-Tools** | Utilidades Dev | `8083` | Caja de herramientas web para desarrolladores |
| **Filebrowser** | Almacenamiento | `8080` | Gestor y explorador de archivos privado |

---

## Estructura del Repositorio

```text
.
├── docker-compose.yml        # Orquestación principal de servicios
├── .env.example              # Plantilla de variables de entorno requeridas
├── .gitignore                # Reglas de exclusión para datos y secretos
├── filebrowser.json          # Configuración del explorador de archivos
├── flame/                    # Configuraciones de temas y vistas de Flame
├── homepage/                 # Configuración de servicios, widgets y settings
└── chatbot/
    └── docker-compose.yml    # Módulo independiente para chatbot local
