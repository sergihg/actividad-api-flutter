class Singleton {
  static Singleton?  _instance;

  Singleton._internal() {
    _instance = this;
  }

  factory Singleton() => _instance ?? Singleton._internal();
    Map<String,dynamic> data = {};
    String url = '';
  
  List<String> productoSeleccionado = [];

  void limpiarVariables()
  {
    data = {};
    url = '';
    
  }
  
}