// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdmStore on _Adm, Store {
  late final _$usersAtom = Atom(name: '_Adm.users', context: context);

  @override
  List<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$loadAtom = Atom(name: '_Adm.load', context: context);

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  late final _$nameFilterAtom = Atom(name: '_Adm.nameFilter', context: context);

  @override
  String get nameFilter {
    _$nameFilterAtom.reportRead();
    return super.nameFilter;
  }

  @override
  set nameFilter(String value) {
    _$nameFilterAtom.reportWrite(value, super.nameFilter, () {
      super.nameFilter = value;
    });
  }

  late final _$idAtom = Atom(name: '_Adm.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$userFilterIdAtom =
      Atom(name: '_Adm.userFilterId', context: context);

  @override
  int? get userFilterId {
    _$userFilterIdAtom.reportRead();
    return super.userFilterId;
  }

  @override
  set userFilterId(int? value) {
    _$userFilterIdAtom.reportWrite(value, super.userFilterId, () {
      super.userFilterId = value;
    });
  }

  late final _$getAllUsersAsyncAction =
      AsyncAction('_Adm.getAllUsers', context: context);

  @override
  Future getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  late final _$getUsersByNameAsyncAction =
      AsyncAction('_Adm.getUsersByName', context: context);

  @override
  Future getUsersByName(String name) {
    return _$getUsersByNameAsyncAction.run(() => super.getUsersByName(name));
  }

  late final _$_AdmActionController =
      ActionController(name: '_Adm', context: context);

  @override
  dynamic setNameFilter(String value) {
    final _$actionInfo =
        _$_AdmActionController.startAction(name: '_Adm.setNameFilter');
    try {
      return super.setNameFilter(value);
    } finally {
      _$_AdmActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setId(dynamic value) {
    final _$actionInfo = _$_AdmActionController.startAction(name: '_Adm.setId');
    try {
      return super.setId(value);
    } finally {
      _$_AdmActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserFilterId(dynamic value) {
    final _$actionInfo =
        _$_AdmActionController.startAction(name: '_Adm.setUserFilterId');
    try {
      return super.setUserFilterId(value);
    } finally {
      _$_AdmActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
load: ${load},
nameFilter: ${nameFilter},
id: ${id},
userFilterId: ${userFilterId}
    ''';
  }
}
