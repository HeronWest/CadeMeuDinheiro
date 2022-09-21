// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovimentStore on _Moviment, Store {
  late final _$userIDAtom = Atom(name: '_Moviment.userID', context: context);

  @override
  int? get userID {
    _$userIDAtom.reportRead();
    return super.userID;
  }

  @override
  set userID(int? value) {
    _$userIDAtom.reportWrite(value, super.userID, () {
      super.userID = value;
    });
  }

  late final _$descriAtom = Atom(name: '_Moviment.descri', context: context);

  @override
  String get descri {
    _$descriAtom.reportRead();
    return super.descri;
  }

  @override
  set descri(String value) {
    _$descriAtom.reportWrite(value, super.descri, () {
      super.descri = value;
    });
  }

  late final _$saldAtom = Atom(name: '_Moviment.sald', context: context);

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

  late final _$dataAtom = Atom(name: '_Moviment.data', context: context);

  @override
  String? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$typeAtom = Atom(name: '_Moviment.type', context: context);

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

  late final _$_MovimentActionController =
      ActionController(name: '_Moviment', context: context);

  @override
  dynamic setUserID(int value) {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.setUserID');
    try {
      return super.setUserID(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescri(String value) {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.setDescri');
    try {
      return super.setDescri(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSald(double value) {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.setSald');
    try {
      return super.setSald(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setData(String value) {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.setData');
    try {
      return super.setData(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setType(String value) {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.setType');
    try {
      return super.setType(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userID: ${userID},
descri: ${descri},
sald: ${sald},
data: ${data},
type: ${type}
    ''';
  }
}
