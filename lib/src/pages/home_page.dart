import 'package:flutter/material.dart';

import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes // Home Page"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    if (data != null) {
      data.forEach(
        (elem) {
          final widgetTemp = ListTile(
            title: Text(
              elem['texto'],
            ),
            leading: getIcon(elem["icon"], Colors.green, 30.0),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, elem["ruta"]);

              /*    Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AlertPage())); */
            },
          );

          opciones..add(widgetTemp)..add(Divider());
        },
      );
    } else {
      opciones.add(Text("no anda"));
    }
    return opciones;
  }
}
