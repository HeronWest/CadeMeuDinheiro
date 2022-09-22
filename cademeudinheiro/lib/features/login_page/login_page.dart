import 'dart:convert';

import 'package:cademeudinheiro/features/login_page/log_user.dart';
import 'package:cademeudinheiro/features/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final name = TextEditingController();
  final passwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final String _porlIcon = 'assets/images/porkIcon.svg';
    
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              _porlIcon,
              color: Color.fromARGB(255, 0, 194, 184),
              width: screenSize.width * 0.16,
              height: screenSize.height * 0.16,
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.09,
              child: TextFormField(
                controller: name,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: const InputDecoration(
                    labelText: 'Usuário',
                    hintText: 'Digite seu usuário',
                    labelStyle: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 0, 194, 184)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184)))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.09,
              child: TextFormField(
                controller: passwd,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    labelStyle: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 0, 194, 184)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184)))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 194, 184))),
                onPressed: (() async {
                  await conectUser(name.text, passwd.text, context);
                  name.text = '';
                  passwd.text = '';
                }),
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cad_page');
                },
                child: Text(
                  'Novo por aqui? Faça seu cadastro!',
                  style: TextStyle(),
                ))
          ]),
        ),
      ),
    );
  }
}
