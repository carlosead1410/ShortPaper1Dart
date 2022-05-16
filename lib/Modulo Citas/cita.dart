import 'package:apartado3/Modulo%20Notificaciones/patron_observador.dart';
import 'package:apartado3/Modulo%20Usuarios/pacientes.dart';
import '../Modulo Usuarios/doctor.dart';
import '../Modulo Historia Medica/historial_medico.dart';

import 'feedback.dart';

enum StatusCita { EnCurso, Aceptada, Pendiente, Cancelada, Finalizada }

abstract class Cita extends ObservableNotificacion {
  DateTime? fecha;
  StatusCita? status;
  FeedBack? feedBack;
  Paciente? paciente;
  Especialidad? especialidad;
  RegistroMedico? registroMedico;

  Cita(this.fecha, this.paciente, this.especialidad, o) : super(o) {
    status = StatusCita.Pendiente;
  }

  void actualizarStatus(StatusCita statusCita) {
    status = statusCita;
  }

  void finalizarCita();

  Paciente obternerPaciente();
}

class Teleconsulta extends Cita {
  @override
  void finalizarCita() {
    print("Cita Virtual finalizada");
    status = StatusCita.Finalizada;
    servirFeedback(this);
  }

  @override
  Paciente obternerPaciente() {
    return paciente!;
  }

  @override
  void add(ObservadorNotificacion o) {
    observador = o;
  }

  @override
  void notify() {
    observador?.notificar();
  }

  Teleconsulta(fecha, paciente, especialidad, o)
      : super(fecha, paciente, especialidad, o);

  void servirFeedback(Teleconsulta telmed) {
    feedBack = paciente?.crearFeedback(telmed);
    String? comentario = feedBack?.getcomentario();
    int? valoracion = feedBack?.getvaloracion();
    print('$comentario , $valoracion');
  }
}

class Presencial extends Cita {
  @override
  void finalizarCita() {
    print("Cita Presencial finalizada");
    status = StatusCita.Finalizada;
  }

  @override
  Paciente obternerPaciente() {
    return paciente!;
  }

  @override
  void add(ObservadorNotificacion o) {
    observador = o;
  }

  @override
  void notify() {
    observador?.notificar();
  }

  Presencial(fecha, paciente, especialidad, o)
      : super(fecha, paciente, especialidad, o);
}
