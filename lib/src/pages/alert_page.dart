import 'package:flutter/material.dart';
class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.purple,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlesta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
      void _mostrarAlesta(BuildContext context) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context){
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              title: Text('Titulo de la alerta'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Este es el contenido de la alerta'),
                  FlutterLogo(
                    size: 100.0
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        );
      }
}
