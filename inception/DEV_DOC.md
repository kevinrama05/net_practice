# DEVELOPER DOCUMENTATION

## Project Structure
inception
- Makefile 
- secrets/ 
- srcs/ 
    - docker-compose.yml 
    - .env 
    - requirements/ 
        - mariadb/
        - wordpress/ 
        - nginx/

------------------------------------------------------------------------

## Setup

1.  Install Docker & Compose
2.  Add to /etc/hosts: 127.0.0.1 kerama.42.fr

------------------------------------------------------------------------

## Build
```bash
make
```
or
```bash
docker-compose -f srcs/docker-compose.yml up --build
```
------------------------------------------------------------------------

## Manage
```bash
docker-compose down docker-compose logs -f
```
------------------------------------------------------------------------

## Data Persistence

Volumes store: 
- MariaDB database 
- WordPress files

Located under: /home/kerama/data/

------------------------------------------------------------------------

## Debugging
```bash
docker exec -it mariadb bash docker exec -it wordpress bash
```
