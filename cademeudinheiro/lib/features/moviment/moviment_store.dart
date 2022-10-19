import 'package:cademeudinheiro/features/moviment/moviment_controller.dart';
import 'package:cademeudinheiro/features/moviment/moviment_dao.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import '../../utils/convert_days.dart';
import 'moviment_model.dart';
part 'moviment_store.g.dart';

class MovimentStore = _Moviment with _$MovimentStore;

abstract class _Moviment with Store {
  MovimentDao _movimentDao = MovimentDao();

  WeekDays newWeekDays = WeekDays();

  @observable
  List<MovimentModel> moviments = [];

  @observable
  List<double> lastMoviments = [];

  @observable
  bool load = true;

  @observable
  bool switchController = false;

  @observable
  int? idController;

  @observable
  String descriController = '';

  @observable
  String valueController = '';

  @observable
  String localController = '';

  @observable
  String dateController = '';

  @observable
  List<String> days = [];

  @observable
  List<_ConsumData> data = [];

  @action
  setData(List<_ConsumData> values) => data = values;

  @action
  setDays(List<String> convertedDays) => days = convertedDays;

  @action
  setLoad() => load = !load;

  @action
  setSwitchController() => switchController = !switchController;

  @action
  setIdController(value) => idController = value;

  @action
  setDescriController(value) {
    descriController = value;
  }

  @action
  setValueController(value) {
    valueController = value;
  }

  @action
  setLocalController(value) {
    localController = value;
  }

  @action
  setDateController(value) {
    dateController = value;
  }

  @action
  cleanControllers() {
    descriController = '';
    valueController = '';
    localController = '';
    dateController = '';
  }

  @action
  setMoviments(int Id, {String initialDate = '', String finalDate = ''}) async {
    load = false;
    moviments = await _movimentDao.getMoviments(Id, initialDate: initialDate, finalDate: finalDate);
    load = true;
  }

  @action
  setMovimentsByType(int id, type) async {
    load = false;
    moviments = await _movimentDao.getMovimentsByType(id, type);
    load = true;
  }

  @action
  setLastMoviments() async {
    load = false;
    lastMoviments = [];
    days = await newWeekDays.convertDay();
    var today = DateTime.now();
    for (int i = 0; i <= 7; i++) {
      var date = DateFormat('yyyy-MM-dd').format(today);
      List<MovimentModel> value = await _movimentDao.getLastValues(date);
      for (int i = 0; i < value.length; i++) {
        value[i].value != null
            ? lastMoviments.add(value[i].value!)
            : lastMoviments.add(0.0);
      }
      today = today.subtract(Duration(days: 1));
    }
    getData();
    print(lastMoviments);
    load = true;
  }

  @action
  deleteMoviment(int movimentId) async {
    await _movimentDao.deleteMoviment(movimentId);
  }

  @action
  getData() {
    data = [
      _ConsumData('${days[7]}', lastMoviments[7]),
      _ConsumData('${days[6]}', lastMoviments[6]),
      _ConsumData('${days[5]}', lastMoviments[5]),
      _ConsumData('${days[4]}', lastMoviments[4]),
      _ConsumData('${days[3]}', lastMoviments[3]),
      _ConsumData('${days[2]}', lastMoviments[2]),
      _ConsumData('${days[1]}', lastMoviments[1]),
      _ConsumData('Hoje', lastMoviments[0])
    ];
  }
@action
updateMoviment(int id, String local, double value, String date, String descri) async {
  await _movimentDao.updateMoviment(id, local, value, date, descri);
}
}

class _ConsumData {
  _ConsumData(this.days, this.values);

  final String days;
  final double values;
}
