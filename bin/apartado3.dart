// ignore_for_file: unnecessary_new, unused_local_variable, unused_import

import 'package:apartado3/Modulo%20Suscripccion/Suscripccion.dart';
import 'package:apartado3/Modulo%20Suscripccion/metodo_pago.dart';
import 'package:apartado3/apartado3.dart' as apartado3;

void main(List<String> arguments) {
  probandoSuscripccion();
}

void probandoSuscripccion() {
  var suscripccion = new Suscripcion();
  var metodo = Paypal("arriaga1410@gmail.com", TipoPlan.anual);

  print(metodo);
}
