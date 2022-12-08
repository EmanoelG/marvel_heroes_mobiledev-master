import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/HomePage.dart';
import 'apptextinput.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tlogin = TextEditingController();

  final _tsenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();
  var label;
  var hint;
  late bool obscure;

  late TextEditingController controller;
  late FormFieldValidator<String> validator;
  late TextInputType type;
  late TextInputAction textInputAction;
  late FocusNode focus;
  late FocusNode nextFocus;
  var entrar = 'Entrar';
  @override
  void initState() {
    super.initState();

    /**
     Future<Usuario> future = Usuario.get();
    future.then((Usuario user) {
      if (user != null) {
        push(context,  MyHomePage('Marvel app')(), replace: true);
      }
    });
    */
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Heroes',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    var _senha;
    var _usuario;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              keyboardAppearance: Brightness.dark,
              controller: _usuario,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                labelText: 'User',
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardAppearance: Brightness.dark,
              controller: _senha,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                labelText: 'Password',
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 179, 17, 17)),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Color.fromARGB(255, 248, 4, 4).withOpacity(0.04);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return Color.fromARGB(255, 3, 4, 5).withOpacity(0.12);
                    return Color.fromARGB(255, 248, 4, 4).withOpacity(0.04);
                    // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                print(_usuario);
                _authFire();
              },
              child: const Text(
                'Entrar ',
                style: TextStyle(
                    color: Color.fromARGB(237, 243, 243, 243),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _authFire() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      _auth
          .createUserWithEmailAndPassword(
              email: 'emanoelgalvao42@gmail.com', password: 'Gremio321')
          .then((value) => print('Email send '));
    } on Exception catch (e) {
      print('Erro email: ${e}');
    }
  }
}

