import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cards")),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          children: [
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.green, size: 40),
            title: Text("Soy el titulo de esta tarjeta"),
            subtitle: Text(
                "Esto es un subtitulo de la tarjeta, tiene mas texto asi puedo identificar mejor la diferencia."),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Back")),
                SizedBox(width: 5),
                ElevatedButton(onPressed: () {}, child: Text("Ok")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(
                "https://mymodernmet.com/wp/wp-content/uploads/2020/02/Landscape-Photographer-of-the-Year-Sander-Grefte.jpg"),
            fadeInDuration: Duration(milliseconds: 300),
            height: 300,
            fit: BoxFit.cover, //se adapta a todo le ancho posible
          ),
          Container(
              padding: EdgeInsets.all(10), child: Text("probando probando")),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              spreadRadius: 2,
              offset: Offset(5, 10))
        ],
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
