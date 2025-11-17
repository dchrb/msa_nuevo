# Blueprint de la Aplicación de Fitness

## Plan de Cambios Actuales

**Objetivo:** Implementar un plan de entrenamiento semanal precargado, asignando cada rutina a un día específico de la semana.

**Pasos Realizados:**
1.  **Renombrar y Asignar Rutinas:** Se modificó la lógica de creación de rutinas (`lib/data/default_routines.dart`) para nombrar cada rutina según el día de la semana que le corresponde (ej. "Lunes: Cuerpo Completo A").
2.  **Plan Semanal Completo:** Se crearon 4 entradas de rutina para cubrir los días de entrenamiento de la semana: Lunes, Miércoles, Viernes y Sábado.
3.  **Lógica de Actualización:** Se añadió un mecanismo para eliminar las rutinas con el formato de nombre antiguo y reemplazarlas por el nuevo formato basado en días.

---

## Descripción General

Esta es una aplicación de fitness desarrollada en Flutter, diseñada para ayudar a los usuarios a crear, seguir y gestionar sus rutinas de entrenamiento. La aplicación permite a los usuarios construir una biblioteca personal de ejercicios, agruparlos en rutinas personalizadas y registrar su progreso.

## Características Implementadas

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

- **Implementación Inicial de Rutinas por Defecto:** Se añadió la lógica para crear un conjunto de rutinas de entrenamiento la primera vez que se inicia la aplicación.
- **Ampliación y Corrección de la Base de Datos de Ejercicios:** Se reorganizó y limpió la lista inicial de ejercicios para asegurar la correcta categorización por grupo muscular. Se añadieron 6 nuevos ejercicios para completar las categorías de "Espalda" y "Abdomen", resultando en una base de datos de 60 ejercicios.
- **Funcionalidades Avanzadas para el Historial:** Se implementó el borrado de sesiones con gesto de deslizar, la opción de "Deshacer" y el filtrado por fecha.
- **Mejora Visual del Historial:** Se rediseñó la pantalla del historial con tarjetas de resumen y un estado vacío mejorado.
- **Corrección de UI en Biblioteca:** Se solucionó un error de botones flotantes duplicados y se mejoró la coherencia de la interfaz.
