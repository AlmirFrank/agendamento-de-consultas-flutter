import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String nome, data, hora, medico, celular, email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Agendar Consulta'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: _formUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Nome Completo'),
          validator: _validarNome,
          onSaved: (String val) {
            nome = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Data'),
            keyboardType: TextInputType.datetime,
            validator: _validarData,
            onSaved: (String val) {
              data = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Hora'),
            keyboardType: TextInputType.datetime,
            validator: _validarHora,
            onSaved: (String val) {
              hora = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Médico'),
            keyboardType: TextInputType.text,
            validator: _validarMedico,
            onSaved: (String val) {
              medico = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Celular'),
            keyboardType: TextInputType.phone,
            validator: _validarCelular,
            onSaved: (String val) {
              celular = val;
            }),
        new TextFormField(
            decoration:
                new InputDecoration(hintText: 'Email (não obrigatório)'),
            keyboardType: TextInputType.emailAddress,
            validator: _validarEmail,
            onSaved: (String val) {
              email = val;
            }),
        new SizedBox(height: 30.0),
        new RaisedButton(
          onPressed: (_sendForm),
          child: Text('Agendar'),
        )
      ],
    );
  }

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarData(String value) {
    if (value.length == 0) {
      return "Informe a data";
    }
    return null;
  }

  String _validarHora(String value) {
    if (value.length == 0) {
      return "Informe a hora";
    }
    return null;
  }

  String _validarMedico(String value) {
    if (value.length == 0) {
      return "Informe o médico responsável";
    }
    return null;
  }

  String _validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if (value.length != 11) {
      return "O celular deve ter 11 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String _validarEmail(String value) {
    return null;
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Nome $nome");
      print("Data $data");
      print("Hora $hora");
      print("Medico $medico");
      print("Celular $celular");
      print("Email $email");
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}
