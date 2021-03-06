import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://www.hola.com/imagenes/estar-bien/20201005176621/perro-husky-raza-perro-lobo/0-874-229/husky-t.jpg'
              ),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right:10.0),
            child: CircleAvatar(
              child: Text('GN'),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.hola.com/imagenes/estar-bien/20201005176621/perro-husky-raza-perro-lobo/0-874-229/husky-t.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      )
    );
  }
}