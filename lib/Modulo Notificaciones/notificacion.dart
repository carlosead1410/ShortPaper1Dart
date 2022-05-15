import 'patron_observador.dart';

class SMS extends ObservadorNotificacion {
  @override
  void notificar() {
    print("Notificacion a traves de SMS");
  }
}

class CorreoElectronico extends ObservadorNotificacion {
  @override
  void notificar() {
    print("Notificacion a traves de Correo Electronico");
  }
}

class Llamada extends ObservadorNotificacion {
  @override
  void notificar() {
    print("Notificacion a traves de Llamada");
  }
}

class NotificacionPush extends ObservadorNotificacion {
  @override
  void notificar() {
    print("Notificacion a traves de Notificacion Push");
  }
}
