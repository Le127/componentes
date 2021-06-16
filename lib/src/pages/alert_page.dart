import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar Alerta"),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(StadiumBorder()),
              backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_return)),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Este es el contenido de la Alerta"),
                SizedBox(height: 15),
                FlutterLogo(size: 80),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok")),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancelar")),
            ],
          );
        });
  }
}
