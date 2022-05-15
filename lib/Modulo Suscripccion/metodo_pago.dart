// ignore_for_file: non_constant_identifier_names


import 'ivisitor.dart';
enum TipoPlan { mensual, anual }

// CREACION DE LAS CLASES DE METODOS DE PAGO
abstract class MetodoPago {
  TipoPlan modalidad;

  MetodoPago(this.modalidad);

  void realizarPago(IVisitor visitante);
  String getName();
}

//CREACION CLASE PAYPAL
class Paypal extends MetodoPago {
  String? email;

  Paypal(this.email, TipoPlan tipoPlan) : super(tipoPlan);
  @override

  String getName(){
    return "Paypal";
  }

  @override
  void realizarPago(IVisitor visitante){
    visitante.visitPAYPAL(this);

  }

}


//CREACION CLASE TDC
class TDC extends MetodoPago{
    String? nombre;
    String? banco;
    DateTime? f_vencimiento;
    int? nro_tarjeta;
    int? cvc;

  TDC(this.nombre, this.banco, this.f_vencimiento, this.nro_tarjeta, this.cvc, TipoPlan tipoPlan) : super(tipoPlan);

  @override
  String getName(){
    return "TDC";
  }

  @override
  void realizarPago(IVisitor visitante){
    visitante.visitTDC(this);

  }

    
}