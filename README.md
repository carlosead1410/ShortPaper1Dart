# ShortPaper1 - Dart

## Características del Repositrorio
### Este es el repositorio de Dart del primer shortpaper de la Materia de Desarrollo del Software.
Elaborado por: Subgrupo 1 - Code Rebels 
- Carlos Arriaga
- Christian Sanchez
- Tadeo Vazquez


### Requerimientos
- Debe tener instalado el sdk de dart en su computadora

### Aportes Significativos

|   Integrante               |    Commit|
| :------------: | ------------ |
|  Carlos Arriaga |[1. Agregando las clases del modulo de suscripccion](https://github.com/carlosead1410/ShortPaper1Dart/commit/6f4ecfbb574576ea9f2dd5f85c34cf19e8c8f768 "Agregando las clases del modulo de suscripccion") <br/> [2. Iniciando el caso de uso de solicitar cita con suscripccion BLOQUEADA](https://github.com/carlosead1410/ShortPaper1Dart/commit/e3a27042484ee48f88dd756ae76d4b63f79c151e "Iniciando el caso de uso de solicitar cita con suscripccion BLOQUEADA")<br/>[Completando el caso de uso de solicitar cita con suscripccion bloqueada](https://github.com/carlosead1410/ShortPaper1Dart/commit/d976e15e8bfed48f5d926741da2596aace4c6545 "Completando el caso de uso de solicitar cita con suscripccion bloqueada")|
|   Christian Sanchez |[1.Creacion del Modulo Cita, Modulo Notificacion y Modulo Historia Medica](https://github.com/carlosead1410/ShortPaper1Dart/commit/0accd238861c62830b7e8f82e5f6983ff5514149 "Creacion del Modulo Cita, Modulo Notificacion y Modulo Historia Medica")<br/>[2. Creacion del Caso de Uso Cancelacion de Cita Paciente](https://github.com/carlosead1410/ShortPaper1Dart/commit/46f18b66325b8c16986e2e4cabace909dad10cbf "2. Creacion del Caso de Uso Cancelacion de Cita Paciente")<br/>[3. Realizacion del caso de uso busqueda doctor por especialidad y ubicacion](https://github.com/carlosead1410/ShortPaper1Dart/commit/02240fa00901d542d9511804e1642677c08d25c2 "3. Realizacion del caso de uso busqueda doctor por especialidad y ubicacion")|
|   Tadeo Vazquez|[1. TADEO - CASO DE USO: comentario y valoracion de cita realizada por paciente](https://github.com/carlosead1410/ShortPaper1Dart/commit/5f645d59c11092c31275c4f3426f8909f3d32efc "1. TADEO - CASO DE USO: comentario y valoracion de cita realizada por paciente")<br>[2. TADEO - CASO DE USO: Registro de comportamiento de usuarios](https://github.com/carlosead1410/ShortPaper1Dart/commit/0df89c28d25505a382ee3a84c47ab4fa3ddf67bb "TADEO - CASO DE USO: Registro de comportamiento de usuarios") |


<hr>


### Explicacion para probar el proyecto
Al hacer un <span style="color:#FF9999;">git clone</span> del proyecto, descargara el proyecto de dart y en la carpeta bin se encontrara un archivo llamado "apartado3.dart" donde se encuentra la implementacion de los casos de uso y el metodo main, para probar los casos de uso, usted debera descomentar la linea de codigo donde se hace el llamado a la funcion del caso de uso y ejecutar el programa

IMPORTANTE: Cuando descargue el proyecto, hagalo en una carpeta llamada "apartado3" para que no tenga conflictos con las importaciones de los modulos
  
  1. `cu_solicitarCitaBloqueada();`
Esta funcion representa la simulacion de cuando un Paciente solicita una cita con el doctor pero su suscripccion fue bloqueada por el administrador del sistema por un mal uso del mismo, debera observar un comentario que diga lo siguiente: "'Su suscripccion fue BLOQUEADA por un mal uso del sistema, NO podra solicitar Citas'"

  2. `cu_cancelarCitaPaciente();`
Esta funcion representa la simulacion de cuando un Pacinete cancela su cita con el doctor, debe aparecer un mensaje que diga "El paciente cancelo la cita" y se debe guardar el registro de esa actividad

  3.  `cu_buscarDoctorEspecialidad();`
Esta funcion representa la simulacion en la que el Paciente busca un doctor por su Especialidad, este metodo retorna una lista de doctores que cumplan con dicha especialidad

  4. `cu_buscarDoctorUbicacion();`
Esta funcion representa la simulacion en la que el Paciente busca un doctor por su Ubicacion, este metodo retorna una lista de doctores que cumplan con dicha Ubicacion

  5. `cu_crearFeedback();`
Esta funcion representa la simulacion del proceso en el que el Paciente crea un feedback (Valoracion y Comentario) hacia la cita que tuvo con el doctor




### Observacion
Los commits que se colocaron en la tabla fueron los ultimos commits con los que se completaron la implementacion de los casos de uso, esos casos de uso fueron implementados en varios commits.
