import 'package:actividad_api/singleton.dart';
import 'package:flutter/material.dart';

class Status500 extends StatefulWidget {
  const Status500({super.key});

  @override
  State<Status500> createState() => _Status500State();
}

class _Status500State extends State<Status500>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Singleton singleton = Singleton();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Text(
                    'URL: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50
                    ),
                  ),
                  Text(
                    singleton.url,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    'Error Sintáctico',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50
                    ),
                  )
                ],
              ),
            ),]
          )
        ],
      ),
    );
  }
}