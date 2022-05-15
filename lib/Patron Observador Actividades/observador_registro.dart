// ignore_for_file: camel_case_types

abstract class ObservadorRegistro {
  void registrar(var registroA);
  void mostrarRegistros();
}

class Registro_Auditoria extends ObservadorRegistro {
  List registro = [];
  @override
  void registrar(var registroA) {
    registro.add(registroA);
  }

  @override
  void mostrarRegistros() {
    print("****   REGISTRO DE AUDITORIA   ****\n");

    for (var element in registro) {
      print(element);
    }
  }
}


class Registro_Actividad extends ObservadorRegistro{
  List registro = [];
  @override
  void registrar(var registroA) {
    registro.add(registroA);
  }

  @override
  void mostrarRegistros() {
    print("****   REGISTRO DE AUDITORIA   ****\n");

    for (var element in registro) {
      print(element);
    }
  }
}

abstract class ObservableAuditoria{
    ObservadorRegistro observador;
    void add(ObservadorRegistro o);
    void notify(List arreglo);

    ObservableAuditoria(this.observador);
}