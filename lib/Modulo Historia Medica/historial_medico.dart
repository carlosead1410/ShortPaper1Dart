import 'package:apartado3/Modulo%20Notificaciones/patron_observador.dart';

class RegistroMedico extends ObservableNotificacion {
  Object? datos;

  RegistroMedico(this.datos, o) : super(o);

  @override
  void add(ObservadorNotificacion o) {
    observador = o;
  }

  @override
  void notify() {
    observador?.notificar();
  }
}

class HistorialMedico {
  List<RegistroMedico>? registros;

  void mostrarRegistros() {
    print("******SU HISTORIAL MEDICO*****");
    registros?.forEach((element) {
      print(element);
      print("");
    });
    print("");
  }

  void agregarRegistro(RegistroMedico a) {
    registros?.add(a);
  }
}
