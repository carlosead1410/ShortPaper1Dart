// ignore_for_file: unnecessary_new, unused_local_variable, unused_import, non_constant_identifier_names

import 'dart:developer';

import 'package:apartado3/Modulo%20Citas/cita.dart';
import 'package:apartado3/Modulo%20Citas/solicitud.dart';
import 'package:apartado3/Modulo%20Suscripccion/suscripccion.dart';
import 'package:apartado3/Modulo%20Suscripccion/metodo_pago.dart';
import 'package:apartado3/Modulo%20Usuarios/doctor.dart';
import 'package:apartado3/Modulo%20Usuarios/pacientes.dart';
import 'package:apartado3/Patron%20Observador%20Actividades/observador_registro.dart';
import 'package:apartado3/apartado3.dart' as apartado3;
import 'package:apartado3/Patron Observador Actividades/observador_registro.dart';

void main(List<String> arguments) {
  // cu_solicitarCitaBloqueada();
  //cu_cancelarCitaPaciente();
  // cu_crearFeedback();
  cu_buscarDoctorEspecialidad();
  cu_buscarDoctorUbicacion();
}

void cu_crearFeedback() {
  Registro registro_actividad = new Registro();
  Registro registro_auditoria = new Registro();

  Doctor doctor1 = new Doctor('Maria Perez', [new Peidatra(), new Neurologo()],
      new Ubicacion("Venezuela", "Miranda", "Los Teques"), registro_auditoria);

  Paciente paciente1 = new Paciente('Carlos Arriaga', 21, 'Estudiante',
      ['1', '2', '3'], 'arriaga1410@gmail.com', 1212, registro_actividad);

  Solicitud solicitud =
      paciente1.solicitarCita(TipoCita.Teleconsulta, doctor1, new Neurologo());

  Cita cita = doctor1.agendarCita(
      paciente1, new DateTime(2022, DateTime.june, 5, 8, 30), solicitud);

  cita.finalizarCita(); //MUY IMPORTANTE, leer comentario situado en la clase feedback para entender porque se hizo asi.
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

//CASO DE USO PACIENTE CANCELAR CITA
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

//CASO DE USO BUSCAR DOCTOR POR ESPECIALIDAD
void cu_buscarDoctorEspecialidad() {
  Registro registroAuditoria = new Registro();
  Registro registroActividad = new Registro();
  // SE CREAN VARIOS DOCTORES
  Doctor doctor1 = new Doctor('Maria Perez', [new Peidatra(), new Neurologo()],
      new Ubicacion("Venezuela", "Miranda", "Los Teques"), registroAuditoria);
  Doctor doctor2 = new Doctor('Rafael Rodriguez', [new Neurologo()],
      new Ubicacion("Venezuela", "Miranda", "Los Teques"), registroAuditoria);
  Doctor doctor3 = new Doctor('Aurola Martinez', [new Cardiologo()],
      new Ubicacion("Venezuela", "Miranda", "Los Teques"), registroAuditoria);
  Doctor doctor4 = new Doctor('Jose Lopez', [new Cardiologo()],
      new Ubicacion("Venezuela", "Carabobo", "San Diego"), registroAuditoria);
  Doctor doctor5 = new Doctor('Laura Sanchez', [new Neurologo()],
      new Ubicacion("Venezuela", "Carabobo", "San Diego"), registroAuditoria);
  //CREO PACIENTE
  Paciente paciente1 = new Paciente("Hugo Pacheco", 26, "Analista",
      ['123456', '45456'], 'hugo@gmail.com', 555, registroActividad);
  // CREO BUSCAR DOCTOR
  BuscarDoctor listaDoctores =
      new BuscarDoctor([doctor1, doctor2, doctor3, doctor4, doctor5]);
  // CREO ESPECIALIDAD
  Neurologo neurologo = new Neurologo();
  // EL PACIENTE BUSCA DOCTORES POR ESPECIALIDAD
  // EL METODO BUSCARDOCTORES RECIBE UN VAR QUE ES COMPARADO PARA VER SI ES DE TIPO
  // UBICACION O ESPECIALIDAD Y RETORNA UNA LISTA FILTRADA DE DOCTORES
  List<Doctor> listaFiltrada =
      paciente1.buscarDoctores(neurologo, listaDoctores);

  print("***Buscar Doctores por Especialidad***");
  print("Especialidad buscada: ${neurologo.getNombre()}");
  for (Doctor doctor in listaFiltrada) {
    print(
        " ${doctor.getNombre()}  tiene la especialidad ${neurologo.getNombre()}");
  }
}

//CASO DE USO BUSCAR DOCTOR POR UBICACION
void cu_buscarDoctorUbicacion() {
  Registro registroAuditoria = new Registro();
  Registro registroActividad = new Registro();
  // SE CREAN VARIOS DOCTORES
  Doctor doctor1 = new Doctor('Maria Perez', [new Peidatra(), new Neurologo()],
      new Ubicacion("Venezuela", "Miranda", "Los Teques"), registroAuditoria);
  Doctor doctor2 = new Doctor('Rafael Rodriguez', [new Neurologo()],
      new Ubicacion("Venezuela", "Miranda", "Los Teques"), registroAuditoria);
  Doctor doctor3 = new Doctor('Aurola Martinez', [new Cardiologo()],
      new Ubicacion("Venezuela", "Miranda", "Los Teques"), registroAuditoria);
  Doctor doctor4 = new Doctor('Jose Lopez', [new Cardiologo()],
      new Ubicacion("Venezuela", "Carabobo", "San Diego"), registroAuditoria);
  Doctor doctor5 = new Doctor('Laura Sanchez', [new Neurologo()],
      new Ubicacion("Venezuela", "Carabobo", "San Diego"), registroAuditoria);

  //CREO PACIENTE
  Paciente paciente1 = new Paciente("Hugo Pacheco", 26, "Analista",
      ['123456', '45456'], 'hugo@gmail.com', 555, registroActividad);
  // CREO BUSCAR DOCTOR
  BuscarDoctor listaDoctores =
      new BuscarDoctor([doctor1, doctor2, doctor3, doctor4, doctor5]);

  var venezuela = new Ubicacion('Venezuela', 'Carabobo', 'San Diego');

  // EL PACIENTE BUSCA DOCTORES POR UBICACION
  // EL METODO BUSCARDOCTORES RECIBE UN VAR QUE ES COMPARADO PARA VER SI ES DE TIPO
  // UBICACION O ESPECIALIDAD Y RETORNA UNA LISTA FILTRADA DE DOCTORES

  // SE HACE EL FILTRO POR UBICACION
  List<Doctor> listaFiltrada =
      paciente1.buscarDoctores(venezuela, listaDoctores);
  print("***Buscar Doctores por Ubicacion***");
  print('UBICACION: ${venezuela.getNombre()}');
  for (Doctor doctor in listaFiltrada) {
    print(
        " ${doctor.getNombre()}  tienen su consultorio ${venezuela.getNombre()}");
  }
}
