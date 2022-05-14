// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unnecessary_this, file_names

import 'metodo_pago.dart';

 enum StatusSuscripccion{
    Activa,
    Cancelada,
    Bloqueada 
}

class Suscripcion{
    DateTime? fecha_inicio;
    DateTime? fecha_fin;
    MetodoPago? mpago;
    StatusSuscripccion? status;


    void actualizarFecha(){
        if (mpago?.modalidad == TipoPlan.mensual){
            print("MENSUAL");
            this.fecha_inicio = DateTime.now();
            this.fecha_fin = DateTime(this.fecha_inicio!.year,this.fecha_inicio!.month + 1,this.fecha_inicio!.day);
        }
        if (this.mpago?.modalidad == TipoPlan.anual){
            print("ANUAL");

            this.fecha_inicio = DateTime.now();
            this.fecha_fin = DateTime(this.fecha_inicio!.year + 1,this.fecha_inicio!.month,this.fecha_inicio!.day);
        }
    }

    void agregarMetodo(MetodoPago mpago){
        this.mpago = mpago;
    }

    void mostrarSuscripccion(){
        print('Su Suscripccion Inicio el dia: ${this.fecha_inicio.toString()}');
        print('Su Suscripccion finaliza el dia: ${this.fecha_fin.toString()}');
        print('Su Metodo de Pago fue: ${this.mpago?.getName()}');
        print('Su Estatus de suscripccion es : ${this.status}');
        

    }

    void actualizarStatus(StatusSuscripccion statusSus){
        this.status = statusSus;
    }
}