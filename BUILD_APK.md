Generar APK (usando GitHub Actions)
===================================

Si no tienes Flutter/Android SDK instalado en tu máquina, puedes usar el workflow de GitHub Actions incluido para compilar un APK de `debug` y descargarlo desde la interfaz de Actions.

Cómo usarlo:

1. Haz push de los cambios a GitHub en la rama `main` (o crea una rama y abre PR).
2. En el repositorio en GitHub, ve a la pestaña `Actions`.
3. Selecciona el workflow `Build APK` y pulsa `Run workflow` (puedes dejar las opciones por defecto).
4. Espera a que termine la ejecución (suele tardar varios minutos la primera vez).
5. En la ejecución finalizada, abre la sección `Artifacts` y descarga `app-debug-apk`.

Notas:
- El workflow compila un `app-debug.apk` (debug). Para release necesitas configurar firma y secretos.
- Si el build falla por versiones de Android SDK, abre los logs en Actions y añade los componentes SDK necesarios.

Si prefieres que yo dispare la ejecución (requiere que el repo esté en GitHub y que tengas permisos), dímelo y la lanzo desde aquí.
