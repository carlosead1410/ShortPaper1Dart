// ignore_for_file: unnecessary_new, unused_local_variable, unused_import, non_constant_identifier_names

import 'dart:developer';

import 'package:apartado3/Modulo%20Citas/solicitud.dart';
import 'package:apartado3/Modulo%20Suscripccion/suscripccion.dart';
import 'package:apartado3/Modulo%20Suscripccion/metodo_pago.dart';
import 'package:apartado3/Modulo%20Usuarios/doctor.dart';
import 'package:apartado3/Modulo%20Usuarios/pacientes.dart';
import 'package:apartado3/Patron%20Observador%20Actividades/observador_registro.dart';
import 'package:apartado3/apartado3.dart' as apartado3;

void main(List<String> arguments) {
  cu_solicitarCitaBloqueada();
}

//CASO DE USO PACIENTE SOLICITA CITA (SUSCRIPCCION CANCELADA O BLOQUEADA)
void cu_solicitarCitaBloqueada() {
  print(
      "****CASO DE USO SOLICITUD CITA CON SUSCRIPCCION CANCELADA O BLOQUEADA");

  //ESTE OBJETO ES UNICO PARA LLEVAR TODO EL REGISTRO DE ACTIVIDADES DE LOS PACIENTES
  Registro registro_actividad = new Registro();
  Registro registro_auditoria = new Registro();

  //Se crea al paciente
  Paciente paciente1 = new Paciente('Carlos Arriaga', 21, 'Estudiante',
      ['1', '2', '3'], 'arriaga1410@gmail.com', 1212, registro_actividad);

  Suscripcion suscripccion = new Suscripcion();

  //SE SIMULA QUE EL ADMIN DEL SISTEMA LE HAYA BLOQUEADO LA SUSCRIPCCION AL PACIENTE POR UN MAL USO DEL MISMO
  suscripccion.actualizarStatus(StatusSuscripccion.Bloqueada);
  paciente1.setSuscripccion(suscripccion);

  //Se crea al doctor
  Doctor doctor1 = new Doctor(
      "Eduardo Damiano",
      [new Cardiologo(), new Peidatra()],
      new Ubicacion("Venezuela", "Dto Capital", "Caracas"),
      registro_auditoria);

  //EL PACIENTE HACE LA SOLICITUD DE CITA
  Solicitud solicitud =
      paciente1.solicitarCita(TipoCita.Presencial, doctor1, new Peidatra());

  solicitud.verificarSuscripccion(paciente1);
}
