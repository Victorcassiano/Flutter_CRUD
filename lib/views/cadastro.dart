import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/user.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void loadForm(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final User user = ModalRoute.of(context).settings.arguments;
    loadForm(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Cadastro de Usuário'))),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome pequeno';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'Email pequeno';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'Avatar Url'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          final isValid = _form.currentState.validate();

          if (isValid) {
            //_form.currentState.validate();
            _form.currentState.save();
            Provider.of<Users>(context, listen: false).put(
              User(
                id: _formData['id'],
                name: _formData['name'],
                email: _formData['email'],
                avatarUrl: _formData['avatarUrl'],
              ),
            );
            Navigator.of(context).pop();
          }

          //
        },
      ),
    );
  }
}
