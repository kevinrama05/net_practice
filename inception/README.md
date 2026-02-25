*This activity has been created as part of the 42 curriculum by
kerama*

# Inception

## Description

Inception is a system administration project focused on containerization
using Docker and Docker Compose.

The goal is to build a secure web infrastructure composed of: - NGINX
(TLSv1.2 / TLSv1.3 only) - WordPress + PHP-FPM - MariaDB - Docker
volumes for persistence - A dedicated Docker network

Each service runs in its own container, built manually from Debian.

------------------------------------------------------------------------

## Architecture

Internet (HTTPS 443) → NGINX → WordPress (PHP-FPM) → MariaDB

------------------------------------------------------------------------

## Instructions

### Build & Run
```bash
make
```
or
```bash
docker-compose -f srcs/docker-compose.yml up --build
```
### Stop
```bash
make down
```
------------------------------------------------------------------------

## Access

https://kerama.42.fr https://kerama.42.fr/wp-admin

------------------------------------------------------------------------

## Technical Comparisons

### Virtual Machines vs Docker

-   VM: Full OS, heavy, slower
-   Docker: Shared kernel, lightweight, faster

### Secrets vs Environment Variables

-   Env vars: configuration
-   Secrets: secure sensitive data

### Docker Network vs Host Network

-   Docker network isolates containers
-   Host network exposes directly

### Docker Volumes vs Bind Mounts

-   Volumes: managed by Docker
-   Bind mounts: direct host mapping

------------------------------------------------------------------------

## Resources

-   Docker Docs
-   NGINX Docs
-   MariaDB Docs
-   WordPress Docs

### AI Usage

AI was used for debugging explanations and documentation structure. All
content was reviewed and understood before integration.
