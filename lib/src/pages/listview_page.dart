import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState(); //Hace referencia a la clase State y la inicializa

    _agregarDiezImg();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    //Elimina la info del _scrollController cuando ya no se usa para inicializar uno nuevo la proxima vez
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final int imagen = _listaNumeros[index];

          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("https://picsum.photos/500/300/?image=$imagen"),
          );
        },
      ),
    );
  }

  void _agregarDiezImg() {
    for (var i = 0; i < 10; i++) {
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);

      setState(() {});
    }
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    Timer(duration, respHTTP);
  }

  void respHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);

    _agregarDiezImg();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 20),
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> _obtenerPagina1() async {
    final duration = Duration(seconds: 1);

    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoNumero++;
      _agregarDiezImg();
    });

    return Future.delayed(duration);
  }
}
