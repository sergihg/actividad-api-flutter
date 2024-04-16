import 'package:actividad_api/home.dart';
import 'package:flutter/material.dart';

class Status404 extends StatefulWidget {
  const Status404({super.key});

  @override
  State<Status404> createState() => _Status404State();
}

class _Status404State extends State<Status404> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                              builder: (context)=>Home()), 
                                              (route) => false);
              },
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100
                ),
                Text(
                  'Objeto no encontrado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}