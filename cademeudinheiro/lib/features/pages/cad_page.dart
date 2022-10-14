import 'package:cademeudinheiro/features/user/reg_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CadPage extends StatefulWidget {
  const CadPage({super.key});

  @override
  State<CadPage> createState() => _CadPageState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _nickController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwdController = TextEditingController();
final TextEditingController _rpsswdController = TextEditingController();
final String assetname = 'assets/images/porkIcon.svg';

class _CadPageState extends State<CadPage> {
  @override
  Widget build(BuildContext context) {
    double value = 0;
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              assetname,
              color: Color.fromARGB(255, 0, 194, 184),
              width: screenSize.width * 0.16,
              height: screenSize.height * 0.16,
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.08,
              child: TextFormField(
                controller: _nameController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _nameController.clear,
                      icon: const Icon(Icons.cancel_outlined),
                      color: Colors.black45,
                    ),
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
              margin: EdgeInsets.only(top: 5),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.08,
              child: TextFormField(
                controller: _nickController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _nickController.clear,
                      icon: const Icon(Icons.cancel_outlined),
                      color: Colors.black45,
                    ),
                    labelText: 'Apelido',
                    hintText: 'Digite seu apelido',
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
              margin: EdgeInsets.only(top: 5),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.08,
              child: TextFormField(
                controller: _emailController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _emailController.clear,
                      icon: const Icon(Icons.cancel_outlined),
                      color: Colors.black45,
                    ),
                    labelText: 'Email',
                    hintText: 'Digite seu email',
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
              margin: EdgeInsets.only(top: 5),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.08,
              child: TextFormField(
                controller: _passwdController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _passwdController.clear,
                      icon: const Icon(Icons.cancel_outlined),
                      color: Colors.black45,
                    ),
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
              margin: EdgeInsets.only(top: 5),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.08,
              child: TextFormField(
                controller: _rpsswdController,
                style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _rpsswdController.clear,
                      icon: const Icon(Icons.cancel_outlined),
                      color: Colors.black45,
                    ),
                    labelText: 'Confirmar senha',
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
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 194, 184))),
                onPressed: (() async {
                  await registerUser(
                      _nameController.text,
                      'normal',
                      _nickController.text,
                      _emailController.text,
                      _passwdController.text,
                      _rpsswdController.text,
                      context);
                  _nickController.text = '';
                  _nameController.text = '';
                  _emailController.text = '';
                  _passwdController.text = '';
                  _rpsswdController.text = '';
                }),
                child: const Text(
                  'CADASTRAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
