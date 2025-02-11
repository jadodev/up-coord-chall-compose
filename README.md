
---

# Instrucciones para Iniciar el Proyecto

Este proyecto se compone de varios repositorios que conforman la arquitectura completa de la solución. Para iniciar el sistema, sigue estos pasos:

## Repositorios a Clonar

Clona los siguientes repositorios en el directorio raíz de tu proyecto:

#### copia y pega esto en tu terminal de gitbash o compatible con bash:

```plaintext
git clone git@github.com:jadodev/up-coord-chall-compose.git &
git clone git@github.com:jadodev/ms-user-management-service.git &
git clone git@github.com:jadodev/ms-shipment-service.git &
git clone git@github.com:jadodev/ms-driver-operations.git &
git clone git@github.com:jadodev/ms-dispatch-service.git &
git clone git@github.com:jadodev/ms-delivery-status.git &
git clone git@github.com:jadodev/api-gateway-compose.git &

wait
```

- [ms-user-management](https://github.com/jadodev/ms-user-management-service)
- [ms-dispatch-service](https://github.com/jadodev/ms-dispatch-service)
- [ms-delivery-status](https://github.com/jadodev/ms-delivery-status)
- [ms-driver-operations](https://github.com/jadodev/ms-driver-operations)
- [api-gateway-compose](https://github.com/jadodev/api-gateway-compose)
- [ms-shipment-service](https://github.com/jadodev/ms-shipment-service)

## Archivos y Carpetas Adicionales

Una vez clonados los repositorios, asegúrate de que en el directorio raíz del proyecto se encuentren:

- El archivo `docker-compose.yml`
- La carpeta `mysql`, la cual puedes obtener desde:  
  [up-coord-chall-compose](https://github.com/jadodev/up-coord-chall-compose)

Estos elementos son necesarios para orquestar y levantar toda la arquitectura, incluyendo la base de datos MySQL.

## Pre requisitos
```bash
Docker version 27.4.0, build bde2b89
Docker Compose version v2.31.0-desktop.2
Node v20.0
```
## Iniciar el Proyecto

Con todos los repositorios y archivos necesarios en su lugar, abre una terminal en el directorio raíz del proyecto y ejecuta:

```bash
docker-compose up --build
```

Este comando:
- Construirá las imágenes Docker de cada microservicio.
- Levantará todos los contenedores necesarios (incluyendo MySQL, Kafka, Zookeeper, Redis y el API Gateway).
- Inicializará la arquitectura completa del sistema.

Una vez que Docker Compose haya finalizado la construcción y el levantamiento de los servicios, podrás acceder a los endpoints de los microservicios y comenzar a interactuar con la solución.

Accede para confirmar que el api-gateway está arriba:
 ```bash
localhost:5000/health
``` 

---

# Arquitectura del Sistema de Transporte

## Diagrama de Arquitectura

![Diagrama de Arquitectura](/assets/Diagram.svg)

## Visión General

Nuestro sistema está diseñado para enfrentar los retos críticos de una empresa transportista moderna:  
- **Gestión en tiempo real:** Seguimiento y actualización de envíos, estado del conductor, ubicaciones y fechas estimadas de entrega.  
- **Escalabilidad y complejidad:** Manejo de altos volúmenes de información y numerosos estados, con la capacidad de escalar cada componente de forma independiente.  
- **Flexibilidad:** Integrar nuevas funcionalidades y servicios sin interrumpir la operación actual.

## Arquitectura Basada en Microservicios y Eventos

La solución se basa en una **arquitectura hexagonal** y se compone de microservicios desacoplados que se comunican mediante eventos. Esto permite que cada servicio se enfoque en su responsabilidad específica y que el sistema crezca de manera modular.

### Microservicios Independientes

- **Shipment Service**  
  - **Función:** Gestión de envíos.  
  - **Características:** Crea y administra envíos y emite eventos como `ShipmentCreated`.

- **Delivery Status Service**  
  - **Función:** Seguimiento y actualización del estado de entrega de los envíos.  
  - **Características:** Registra ubicación, fechas importantes, intentos de entrega y estado actual.

- **Driver Operations Service**  
  - **Función:** Gestión en tiempo real de la información de los conductores (ubicación, capacidad, estado, etc.).  
  - **Características:** Actualiza y consulta datos críticos del conductor y utiliza un atributo `currentGridZone` para agrupar conductores según su ubicación en un grid preestablecido.

- **Dispatch Service**  
  - **Función:** Asignación óptima de envíos a conductores.  
  - **Características:** Utiliza un algoritmo que simula distancias (entre 1 y 200 km) y calcula un “score” basado en tiempo y costo para seleccionar el conductor óptimo.  
  - **Nota:** Se emplea un sistema de grillas para reducir la complejidad computacional al filtrar candidatos.

### Comunicación Basada en Eventos

- **Broker:** Apache Kafka  
- **Ventajas:**  
  - **Desacoplamiento:** Los productores de eventos no conocen a sus consumidores.  
  - **Escalabilidad y Resiliencia:** Permite la comunicación asíncrona, facilitando reintentos y tolerancia a fallos.  
  - **Flexibilidad:** Nuevos servicios se pueden suscribir a eventos existentes sin modificar la lógica del emisor.

### API Gateway

El API Gateway actúa como un punto único de entrada para los clientes y ofrece las siguientes funcionalidades:

- **Reverse Proxy:**  
  Redirige las solicitudes HTTP a los microservicios correspondientes mediante rutas definidas.

- **Autenticación y Autorización:**  
  Centraliza la validación de tokens (JWT) y los permisos, evitando replicar esta lógica en cada microservicio.

- **Caching:**  
  Implementa un middleware de caching con Redis para mejorar el rendimiento de los endpoints GET.

- **Logging y Manejo de Errores:**  
  Proporciona una capa centralizada para la monitorización y el manejo uniforme de errores.

### Contenedorización

Cada componente del sistema se ejecuta en contenedores Docker, orquestados mediante Docker Compose. Esto asegura un entorno consistente, facilita el escalado y simplifica el despliegue.

---

## Diagrama de Arquitectura

*Nota: Reemplaza `./images/architecture-diagram.png` por la ruta real de tu imagen de arquitectura.*

---

## Ventajas Clave de Nuestra Solución

- **Escalabilidad y Resiliencia:**  
  Cada microservicio se escala de forma independiente y la comunicación asíncrona a través de eventos mejora la tolerancia a fallos.

- **Desacoplamiento:**  
  Los servicios están aislados en términos de responsabilidad. Por ejemplo, el Shipment Service se encarga únicamente de gestionar envíos, sin preocuparse por el estado del envío o la asignación de conductores.

- **Flexibilidad:**  
  Es sencillo agregar nuevos microservicios (como análisis en tiempo real o auditoría) que se suscriban a los eventos existentes.

- **Mantenimiento Simplificado:**  
  La separación en capas (dominio, aplicación, infraestructura) permite un mantenimiento y pruebas más fáciles, asegurando que la lógica de negocio se mantenga independiente de los detalles de implementación.

- **Interfaz Unificada con el API Gateway:**  
  Los clientes interactúan con un único punto de entrada, mientras que el API Gateway se encarga del ruteo, autenticación, autorización y caching, liberando a los microservicios de estas preocupaciones transversales.

---


