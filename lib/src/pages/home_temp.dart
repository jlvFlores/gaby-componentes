import 'package:flutter/material.dart';
class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temporal'),
      ),
      body: ListView(
        // children: _crearItems(),
        children: _crearItemsVerCorta()
      ),
    );
  }

  // List<Widget> _crearItems(){
  //   List<Widget> lista = new List<Widget>();
  //   for(String opt in opciones){
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );
  //     // usando el operador cascada
  //     lista..add(tempWidget)..add(Divider());
  //   }
  //   return lista;
  // }

  List<Widget> _crearItemsVerCorta(){
    return opciones.map( (item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text( item + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.accessibility_new),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}