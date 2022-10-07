import 'package:cademeudinheiro/features/moviment/moviment_controller.dart';
import 'package:cademeudinheiro/features/moviment/moviment_dao.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'moviment_model.dart';
part 'moviment_store.g.dart';

class MovimentStore = _Moviment with _$MovimentStore;

abstract class _Moviment with Store {
  MovimentDao _movimentDao = MovimentDao();

  @observable
  List<MovimentModel> moviments = [];

  @observable
  List lastMoviments = [];

  @observable
  bool load = true;

  @action
  setMoviments({String initialDate = '', String finalDate = ''}) async {
    load = false;
    moviments = await _movimentDao.getMoviments(
        initialDate: initialDate, finalDate: finalDate);
    load = true;
  }

  @action
  setMovimentsByType(type) async {
    load = false;
    moviments = await _movimentDao.getMovimentsByType(type);
    load = true;
  }

  @action
  setLastMoviments() async {
    var today = DateTime.now();

    for (int i = 0; i <= 7; i++) {
      var date = DateFormat('yyyy-MM-dd').format(today);
      lastMoviments.add(await _movimentDao.getLastValues(date));
      today = today.subtract(Duration(days: 1));
    }

    print(lastMoviments);
  }
}
