// ignore_for_file: prefer_typing_uninitialized_variables

import 'metodo_pago.dart';

// ignore_for_file: file_names
abstract class IVisitor {
  void visitTDC(TDC tarjeta);
  void visitPAYPAL(Paypal paypal);
}

class PagoSuscripccion extends IVisitor {
  @override
  void visitPAYPAL(Paypal paypal) {
    var multiplicador;
    if (paypal.modalidad == TipoPlan.anual) {
      multiplicador = 10;
    } else {
      multiplicador = 1;
    }
    var precio = 8.99;
    print(paypal);
    print("El Pago por PayPal se ha registrado con exito:\n");
    print('Monto Pagado: ${precio * multiplicador}\n');
  }

  @override
  void visitTDC(TDC tarjeta) {
    var multiplicador;
    if (tarjeta.modalidad == TipoPlan.anual) {
      multiplicador = 10;
    } else {
      multiplicador = 1;
    }
    var precio = 8.99;
    print(tarjeta);
    print(
        "Como su metodo de Pago fue por TDC se hara una recarga de un 5% al monto final\n");
    print("El pago por TDC se ha registrado con exito\n");
    print("Monto Pagado: ${precio * multiplicador * 0.95}\n");
  }
}
