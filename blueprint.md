# Blueprint de la Aplicación de Fitness

## Plan de Cambios Actuales

**Objetivo:** Mejorar los gráficos de la pantalla de progreso para que ofrezcan una visualización de datos más rica y útil.

**Pasos a Seguir:**

1.  **Mejoras para el Gráfico de Progreso de Peso (Gráfico de Línea):**
    *   **Indicadores de Máximo y Mínimo:** Resaltar visualmente los puntos de peso más alto y más bajo en el período seleccionado.
    *   **Línea de Objetivo de Peso:** Dibujar una línea discontinua que represente el peso objetivo del usuario (si está definido).
    *   **Interactividad:** Mostrar un tooltip con el peso y la fecha exactos al tocar un punto en el gráfico.

2.  **Mejoras para el Gráfico de Consumo de Agua:**
    *   **Cambio a Gráfico de Línea:** Convertir el gráfico de barras actual a un gráfico de línea para mayor coherencia visual y mejor representación de tendencias.
    *   **Línea de Objetivo Diario:** Añadir una línea horizontal para la meta de consumo de agua.
    *   **Indicadores de Objetivo Cumplido:** Cambiar el color de los puntos del gráfico para los días en que se alcanzó la meta.
    *   **Interactividad:** Habilitar tooltips que muestren la cantidad de agua y la fecha al tocar un punto.

---

## Descripción General

Esta es una aplicación de fitness desarrollada en Flutter, diseñada para ayudar a los usuarios a crear, seguir y gestionar sus rutinas de entrenamiento. La aplicación permite a los usuarios construir una biblioteca personal de ejercicios, agruparlos en rutinas personalizadas y registrar su progreso.

## Características Implementadas

- **Seguimiento de Progreso a Largo Plazo:**
  - Pantalla dedicada para visualizar el progreso de peso y el resumen de actividad semanal.
  - Gráficos y métricas para una visión clara de la evolución.
- **Dashboard Diario:**
  - Vista principal centrada en el progreso del día actual (calorías, agua, entrenamiento).
- **Plan de Entrenamiento Semanal por Día:**
  - La aplicación incluye un plan de entrenamiento semanal precargado y asignado a días específicos.
  - Las rutinas (`Lunes: Cuerpo Completo A`, `Miércoles: Cuerpo Completo B`, `Viernes: Cuerpo Completo A`, `Sábado: Cardio y Core`) se crean automáticamente.
  - Están diseñadas para hacerse en casa y solo requieren peso corporal.
- **Gestión de Ejercicios:**
  - Biblioteca con 60 ejercicios iniciales, organizados en 6 grupos musculares.
  - Búsqueda y filtrado de ejercicios.
  - Creación, edición y eliminación de ejercicios personalizados.
- **Gestión de Rutinas:**
  - Creación y edición de rutinas personalizadas.
- **Seguimiento de Entrenamientos:**
  - Inicio de entrenamientos basados en rutinas.
  - Historial de entrenamientos con borrado, deshacer y filtro por fecha.

## Plan de Cambios Anteriores

- **Mejora pantalla de progreso con filtros y gráficos avanzados:** Se han añadido filtros por rango de fechas, un nuevo gráfico de radar para las medidas corporales y hemos mejorado el gráfico de progreso de peso a un gráfico de línea.
- **Añadir Seguimiento de Consumo de Agua:**
    - Se ha añadido una nueva tarjeta (`_buildWaterIntakeCard`) a la pantalla de progreso (`progreso_screen.dart`).
    - Esta tarjeta muestra un **gráfico de barras** con el consumo de agua de los últimos 7 días.
- **Implementación Inicial de Rutinas por Defecto:** Se añadió la lógica para crear un conjunto de rutinas de entrenamiento la primera vez que se inicia la aplicación.
- **Ampliación y Corrección de la Base de Datos de Ejercicios:** Se reorganizó y limpió la lista inicial de ejercicios para asegurar la correcta categorización por grupo muscular. Se añadieron 6 nuevos ejercicios para completar las categorías de "Espalda" y "Abdomen", resultando en una base de datos de 60 ejercicios.
- **Funcionalidades Avanzadas para el Historial:** Se implementó el borrado de sesiones con gesto de deslizar, la opción de "Deshacer" y el filtrado por fecha.
- **Mejora Visual del Historial:** Se rediseñó la pantalla del historial con tarjetas de resumen y un estado vacío mejorado.
- **Corrección de UI en Biblioteca:** Se solucionó un error de botones flotantes duplicados y se mejoró la coherencia de la interfaz.
- **Rediseño de la Interfaz Principal y Corrección de Errores:** Se rediseñó la interfaz principal para separar el progreso a largo plazo del resumen diario, se conectó la nueva pantalla de progreso con los datos reales del usuario y se corrigieron los errores detectados por el analizador de código.
