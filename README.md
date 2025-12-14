
# Sistema de Gestión de Tareas (NUVYY)

## Instalación Local

1. Clonar el repositorio.
2. Crear un entorno virtual:
   `python -m venv .venv`
3. Activar el entorno:
   - Windows: `.venv\Scripts\activate`
   - Mac/Linux: `source .venv/bin/activate`
4. Instalar dependencias:
   `pip install -r requirements.txt`
5. Base de Datos:
   - Crear una base de datos en MySQL llamada `sistema_tareas`.
   - Importar los archivos `schema.sql` y `seeds.sql` que están en la carpeta del proyecto.
6. Ejecutar:
   `python server/app.py`
