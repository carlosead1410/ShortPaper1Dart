// ignore_for_file: unnecessary_new, unused_local_variable, unused_import

import 'package:apartado3/Modulo%20Citas/solicitud.dart';
import 'package:apartado3/Modulo%20Suscripccion/suscripccion.dart';
import 'package:apartado3/Modulo%20Suscripccion/metodo_pago.dart';
import 'package:apartado3/Modulo%20Usuarios/doctor.dart';
import 'package:apartado3/Modulo%20Usuarios/pacientes.dart';
import 'package:apartado3/Patron%20Observador%20Actividades/observador_registro.dart';
import 'package:apartado3/apartado3.dart' as apartado3;

void main(List<String> arguments) {
  probandoSuscripccion();
}

void probandoSuscripccion() {
  var suscripccion = new Suscripcion();
  var metodo = Paypal("arriaga1410@gmail.com", TipoPlan.anual);

  print(metodo);
}


//CASO DE USO PACIENTE SOLICITA CITA (SUSCRIPCCION CANCELADA O BLOQUEADA)
void cu_solicitarCitaCancelada() {
    print("****CASO DE USO SOLICITUD CITA CON SUSCRIPCCION CANCELADA O BLOQUEADA");

    //ESTE OBJETO ES UNICO PARA LLEVAR TODO EL REGISTRO DE ACTIVIDADES DE LOS PACIENTES
    Registro registro_actividad = new Registro();
    Registro registro_Auditoria = new Registro();


    //Se crea al paciente
    Paciente paciente1 =  new Paciente('Carlos Arriaga', 21, 'Estudiante', ['1', '2', '3'], 'arriaga1410@gmail.com', 1212, registro_actividad);

    Suscripcion suscripccion = new Suscripcion();
    
}