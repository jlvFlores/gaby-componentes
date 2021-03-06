import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  List<String> _lenguajes = [
    'Java', 
    'python', 
    'javascript', 
    'c++', 
    'r', 
    'dart'
  ];
  String _opcionSeleccionada = 'Java';

  TextEditingController _inputFieldDataController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearEntrada(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearEntrada() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Caracteres ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo escribe el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
          // print(_nombre);
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('Email: $_email, Password: $_password'),
      trailing: Text('Lenguaje: $_opcionSeleccionada'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email de la persona',
        labelText: 'Email',
        helperText: 'Escriba su email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
          // print(_nombre);
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'password',
        helperText: 'Escriba password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
          // print(_nombre);
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        helperText: 'Escriba su fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2022),
      locale: Locale('es', 'ES'),
    );
    if ( picked != null ) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDataController.text = _fecha;
        
      });
    }
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.code),
        SizedBox(
          width: 30.0,
        ),
        Text('Lenguaje de programacion: '),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropDown(),
            onChanged: (opt) {
              // print(opt);
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
    
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown(){
    List<DropdownMenuItem<String>> lista = new List();
    _lenguajes.forEach((lenguaje) {
      lista.add(DropdownMenuItem(
        child: Text(lenguaje),
        value: lenguaje,
      ));
    });
    return lista;
  }
}