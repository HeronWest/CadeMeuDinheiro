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

  late final _$setMovimentsAsyncAction =
      AsyncAction('_Moviment.setMoviments', context: context);

  @override
  Future setMoviments({String initialDate = '', String finalDate = ''}) {
    return _$setMovimentsAsyncAction.run(() =>
        super.setMoviments(initialDate: initialDate, finalDate: finalDate));
  }

  @override
  String toString() {
    return '''
moviments: ${moviments},
load: ${load}
    ''';
  }
}
