//NOMBRABLE

// ignore_for_file: non_constant_identifier_names, unnecessary_this, unused_field

import '../Modulo Citas/solicitud.dart';
import '../Modulo Citas/cita.dart';
import '../Patron Observador Actividades/observador_registro.dart';
import 'pacientes.dart';

abstract class Nombrable {
  String getNombre();
}

//UBICACION

class Ubicacion extends Nombrable {
  String? pais;
  String? estado;
  String? ciudad;

  Ubicacion(this.pais, this.estado, this.ciudad);

  @override
  String getNombre() {
    return '${this.pais} / ${this.estado} / ${this.ciudad}';
  }
}

//ESPECIALIDADES

abstract class Especialidad extends Nombrable {
  examenMedico();
}

class Cardiologo implements Especialidad {
  @override
  getNombre() {
    return 'Cardiologo';
  }

  @override
  examenMedico() {
    //Aqui van las especificaciones medicas tratadas en esta especialidad
    /* ¡¡¡ ACLARACION !!!: Se sabe que es una muy mala practica instanciar objetos dentro de una clase en si,
        pero para efectos de esta entrega y la simulacion de este caso de uso, se agilizara el proceso de esta manera
        rellenando aqui el examen medico */

    // var exMed = {
    //     presionArterial: 120,
    //     antecedentesPersonales: ['Obesidad'],
    //     altura: '1.75 m',
    //     peso: '112 kg',
    //     colesterol: '95 mg/dl',
    //     frecuenciaCardiaca: '75 ppm'
    // }
    // return exMed;
  }
}

class Peidatra implements Especialidad {
  @override
  getNombre() {
    return 'Pediatra';
  }

  @override
  examenMedico() {
    //Aqui van las especificaciones medicas tratadas en esta especialidad
    return {};
  }
}

class Neurologo implements Especialidad {
  @override
  getNombre() {
    return 'Neurologo';
  }

  @override
  examenMedico() {
    //Aqui van las especificaciones medicas tratadas en esta especialidad
    return {};
  }
}

//DOCTOR
class Doctor extends ObservableAuditoria {
  String? _nombre;
  List<Especialidad>? _especializaciones = [];
  Ubicacion? _consultorio;
  List<Cita>? _historialCitas;

  Doctor(String nombre, List<Especialidad> especializaciones,
      Ubicacion consultorio, ObservadorRegistro o)
      : super(o) {
    this._nombre = nombre;
    this._especializaciones = especializaciones;
    this._consultorio = consultorio;
  }

  String getNombre() {
    return "Dr. " + this._nombre!;
  }

  List<Especialidad> getEspecializaciones() {
    return this._especializaciones!;
  }

  @override
  void add(ObservadorRegistro o) {
    this.observador = this.observador;
  }

  @override
  void notify(List arreglo) {
    this.observador.registrar(arreglo);
  }

  // addRegistroMed(RegistroMedico registro, Paciente paciente) {
  //     var HistorialMedico historia = paciente.obtenerHistorial();
  //     historia.agregarRegistro(registro);
  //     historia.mostrarRegistro();
  // }

  // crearRegistroMedico(Paciente paciente, Cita cita) {

  //     /*
  //         Se debe verificar si el paciente tiene o no tiene historia medica
  //         si no tiene debe ser creada
  //     */
  //     if (paciente._historia === undefined) {
  //         paciente._historia = new HistorialMedico();
  //         this.notify([this.getNombre(),new Date(Date.now()).toLocaleString(),paciente.getNombre(),"Creó historia médica"])
  //     }
  //     //La Cita pasa a estar en curso
  //     cita.actualizarStatus(StatusCita.enCurso);
  //     /*
  //         El metodo debe recibir el tipo de especializacion a la cual sera atendido
  //         ya que el doctor puede tener varias especializaciones

  //     */
  //     int espIndex  = 0;
  //     for (var  i  = 0; i < this._especializaciones!.length; i++) {
  //         if (this._especializaciones![i].getNombre() == cita.especialidad.getNombre()) {
  //             espIndex = i;
  //         }
  //     }
  //     var exMed = this._especializaciones[espIndex].examenMedico();
  //     cita.actualizarStatus(StatusCita.finalizada);
  //     var registro1 = new RegistroMedico(exMed, new NotificacionPush());
  //     this.addRegistroMed(registro1, paciente);
  //     this.notify([this.getNombre(),new Date(Date.now()).toLocaleString(),paciente.getNombre(),"Creó registro médico"])
  // }

  // Cita agendarCita(Paciente paciente, DateTime fecha, Solicitud solicitud) {
  //     SMS notificacion = new SMS()
  //     Cita cita;
  //     if (solicitud.getTipo() == TipoCita.Presencial) {
  //         cita = new Presencial(paciente, fecha, solicitud.getEspecialidad(), notificacion)

  //     } else {
  //         cita = new Telemedicina(paciente, fecha, solicitud.getEspecialidad(), notificacion)
  //     }

  //     this._historialCitas.add(cita);
  //     return cita;

  // }

  modificarHistoriaMedica(Paciente paciente) {}
}

//BUSQUEDA DE DOCTORES
// export class BuscarDoctor {
//     Doctores: Doctor[];

//     buscarDoctor<tipoE>(E: tipoE): void {

//         return;
//     }

//     buscarTopDoctor(): void {

//         return;
//     }
// }
