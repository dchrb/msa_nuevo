# Blueprint de la Aplicación de Fitness

## Plan de Cambios Actuales

**Objetivo:** Rediseñar la pantalla de inicio para que sea más personalizada, motivadora y funcional.

**Pasos a Seguir:**

1.  **Implementar Saludo Dinámico:**
    *   Cambiar el saludo estático por uno que varíe según la hora del día ("Buenos días", "Buenas tardes", "Buenas noches").

2.  **Mostrar Metas de Progreso Claras:**
    *   Actualizar los indicadores de progreso diario para mostrar el valor actual junto al objetivo (ej. "1500 / 2500 ml").

3.  **Activar la Tarjeta de Entrenamiento del Día:**
    *   En lugar de "Pendiente", mostrar la rutina de entrenamiento asignada al día actual según el plan semanal predefinido.
    *   Añadir un botón para iniciar el entrenamiento directamente.

4.  **Añadir Frase Motivacional Diaria:**
    *   Crear una nueva tarjeta que muestre un consejo de fitness o una frase motivadora que cambie cada día.

5.  **Pulir la Interfaz de Usuario:**
    *   Reorganizar la disposición de los elementos para integrar las nuevas funcionalidades.
    *   Reemplazar la imagen de fondo por una textura o un diseño más profesional y limpio.

---

## Descripción General

Esta es una aplicación de fitness desarrollada en Flutter, diseñada para ayudar a los usuarios a crear, seguir y gestionar sus rutinas de entrenamiento. La aplicación permite a los usuarios construir una biblioteca personal de ejercicios, agruparlos en rutinas personalizadas y registrar su progreso.

## Características Implementadas

- **Gráficos de Progreso Avanzados:** Gráficos de línea interactivos para el seguimiento del peso y el consumo de agua, con indicadores de máximo/mínimo y líneas de objetivo.
- **Seguimiento de Progreso a Largo Plazo:** Pantalla dedicada para visualizar el progreso de peso y el resumen de actividad semanal.
- **Dashboard Diario:** Vista principal centrada en el progreso del día actual (calorías, agua, entrenamiento).
- **Plan de Entrenamiento Semanal por Día:** La aplicación incluye un plan de entrenamiento semanal precargado y asignado a días específicos.
- **Gestión de Ejercicios y Rutinas:** Biblioteca de ejercicios y creación de rutinas personalizadas.
- **Seguimiento de Entrenamientos:** Historial de entrenamientos con funcionalidades avanzadas.

## Plan de Cambios Anteriores

- **Mejora de Gráficos de Progreso:** Se rediseñaron los gráficos de peso y agua para incluir interactividad, indicadores de máximo/mínimo y líneas de objetivo.
- **Añadir Seguimiento de Consumo de Agua:** Se añadió una tarjeta a la pantalla de progreso con un gráfico del consumo de agua semanal.
- **Implementación Inicial de Rutinas por Defecto:** Se añadió la lógica para crear un conjunto de rutinas de entrenamiento la primera vez que se inicia la aplicación.
- **Ampliación y Corrección de la Base de Datos de Ejercicios:** Se reorganizó y limpió la lista inicial de ejercicios.
- **Funcionalidades Avanzadas para el Historial:** Se implementó el borrado de sesiones, "Deshacer" y filtro por fecha.
- **Rediseño de la Interfaz Principal y Corrección de Errores:** Se separó el progreso a largo plazo del resumen diario y se corrigieron errores del analizador.
