import 'package:flutter/material.dart';

class AlertDialogs{

  bool? confirmation;
  AlertDialogs({this.confirmation});

  confirm() => confirmation = true;

  showLoginFailedAlert(BuildContext context){
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Login ou Senha incorretos\nFavor verifique suas informações'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text('OK!'),
                  onPressed: () => Navigator.of(context).pop()
              ),
            ],
          );
        });
  }

  showSuccefullMovimentAdd(BuildContext context){
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Só sucesso!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Movimentação cadastrada com sucesso'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text('OK!'),
                  onPressed: () => Navigator.of(context).pop()
              ),
            ],
          );
        });
  }

  showConfirmUserExclusion(BuildContext context){
    bool confirmation = false;
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmação'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Você tem certeza que deseja excluir este usuário?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                  child: const Text('Confirmar'),
                  onPressed: () {
                    confirm();
                    Navigator.of(context).pop();
                  }
              ),
            ],
          );
        });
  }

}

