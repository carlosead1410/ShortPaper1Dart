abstract class ObservadorNotificacion {
  void notificar();
}

abstract class ObservableNotificacion {
  ObservadorNotificacion? observador;

  void add(ObservadorNotificacion o);
  void notify();

  ObservableNotificacion(this.observador);
}
