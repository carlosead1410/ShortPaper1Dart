// ignore_for_file: unnecessary_new, unused_local_variable, unused_import

import 'dart:developer';

import 'package:apartado3/Modulo%20Citas/cita.dart';
import 'package:apartado3/Modulo%20Citas/solicitud.dart';
import 'package:apartado3/Modulo%20Suscripccion/Suscripccion.dart';
import 'package:apartado3/Modulo%20Suscripccion/metodo_pago.dart';
import 'package:apartado3/Modulo%20Usuarios/doctor.dart';
import 'package:apartado3/Modulo%20Usuarios/pacientes.dart';
import 'package:apartado3/apartado3.dart' as apartado3;
import 'package:apartado3/Patron Observador Actividades/observador_registro.dart';

void main(List<String> arguments) {
  cu_cancelarCitaPaciente();
}

void probandoSuscripccion() {
  var suscripccion = new Suscripcion();
  var metodo = Paypal("arriaga1410@gmail.com", TipoPlan.anual);

  print(metodo);
}

void cu_cancelarCitaPaciente() {
  // SE CREAN LOS REGISTROS DE ACTIVIDAD Y AUDITORIA
  Registro registroActividad = new Registro();
  Registro registroAuditoria = new Registro();
  // SE CREA EL PACIENTE
  Paciente paciente1 = new Paciente("Hugo Pacheco", 26, "Analista",
      ['123456', '45456'], 'hugo@gmail.com', 555, registroActividad);
  // SE CREA EL DOCTOR
  Doctor doctor1 = new Doctor('Maria Perez', [new Peidatra(), new Neurologo()],
      new Ubicacion("Venezuela", "Miranda", "Los Teques"), registroAuditoria);
  // SE HACE LA SOLICITUD
  print(
      'El Paciente: ${paciente1.getNombre()} solicita una cita al doctor: ${doctor1.getNombre()}');
  // SE CREA EL OBJECTO SOLICITUD A TRAVES DEL PACIENTE
  Solicitud solicitud =
      paciente1.solicitarCita(TipoCita.Teleconsulta, doctor1, new Neurologo());
  print("****SE ENVIA LA SOLICITUD****");
  print('');
  print("****SE VALIDAD SI EL DOCTOR POSEE ESA ESPECIALIDAD****");
  if (solicitud.verificarEspecialidad(doctor1)) {
    print(
        "Doctor ${doctor1.getNombre()} posee especialidad: ${solicitud.getEspecialidad().getNombre()}");
    print("Doctor ${doctor1.getNombre()} agenda la Cita");
    Cita cita = doctor1.agendarCita(
        paciente1, new DateTime(2022, DateTime.june, 5, 8, 30), solicitud);
    print(
        "Doctor ${doctor1.getNombre()} agenda la Cita en la fecha ${cita.fecha} status: ${cita.status}");
    print('***EL PACIENTE CANCELA LA CITA***');
    print('');
    paciente1.responderCita(cita, StatusCita.Cancelada);
    print(
        'El Paciente: ${paciente1.getNombre()} cancelo  su cita al doctor: ${doctor1.getNombre()}  la Cita de fecha ${cita.fecha} status: ${cita.status}');
    print('');
  }
}
