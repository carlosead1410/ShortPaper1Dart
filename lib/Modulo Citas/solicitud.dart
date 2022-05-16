// ignore_for_file: constant_identifier_names, unused_local_variable, prefer_is_empty, dead_code, unused_import

import '../Modulo Suscripccion/suscripccion.dart';
import '../Modulo Usuarios/doctor.dart';
import '../Modulo Usuarios/pacientes.dart';

enum TipoCita { Teleconsulta, Presencial }

class Solicitud {
  TipoCita? _tipo;
  Especialidad? _especialidad;

  Solicitud(TipoCita tipo, Especialidad especialidad) {
    _tipo = tipo;
    _especialidad = especialidad;
  }

  TipoCita getTipo() {
    return _tipo!;
  }

  Especialidad getEspecialidad() {
    return _especialidad!;
  }

  bool verificarEspecialidad(Doctor doctor) {
    var especializaciones = doctor.getEspecializaciones();
    Especialidad especialidad;

    if (especializaciones.length == 0) {
      throw FormatException('El doctor no posee esta especialidad');
      return false;
    }
    for (var especialidad in especializaciones) {
      if (especialidad.getNombre() == _especialidad!.getNombre()) {
        return true;
      }
    }
    throw FormatException('El doctor no posee esta especialidad');
    return false;
  }

  void verificarSuscripccion(Paciente paciente) {
    var suscripcionP = paciente.ObtenerPlan();
    if (suscripcionP.status == StatusSuscripccion.Cancelada) {
      throw FormatException(
          'El Paciente CANCELO su suscripccion al sistema, no podra solicitar citas');
    } else if (suscripcionP.status == StatusSuscripccion.Bloqueada) {
      throw FormatException(
          'Su suscripccion fue BLOQUEADA por un mal uso del sistema, NO podra solicitar Citas');
    }
  }
}
