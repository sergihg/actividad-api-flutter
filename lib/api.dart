import 'package:actividad_api/singleton.dart';
import 'package:actividad_api/status200.dart';
import 'package:actividad_api/status404.dart';
import 'package:actividad_api/status500.dart';
import 'package:flutter/material.dart';
import 'package:actividad_api/getapi.dart';

class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  var data;
  Singleton singleton = Singleton();
  
  @override
  void initState() {
    getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Cargando . . .',
                      style: TextStyle(
                        fontSize: 30
                      ),
            
            ),
          )
        ],
      ),
    );
  }
  Future<void> getJsonData() async {
    //Llamado a clase
    NetworkHelper networkHelper = NetworkHelper();

    try {
      //Llamado a la funcion que solicita a la api las coordenadas 
      data = await networkHelper.getData();
      singleton.data = data;
      print('$data'); //json completo
    } catch(e) {
      print("Error en la api");
    }
    checkStatus();
  }
  void checkStatus(){
      var status = data["status"];
      if(status == 500){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Status500()));
      }else if(status == 404){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Status404()));
      }else if(status == 200){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Status200()));
      }
  }
}