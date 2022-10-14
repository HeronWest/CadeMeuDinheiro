import 'package:cademeudinheiro/features/user/user_dao.dart';
import 'package:flutter/material.dart';
import 'user_model.dart';

Future registerUser(
    String name, type, nick, email, passdw, rpasswd, BuildContext context) async {
  UserDao _userDao = UserDao();
  UserModel? user;

  List<dynamic> consult = await _userDao.searchUserByName(name);

  if (consult.isNotEmpty) {
    List<UserModel> users = consult.cast<UserModel>();
    user = users.first;
  }
  if (user?.name == name) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: SingleChildScrollView(
                child: ListBody(children: const <Widget>[
              Text('Usuário já existente/cadastrado!')
            ])),
            actions: [
              TextButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  child: const Text('OK'))
            ],
          );
        });
  } else {
    if (passdw != rpasswd) {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erro'),
              content: SingleChildScrollView(
                  child: ListBody(children: const <Widget>[
                Text('Suas senhas não coincidem')
              ])),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.of(context).pop();
                    }),
                    child: const Text('OK'))
              ],
            );
          });
    } else {
      UserModel newUser = UserModel()
        ..name = name
        ..type = type
        ..nick = nick
        ..email = email
        ..passwd = passdw
        ..minim = 0
        ..sald = 0;
      await _userDao.save(newUser);
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Só sucesso'),
              content: SingleChildScrollView(
                  child: ListBody(children: const <Widget>[
                Text('Cadastro feito com êxito!')
              ])),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pushReplacementNamed(context, '/login_page');
                    }),
                    child: const Text('OK'))
              ],
            );
          });
    }
  }
}
