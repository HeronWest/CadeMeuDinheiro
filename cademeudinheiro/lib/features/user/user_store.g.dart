// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _User, Store {
  late final _$IDAtom = Atom(name: '_User.ID', context: context);

  @override
  int? get ID {
    _$IDAtom.reportRead();
    return super.ID;
  }

  @override
  set ID(int? value) {
    _$IDAtom.reportWrite(value, super.ID, () {
      super.ID = value;
    });
  }

  late final _$nameAtom = Atom(name: '_User.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$typeAtom = Atom(name: '_User.type', context: context);

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$nickAtom = Atom(name: '_User.nick', context: context);

  @override
  String get nick {
    _$nickAtom.reportRead();
    return super.nick;
  }

  @override
  set nick(String value) {
    _$nickAtom.reportWrite(value, super.nick, () {
      super.nick = value;
    });
  }

  late final _$emailAtom = Atom(name: '_User.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwdAtom = Atom(name: '_User.passwd', context: context);

  @override
  String get passwd {
    _$passwdAtom.reportRead();
    return super.passwd;
  }

  @override
  set passwd(String value) {
    _$passwdAtom.reportWrite(value, super.passwd, () {
      super.passwd = value;
    });
  }

  late final _$saldAtom = Atom(name: '_User.sald', context: context);

  @override
  double? get sald {
    _$saldAtom.reportRead();
    return super.sald;
  }

  @override
  set sald(double? value) {
    _$saldAtom.reportWrite(value, super.sald, () {
      super.sald = value;
    });
  }

  late final _$minimAtom = Atom(name: '_User.minim', context: context);

  @override
  double? get minim {
    _$minimAtom.reportRead();
    return super.minim;
  }

  @override
  set minim(double? value) {
    _$minimAtom.reportWrite(value, super.minim, () {
      super.minim = value;
    });
  }

  late final _$_UserActionController =
      ActionController(name: '_User', context: context);

  @override
  dynamic setID(int value) {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.setID');
    try {
      return super.setID(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setType(String value) {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.setType');
    try {
      return super.setType(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNick(String value) {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.setNick');
    try {
      return super.setNick(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSald(double value) {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.setSald');
    try {
      return super.setSald(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMinim(double value) {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.setMinim');
    try {
      return super.setMinim(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswd(String value) {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.setPasswd');
    try {
      return super.setPasswd(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ID: ${ID},
name: ${name},
type: ${type},
nick: ${nick},
email: ${email},
passwd: ${passwd},
sald: ${sald},
minim: ${minim}
    ''';
  }
}
