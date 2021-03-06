// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_this, unused_import

import 'package:apartado3/Modulo%20Citas/cita.dart';
import 'package:apartado3/Modulo%20Citas/solicitud.dart';
import 'package:apartado3/Modulo%20Historia%20Medica/historial_medico.dart';
import 'package:apartado3/Modulo%20Suscripccion/suscripccion.dart';
import 'package:apartado3/Modulo%20Usuarios/doctor.dart';
// import 'package:apartado3/Modulo%20Usuarios/doctor.dart';

import '../Modulo Citas/feedback.dart';
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
    this.notify([
      this.getNombre(),
      DateTime.now().toString(),
      "Inicio proceso de suscripción"
    ]);
  }

  HistorialMedico obtenerHistorial() {
    return historia!;
  }

  void cancelarSuscripcion() {
    _plan!.actualizarStatus(StatusSuscripccion.Cancelada);
    this.notify(
        [this.getNombre(), DateTime.now().toString(), "Cancelo Suscripción"]);
  }

  void MostrarPlan() {
    _plan!.mostrarSuscripccion();
  }

  Suscripcion ObtenerPlan() {
    return _plan!;
  }

  FeedBack crearFeedback() {
    /* ¡¡¡ ATENCION !!!
    Para efectos del ejemplo se asumio que al finalizar la cita el paciente automaticamente realiza el feedback, pero
    esto no es asi, realmente deberiamos tener alguna interaccion entre (SISTEMA - PACIENTE) para que asi este le haga
    saber al sistema si desea realizar un feedback, de ser asi se llamaria al metodo "servirFeedback()" directamente
    desde la instancia  y no desde el metodo "finalizarCita()", manera que se llevo acabo en esta oportunidad*/
    FeedBack fb = FeedBack("Excelente servicio, amo este sistema", 5);
    this.notify(
        [this.getNombre(), DateTime.now().toString(), "Realizo Feedback"]);
    return fb;
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

  Solicitud solicitarCita(
      TipoCita tipo, Doctor doctor, Especialidad especialidad) {
    print('*** PROCESO SOLICITUD DE CITA ***');
    print('Paciente: ${this._nombre}');
    print('Doctor: ${doctor.getNombre()}');
    print('Especialidad: ${especialidad.getNombre()}');
    print('Tipo Solicitud: $tipo');
    print('');
    Solicitud solicitud = Solicitud(tipo, especialidad);
    this.notify([
      this.getNombre(),
      DateTime.now().toString(),
      "Solicitó Cita de tipo $tipo"
    ]);
    return solicitud;
    //solicitud.notificarDoctor(doctor, this);
  }

  responderCita(Cita cita, StatusCita tipo) {
    cita.actualizarStatus(tipo);
    this.notify([
      this.getNombre(),
      DateTime.now().toString(),
      "Respondio cita con: $tipo"
    ]);
  }

  void setSuscripccion(Suscripcion s) {
    this._plan = s;
  }

  List<Doctor> buscarDoctores(var o, BuscarDoctor doctores) {
    var aux = o.getNombre();
    this.notify([
      this.getNombre(),
      DateTime.now().toString(),
      "Buscó Doctores por parámetro $aux"
    ]);
    return doctores.filtrarLista(o);
  }
}
