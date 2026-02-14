# KiCad PCB Design Automation with Docker

Este proyecto integra un ESP32, un regulador HT7333A y un sensor siguiendo el esquema proporcionado.

## Requisitos
- Docker instalado.
- Make (opcional, facilita la ejecución).

## Instrucciones de Uso

### 1. Construir la imagen de Docker
Si es la primera vez, construye la imagen que contiene KiCad 8 y las herramientas necesarias:
```bash
docker build -t kicad-automation .
```

### 2. Ejecutar la Automatización
Puedes usar el `Makefile` para generar los archivos de fabricación (Gerbers, BOM, PDF) automáticamente:

**En Linux/Mac:**
```bash
docker run --rm -v $(pwd):/project kicad-automation make all
```

**En Windows (PowerShell):**
```powershell
docker run --rm -v ${PWD}:/project kicad-automation make all
```

### Archivos Generados
- `fabrication/gerbers/`: Archivos para enviar a fabricar la PCB.
- `fabrication/bom/`: Listado de componentes (CSV).
- `docs/`: Esquemático y diseño de PCB en formato PDF para revisión rápida.

## Notas sobre el Diseño
- El sensor está conectado a **GPIO34** del ESP32.
- La alimentación del sensor proviene de la salida de **3.3V** del HT7333A.
- Se ha incluido un borde de placa de **100mm x 50mm** en el archivo `.kicad_pcb`.
