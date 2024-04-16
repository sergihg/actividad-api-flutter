import 'dart:convert';
import 'package:actividad_api/singleton.dart';
import 'package:http/http.dart' as http;

class NetworkHelper{
  Singleton singleton = Singleton();
  NetworkHelper();

    final String url = 'http://nrweb.com.mx/reportes/api_prueba.php';
    final String nombre = 'sergio';
    final String hora = '19';

    Future getData() async{
      http.Response response = await http.get(Uri.parse("$url?nombre=$nombre&hora=$hora"));

      singleton.url = "$url?nombre=%22$nombre%22&hora=$hora";
      print("$url?nombre=%22$nombre%22&hora=$hora");

        String data = response.body;
        return jsonDecode(data);
    }
}