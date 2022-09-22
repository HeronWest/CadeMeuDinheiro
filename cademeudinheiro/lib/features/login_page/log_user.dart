import 'package:cademeudinheiro/features/user/user_dao.dart';
import 'package:cademeudinheiro/features/user/user_model.dart';
import 'package:cademeudinheiro/features/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//Faz a conexão com o usuário e se estiver tudo certo armazena as informações dele no store
Future conectUser(String name, String passwd, BuildContext context) async {
  UserModel? user;
  UserDao _userDao = UserDao();
  List<dynamic> consult = await _userDao.searchUser(name);
  late UserStore userStore;

  if (consult.isNotEmpty) {
    List<UserModel> users = consult.cast<UserModel>();
    user = users.first;

    if (user.passwd == passwd) {
      Navigator.pushReplacementNamed(context, '/home_page');
      @override
      void didChangeDependencies() {
        
        userStore = Provider.of<UserStore>(context);
      }

      userStore.setName(user.name!);
      userStore.setEmail(user.email!);
      userStore.setMinim(user.minim!);
      userStore.setSald(user.sald!);
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
                    Text(
                        'Login ou Senha incorretos\nFavor verifique suas informações'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
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
                  Text(
                      'Login ou Senha incorretos\nFavor verifique suas informações'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
