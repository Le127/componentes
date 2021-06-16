import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://okdiario.com/img/2018/03/22/como-aprender-a-tocar-el-piano-655x368.jpg"),
              radius: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage(
              "https://www.superprof.com.ar/blog/wp-content/uploads/2017/12/piano-virtual-aprender.jpg"),
          fadeInDuration: Duration(milliseconds: 2000),
          fadeInCurve: Curves.easeInCirc,
        ),
      ),
    );
  }
}
