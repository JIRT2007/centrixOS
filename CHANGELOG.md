# Registro de cambios:

### Notas v0.1.0:
- Se incluyeron nuevos temas para personalizar CentrixCL.
- Se removio el modulo de mpris para Waybar mas el mismo sigue estando en el codigo `config.jsonc`, solo es necesario descomentarlo.

### Notas v0.0.9:
- CentrixOS presenta su nueva version 0.0.9 sobre ArchLinux como base, esto presenta una nueva customización con un tema nuevo llamado "Retro-Punch" y con un nuevo nombre que se empezara a emplear en el changelog a partir de la v1.0.0, el mismo se trata de CentrixCL (Customization Layer).
- Se sumaron mejorar a la utilidad de `cmenu` para ofrecer una gestión basica del protocolo SSH, el mismo necesita ser instalado previamente a su uso.
- La nueva configuración de Hyprland se realiza en el lenguaje `.lua` y se emplean nuevos programas como Hyprpaper, Hyprshot, Playerctl, etc.
- De forma momentanea se suspende la opción para cambiar el tema en la utilidad de `cmenu` hasta que se desarrollen nuevos temas.
- CentrixOS NO instalara ningun paquete de software el cual de su origen desde AUR, solamente repositorios nativos de ArchLinux.
- Esta versión puede contener fallas que seran solucionadas en proximos lanzamientos.

### Notas v0.0.8 (Inestable):
- Se decidio en mantener la web oficial del proyecto en ingles y el repositorio principal en español.
- Se removio wlogout.
- Nueva utilidad para el sistema llamada "Centrix control" la misma se ejecuta desde terminal y puede iniciarse mediante el comando `ctrix` y permite una automatización de herramientas simples donde se incluye el selector de temas para customizar CentrixOS, un menu de gestion de energia y un menu simple para gestionar VMs mediante QEMU.
- Se incorporo QEMU para CPUs x86_64 en la instalación del sistema.
- La versión 0.0.8 de CentrixOS sera la ultima en funcionar con base Debian 13 Trixie, para la v0.0.9 la base para la capa de personalización sera ArchLinux y se incorporara una nueva reforma a los temas de customización y se implementara el lenguaje `.lua` para la configuración de Hyprland.
- La v0.0.8 aun estara disponible para descargar en la web pero la misma ya no recibira actualizaciones.
- Este cambio de base no es definitivo y puede estar sujeto a reimplementaciones a otras bases.

### Notas v0.0.7 (Inestable):
- Se cancelo la opción para tener Sway como entorno de escritorio alternativo a Hyprland y se deja este ultimo como unica opción.
- Oficialmente el proyecto de CentrixOS tiene su propia web mediante GitHub Pages. https://jirt2007.github.io/webCENTRIX/
- Se agrego una función para cambiar el tema de CentrixOS entre las configuraciones que se ofrecen, los mismos temas se actualizan automaticamente.
- Se modifico el wallpaper del tema "Purple-Swirl".
- Nuevo tema para CentrixOS llamado "Blue-Depression".
- Se retira la nomenclatura de versiones inspirado en los signos zodiacales.
- El script de instalación de CentrixOS se tradujo al ingles.
- Se incorporo una nueva opción en el script para habilitar los Debian Trixie/Backports.

### Notas v0.0.6 (Inestable): 
- Se reconsidero la opción de utilizar Openbox como entorno de remplazo en Hyprland y se opto por ofrecer Sway como entorno de escritorio secundario a elección del usuario, el mismo esta en desarrollo.
- Se agrego para Hyprland un nuevo tema de personalización llamado "Shadow-Dance" con colores mayormente monocromaticos destacando el blanco.

### Notas v0.0.5 (Inestable):
- CentrixOS v0.0.5 representa la primer version con nomenclatura "Inestable" y representa una nueva etapa para el desarrollo del proyecto de CentrixOS. Esta versión se diseña para renovar la experiencia visual del proyecto y agregar nuevas funcionalidades que las versiones experimentales no incorporaban. 
- Nueva función del script de instalacion de CentrixOS para poder elegir entre dos variantes de personalización para Hyprland (Purple-Swirl y Green-Forest).
- Se removio la utilidad de Calcurse para tener un calendario via terminal.
- ASCII art personalizado para fastfetch.
- Planeamos implementar en el menu de instalación de CentrixOS la opción de instalar el sistema con OpenBox como entorno de escritorio junto a Hyprland. Se esta analizando remplazar Hyprland en futuras versiones para tener OpenBox como entorno de escritorio principal.

### Notas v0.0.4 (Experimental):
- Se agrego Chromium como navegador web remplazando a Brave Browser.
- Nuevas modificaciones para el script de instalación.
- Se implementaron nombres clave para las versiones de CentrixOS a partir de la v0.0.4 inspirados en los signos zodiacales.
- Se implemento una configuración de Fastfetch personalizado y el comando `VERSION` para visualizar la version que se utiliza de CentrixOS.
- Se modifico la función `--app` para los agentes de inteligencia artificial para que los mismos funcionen con Chromium Browser.
- Se habilito por defecto la opción `resize_on_border` para poder redimensionar las ventanas cuando se encuentran en modo floating.

### Notas v0.0.3 (Experimental):
- Se realizaron mejoras en el script de instalación.
- Se unificaron los scripts de `pre-install.sh` e `install.sh` en un solo script de instalación.
- Se modificaron los nombres de los directorios internos.
- Se esta trabajando en un proceso de actualización para el script.

### Notas v0.0.2 (Experimental):
- Se agrego Brave Browser como navegador (Necesario para ciertas funciones).
- Nuevas personalizaciones en Wofi y Waybar.
- Se agrego calcurse y btop como programas de terminal y Grim para realizar screenshots .
- Incorporamos nuevos archivos ***.desktop*** dentro del direcotrio de **~/.local/share/applications** para poder ejecutar modelos de IA (ChatGPT, ClaudeCode y Google Gemini) mediante la funcion **--app** que nos ofrecen los navegadores base Chromium.
- Se recomienda realizar pruebas de CentrixOS en Virtual Machines previo a realizar una instalación sobre hardware fisico.

### Notas v0.0.1 (Experimental):
- CentrixOS no es una distribución de GNU/Linux independiente ni basada en alguna ya existente, es unicamente una capa de personalización.
- Este proyecto aún está en fase de desarrollo por lo que no se recomienda confiar ciegamente en el proceso de instalación, se esta trabajando en las mejoras y correcciones.
- El objetivo principal del mismo es ser una capa de personalización sobre Debian usando paquetería de repositorios oficiales y de Trixie/Backports.
- Se necesita tener configurados los repositorios de Trixie/Backports previo a la ejecución del script.
- NO se debe de ejecutar el script como root ni usando sudo, se recomienda asignarle permisos de ejecución mediante `chmod +x`.
- La customización emplea ***zsh*** como shell del sistema con personalización de ***StarShip***.
- Todas las fallas serán corregidas con el desarrollo de las versiones nuevas.
