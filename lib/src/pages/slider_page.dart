import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorDelSlider = 200;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sliders"),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              _crearCheckbox(),
              _crearSwitch(),
              SizedBox(height: 40),
              Text("Tamaño de la Imagen"),
              _crearSlider(),
              Expanded(child: _crearImagen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.green,
      label: "Tamaño de la imagen",
      value: _valorDelSlider,
      min: 30,
      max: 400,
      onChanged: (_bloquearCheck == false)
          ? null
          : (double sliderValue) {
              setState(() {
                _valorDelSlider = sliderValue;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage(
            "https://pbs.twimg.com/profile_images/1319120657075048448/vM16Kyes_400x400.jpg"),
        width: _valorDelSlider,
        fit: BoxFit.contain);
  }

  Widget _crearCheckbox() {
    /*  return Checkbox(
                      value: _bloquearCheck,
                      onChanged: (bool? valorCheckbox) {
                        setState(() {
                          _bloquearCheck = valorCheckbox!;
                        });
                      }); */

    return CheckboxListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (bool? valorCheckbox) {
        setState(() {
          _bloquearCheck = valorCheckbox!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (bool? valorCheckbox) {
        setState(() {
          _bloquearCheck = valorCheckbox!;
        });
      },
    );
  }
}
