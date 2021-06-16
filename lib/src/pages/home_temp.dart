import 'package:flutter/material.dart';

//ESTE COMPONENTE NO SE USA SOLO  FUE COMO EJERCICIO

class HomePageTemp extends StatelessWidget {
  final itemList = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

//Crea Widget
  /* List<Widget> _crearItems() {
    //Crea la lista vacia donde se van a ir pusheando los resultados
    List<Widget> lista = [];

    //Itera sobre la itemList creada en la linea 4
    for (String item in itemList) {
      final tempWidget = ListTile(
        title: Text(item),
      );

//Pushea los datos en la lista[] y agrega un divider
      lista
        ..add(tempWidget)
        ..add(
          Divider(color: Colors.red),
        );
    }
    //Retorna la lista con todos los items y divider
    return lista;
  } */

  List<Widget> _crearItemsCorta() {
    var widgets = itemList.map((elem) {
      return Column(
        children: [
          ListTile(
              title: Text(elem),
              subtitle: Text("subtitulo"),
              leading: Icon(Icons.accessibility_outlined),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => print("Apretaste en $elem")),
          Divider(color: Colors.red),
        ],
      );
    }).toList();
    return widgets;
  }
}
