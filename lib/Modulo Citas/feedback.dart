class FeedBack {
  int _valoracion = 0;
  String _comentario = "";

  FeedBack(String comentario, int valoracion) {
    _comentario = comentario;
    _valoracion = valoracion;
  }

  int get valoracion {
    return _valoracion;
  }

  String get comentario {
    return _comentario;
  }

  set valoracion(int v) {
    _valoracion = v;
  }

  set comentario(String comentario) {
    _comentario = comentario;
  }
}
