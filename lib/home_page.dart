import 'package:flutter/material.dart';
import 'package:youtube_clone/CustomSearchDelegate.dart';
import 'package:youtube_clone/telas/Biblioteca.dart';
import 'package:youtube_clone/telas/Inicio.dart';
import 'package:youtube_clone/telas/EmAlta.dart';
import 'package:youtube_clone/telas/Inscricao.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _valueAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            },
          ),

          // IconButton(
          //     icon: Icon(Icons.videocam),
          //     onPressed: () {
          //       print("acao: videocam");
          //     }),

          // IconButton(
          //     icon: Icon(Icons.account_circle),
          //     onPressed: () {
          //       print("acao: conta");
          //     })
        ],
      ),
      body: Container(padding: EdgeInsets.all(16), child: telas[_valueAtual]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _valueAtual,
        onTap: (value) {
          print(value);
          print("Divisão");
          print(_valueAtual);
          setState(() {
            _valueAtual = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: ("Ínicio"),
            icon: Icon(Icons.home),
            //backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            label: ("Em alta"),
            icon: Icon(Icons.whatshot),
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: ("Em alta"),
            icon: Icon(Icons.subscriptions),
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: ("Biblioteca"),
            icon: Icon(Icons.folder),
            //backgroundColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
