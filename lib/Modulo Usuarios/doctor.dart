//NOMBRABLE

// ignore_for_file: non_constant_identifier_names, unnecessary_this, unused_field, avoid_shadowing_type_parameters

import '../Modulo Citas/solicitud.dart';
import '../Modulo Citas/cita.dart';
import '../Modulo Historia Medica/historial_medico.dart';
import '../Modulo Notificaciones/notificacion.dart';
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

  addRegistroMed(RegistroMedico registro, Paciente paciente) {
    HistorialMedico historia = paciente.obtenerHistorial();
    historia.agregarRegistro(registro);
    historia.mostrarRegistros();
  }

  crearRegistroMedico(Paciente paciente, Cita cita) {
    /*
          Se debe verificar si el paciente tiene o no tiene historia medica
          si no tiene debe ser creada
      */
    if (paciente.historia == null) {
      paciente.historia = HistorialMedico();
      this.notify([
        this.getNombre(),
        DateTime.now().toString(),
        paciente.getNombre(),
        "Creó historia médica"
      ]);
    }
    //La Cita pasa a estar en curso
    cita.actualizarStatus(StatusCita.EnCurso);
    /*
          El metodo debe recibir el tipo de especializacion a la cual sera atendido
          ya que el doctor puede tener varias especializaciones

      */
    int espIndex = 0;
    for (var i = 0; i < this._especializaciones!.length; i++) {
      if (this._especializaciones![i].getNombre() ==
          cita.especialidad!.getNombre()) {
        espIndex = i;
      }
    }
    var exMed = this._especializaciones![espIndex].examenMedico();
    cita.actualizarStatus(StatusCita.Finalizada);
    var registro1 = RegistroMedico(exMed, NotificacionPush());
    this.addRegistroMed(registro1, paciente);
    this.notify([
      this.getNombre(),
      DateTime.now().toString(),
      paciente.getNombre(),
      "Creó registro médico"
    ]);
  }

  Cita agendarCita(Paciente paciente, DateTime fecha, Solicitud solicitud) {
    SMS notificacion = SMS();
    Cita cita;
    if (solicitud.getTipo() == TipoCita.Presencial) {
      cita = Presencial(
          fecha, paciente, solicitud.getEspecialidad(), notificacion);
    } else {
      cita = Telemedicina(
          fecha, paciente, solicitud.getEspecialidad(), notificacion);
    }

    this._historialCitas?.add(cita);
    return cita;
  }

  modificarHistoriaMedica(Paciente paciente) {}
}

//BUSQUEDA DE DOCTORES
class BuscarDoctor {
  List<Doctor> Doctores = [];

  BuscarDoctor(this.Doctores);

  void buscarTopDoctor() {
    return;
  }

  bool buscarEspecialidad(Doctor d, Especialidad e) {
    for (var especialidad in d.getEspecializaciones()) {
      if (e.getNombre() == especialidad.getNombre()) {
        return true;
      }
    }
    return false;
  }

  List<Doctor> filtrarLista(Especialidad e) {
    List<Doctor> listaFiltrada =
        Doctores.where((doctor) => buscarEspecialidad(doctor, e) == true)
            .toList();
    return listaFiltrada;
  }

  List<Doctor> filtrarListaU(Ubicacion u) {
    List<Doctor> listaFiltrada = Doctores.where(
        (doctor) => doctor._consultorio?.getNombre() == u.getNombre()).toList();
    return listaFiltrada;
  }
  /*
  List<Doctor> filtrarLista(Ubicacion u, String lugar) {
    List<Doctor> listaFiltrada = Doctores.where(
        (doctor) => doctor._consultorio?.getNombre() == u.getNombre()).toList();
    return listaFiltrada;
  }
  */
}
