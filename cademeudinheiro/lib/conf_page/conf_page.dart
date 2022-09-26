import 'package:cademeudinheiro/conf_page/upd_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../features/user/user_store.dart';

class ConfPage extends StatefulWidget {
  const ConfPage({super.key});

  @override
  State<ConfPage> createState() => _ConfPageState();
}

TextEditingController _nickController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwdController = TextEditingController();

String assetname = 'assets/images/porkIcon.svg';

class _ConfPageState extends State<ConfPage> {
  late UserStore _userStore = UserStore();
  late double _value;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    _value = _userStore.minim!;
    _nickController.text = '${_userStore.nick}';
    _emailController.text = '${_userStore.email}';
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  controller: _nickController,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: _nickController.clear,
                        icon: const Icon(Icons.cancel_outlined),
                        color: Colors.black45,
                      ),
                      labelText: 'Apelido',
                      hintText: 'Novo apelido',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 194, 184)),
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
                  style:
                      const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: _emailController.clear,
                        icon: const Icon(Icons.cancel_outlined),
                        color: Colors.black45,
                      ),
                      labelText: 'Email',
                      hintText: 'Novo email',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 194, 184)),
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
                  style:
                      const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: _passwdController.clear,
                        icon: const Icon(Icons.cancel_outlined),
                        color: Colors.black45,
                      ),
                      labelText: 'Confirme sua senha',
                      hintText: 'Digite sua senha',
                      labelStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 194, 184)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 194, 184))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 194, 184)))),
                ),
              ),
              SizedBox(
                  width: screenSize.width * 0.9,
                  child: Slider(
                    value: _value,
                    min: 0.0,
                    max: 1000.0,
                    divisions: 1000,
                    label: 'R\$${_value.toStringAsFixed(2)}',
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 0, 194, 184))),
                  onPressed: (() async {
                    bool update = await updateUser(
                        _userStore.ID!,
                        _nickController.text,
                        _emailController.text,
                        _value,
                        _passwdController.text,
                        _userStore.passwd);
                    if (update) {
                      _userStore.setNick(_nickController.text);
                      _userStore.setEmail(_emailController.text);
                      _userStore.setMinim(_value);
                      return showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Só Sucesso!'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Dado atualizados com êxito.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/home_page');
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      return showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Erro'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Senha incorreta'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }
                  }),
                  child: const Text(
                    'ATUALIZAR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
