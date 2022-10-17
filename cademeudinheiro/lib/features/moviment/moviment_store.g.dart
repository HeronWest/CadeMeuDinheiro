// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovimentStore on _Moviment, Store {
  late final _$movimentsAtom =
      Atom(name: '_Moviment.moviments', context: context);

  @override
  List<MovimentModel> get moviments {
    _$movimentsAtom.reportRead();
    return super.moviments;
  }

  @override
  set moviments(List<MovimentModel> value) {
    _$movimentsAtom.reportWrite(value, super.moviments, () {
      super.moviments = value;
    });
  }

  late final _$lastMovimentsAtom =
      Atom(name: '_Moviment.lastMoviments', context: context);

  @override
  List<double> get lastMoviments {
    _$lastMovimentsAtom.reportRead();
    return super.lastMoviments;
  }

  @override
  set lastMoviments(List<double> value) {
    _$lastMovimentsAtom.reportWrite(value, super.lastMoviments, () {
      super.lastMoviments = value;
    });
  }

  late final _$loadAtom = Atom(name: '_Moviment.load', context: context);

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

  late final _$descriControllerAtom =
      Atom(name: '_Moviment.descriController', context: context);

  @override
  String get descriController {
    _$descriControllerAtom.reportRead();
    return super.descriController;
  }

  @override
  set descriController(String value) {
    _$descriControllerAtom.reportWrite(value, super.descriController, () {
      super.descriController = value;
    });
  }

  late final _$valueControllerAtom =
      Atom(name: '_Moviment.valueController', context: context);

  @override
  String get valueController {
    _$valueControllerAtom.reportRead();
    return super.valueController;
  }

  @override
  set valueController(String value) {
    _$valueControllerAtom.reportWrite(value, super.valueController, () {
      super.valueController = value;
    });
  }

  late final _$localControllerAtom =
      Atom(name: '_Moviment.localController', context: context);

  @override
  String get localController {
    _$localControllerAtom.reportRead();
    return super.localController;
  }

  @override
  set localController(String value) {
    _$localControllerAtom.reportWrite(value, super.localController, () {
      super.localController = value;
    });
  }

  late final _$dateControllerAtom =
      Atom(name: '_Moviment.dateController', context: context);

  @override
  String get dateController {
    _$dateControllerAtom.reportRead();
    return super.dateController;
  }

  @override
  set dateController(String value) {
    _$dateControllerAtom.reportWrite(value, super.dateController, () {
      super.dateController = value;
    });
  }

  late final _$daysAtom = Atom(name: '_Moviment.days', context: context);

  @override
  List<String> get days {
    _$daysAtom.reportRead();
    return super.days;
  }

  @override
  set days(List<String> value) {
    _$daysAtom.reportWrite(value, super.days, () {
      super.days = value;
    });
  }

  late final _$dataAtom = Atom(name: '_Moviment.data', context: context);

  @override
  List<_ConsumData> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<_ConsumData> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$setMovimentsAsyncAction =
      AsyncAction('_Moviment.setMoviments', context: context);

  @override
  Future setMoviments(int? Id,
      {String initialDate = '', String finalDate = ''}) {
    return _$setMovimentsAsyncAction.run(() =>
        super.setMoviments(Id, initialDate: initialDate, finalDate: finalDate));
  }

  late final _$setMovimentsByTypeAsyncAction =
      AsyncAction('_Moviment.setMovimentsByType', context: context);

  @override
  Future setMovimentsByType(dynamic type) {
    return _$setMovimentsByTypeAsyncAction
        .run(() => super.setMovimentsByType(type));
  }

  late final _$setLastMovimentsAsyncAction =
      AsyncAction('_Moviment.setLastMoviments', context: context);

  @override
  Future setLastMoviments() {
    return _$setLastMovimentsAsyncAction.run(() => super.setLastMoviments());
  }

  late final _$_MovimentActionController =
      ActionController(name: '_Moviment', context: context);

  @override
  dynamic setData(List<_ConsumData> values) {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.setData');
    try {
      return super.setData(values);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDays(List<String> convertedDays) {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.setDays');
    try {
      return super.setDays(convertedDays);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoad() {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.setLoad');
    try {
      return super.setLoad();
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescriController(dynamic value) {
    final _$actionInfo = _$_MovimentActionController.startAction(
        name: '_Moviment.setDescriController');
    try {
      return super.setDescriController(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValueController(dynamic value) {
    final _$actionInfo = _$_MovimentActionController.startAction(
        name: '_Moviment.setValueController');
    try {
      return super.setValueController(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLocalController(dynamic value) {
    final _$actionInfo = _$_MovimentActionController.startAction(
        name: '_Moviment.setLocalController');
    try {
      return super.setLocalController(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDateController(dynamic value) {
    final _$actionInfo = _$_MovimentActionController.startAction(
        name: '_Moviment.setDateController');
    try {
      return super.setDateController(value);
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cleanControllers() {
    final _$actionInfo = _$_MovimentActionController.startAction(
        name: '_Moviment.cleanControllers');
    try {
      return super.cleanControllers();
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getData() {
    final _$actionInfo =
        _$_MovimentActionController.startAction(name: '_Moviment.getData');
    try {
      return super.getData();
    } finally {
      _$_MovimentActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviments: ${moviments},
lastMoviments: ${lastMoviments},
load: ${load},
descriController: ${descriController},
valueController: ${valueController},
localController: ${localController},
dateController: ${dateController},
days: ${days},
data: ${data}
    ''';
  }
}
