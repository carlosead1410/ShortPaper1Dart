class FeedBack {
  int _valoracion = 0;
  String _comentario = "";

  FeedBack(String comentario, int valoracion) {
    _comentario = comentario;
    _valoracion = valoracion;
  }

  int getvaloracion() {
    return _valoracion;
  }

  String getcomentario() {
    return _comentario;
  }

  setvaloracion(int v) {
    _valoracion = v;
  }

  setcomentario(String comentario) {
    _comentario = comentario;
  }
}
