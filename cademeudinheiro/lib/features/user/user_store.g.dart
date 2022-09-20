// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _User, Store {
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
  dynamic setName(String value) {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.setName');
    try {
      return super.setName(value);
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
  String toString() {
    return '''
name: ${name},
email: ${email},
sald: ${sald},
minim: ${minim}
    ''';
  }
}
