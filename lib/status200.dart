import 'package:actividad_api/home.dart';
import 'package:actividad_api/singleton.dart';
import 'package:flutter/material.dart';

class Status200 extends StatefulWidget {
  const Status200({super.key});

  @override
  State<Status200> createState() => _Status200State();
}

class _Status200State extends State<Status200> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

    List<Color> colores = [];
    Singleton singleton = Singleton();
    int colorCount=0;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    int cont = -1;
    final int col = singleton.data["numeros"][0];
    final int row = singleton.data["numeros"][1];

    final w = size.width;
    final h = size.height *0.99;
    final padW = w/col * 0.05;
    final padH = h/row * 0.02;
    final containerWidth = w/col- (padW*2);
    final containerHeight = h/row - (padH*2);
    

    cargaColores();
    
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: w,
                height: h,
                child: 
                  ListView.builder(
                    itemCount: row,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context,int index){
                      return SizedBox(
                        width: w,
                        height: h/row,

                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: col,
                            itemBuilder: (BuildContext context,int index2){
                              cont = (cont==colorCount-1)? 0 : cont + 1;
                              print("paso de listview builder");
                          
                              return Padding(
                                padding: EdgeInsets.only(left: padW, right: padW, top:padH, bottom: padH),
                                child: Container(
                                  height: containerHeight,
                                  width: containerWidth,
                                  color: colores[cont],
                                  child: Text('Sergio Andres Hernandez Guerrero')
                                ),
                              );
                            }
                          ),
                      );
                    }
                  )
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                              builder: (context)=>Home()), 
                                              (route) => false);
              }
            ),
          ),
        ],
      ),
    );
  }

  void cargaColores() {
    List data = singleton.data["colores"];
    colorCount = data.length;

    for(int i=0;i<colorCount;i++) {
      String color = "${data[i]}";
      color = color.replaceAll("#", "0xff");

      var hex = int.parse(color);
      colores.add(Color(hex));
    }
  }
}