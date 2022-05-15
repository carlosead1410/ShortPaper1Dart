// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_this, unused_import

import 'package:apartado3/Modulo%20Citas/cita.dart';
import 'package:apartado3/Modulo%20Citas/solicitud.dart';
import 'package:apartado3/Modulo%20Historia%20Medica/historial_medico.dart';
import 'package:apartado3/Modulo%20Suscripccion/suscripccion.dart';
import 'package:apartado3/Modulo%20Usuarios/doctor.dart';
// import 'package:apartado3/Modulo%20Usuarios/doctor.dart';

// import '../Modulo Citas/solicitud.dart';
import '../Modulo Suscripccion/ivisitor.dart';
import '../Modulo Suscripccion/metodo_pago.dart';
import '../Patron Observador Actividades/observador_registro.dart';

class Paciente extends ObservableAuditoria {
  String? _nombre;
  int? _edad;
  String? _profesion;
  List<String>? _telefonos;
  String? _correo;
  int? _docid;
  Suscripcion? _plan;

  HistorialMedico? historia;

  Paciente(String nombre, int edad, String profesion, List<String> telefonos,
      String correo, int docid, ObservadorRegistro o)
      : super(o) {
    _nombre = nombre;
    _edad = edad;
    _profesion = profesion;
    _telefonos = telefonos;
    _correo = correo;
    _docid = docid;
  }

  String getNombre() {
    return _nombre!;
  }

  void suscribirse(MetodoPago metodo) {
    print("Aqui el paciente iniciaria el proceso de suscripccion\n");
    var suscripccion = Suscripcion();
    PagoSuscripccion pagarsuscripccion = PagoSuscripccion();
    metodo.realizarPago(pagarsuscripccion);

    suscripccion.agregarMetodo(metodo);
    suscripccion.actualizarFecha();
    suscripccion.actualizarStatus(StatusSuscripccion.Activa);
    _plan = suscripccion;
  }

  HistorialMedico obtenerHistorial() {
    return historia!;
  }

  void cancelarSuscripcion() {
    _plan!.actualizarStatus(StatusSuscripccion.Cancelada);
  }

  void MostrarPlan() {
    _plan!.mostrarSuscripccion();
  }

  Suscripcion ObtenerPlan() {
    return _plan!;
  }

  @override
  void add(ObservadorRegistro o) {
    this.observador = this.observador;
  }

  @override
  void notify(List arreglo) {
    this.observador.registrar(arreglo);
  }

  void verHistorialMedico() {
    historia?.mostrarRegistros();
  }

  Solicitud solicitarCita(TipoCita tipo, Doctor doctor, Especialidad especialidad) {
      print('***PROCESO SOLICITUD DE CITA ***');
      print('Paciente: ${this._nombre}');
      print('Doctor: ${doctor.getNombre()}');
      print('Doctor: ${especialidad.getNombre()}');
      print('Tipo Solicitud: $tipo');
      print('');
      Solicitud solicitud = Solicitud(tipo, especialidad);
      return solicitud;
      //solicitud.notificarDoctor(doctor, this);
  }

  responderCita(Cita cita, StatusCita tipo) {
      cita.actualizarStatus(tipo);
  }

  void setSuscripccion(Suscripcion s) {
    this._plan = s;
  }
}
