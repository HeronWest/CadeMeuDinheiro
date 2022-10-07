import 'package:brasil_fields/brasil_fields.dart';
import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/widgets/appbar.dart';
import 'package:cademeudinheiro/features/widgets/drawer.dart';
import 'package:cademeudinheiro/features/moviment/reg_mov.dart';
import 'package:cademeudinheiro/features/user/user_store.dart';
import 'package:cademeudinheiro/services/firebase_messaging_service.dart';
import 'package:cademeudinheiro/services/nottification_service.dart';
import 'package:cademeudinheiro/utils/convert_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homeState();
}

class _ConsumData {
  _ConsumData(this.days, this.values);

  final String days;
  final double values;
}

class _homeState extends State<HomePage> {
  WeekDays newWeekDays = WeekDays();
  List<_ConsumData> data = [];
  List<String> days = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    _movimentStore = Provider.of<MovimentStore>(context);
  }

  @override
  void initState() {
    super.initState();
    _movimentStore.setLastMoviments();
    days = newWeekDays.convertDay();
    data = [
      _ConsumData('${days[7]}', 35),
      _ConsumData('${days[6]}', 28),
      _ConsumData('${days[5]}', 34),
      _ConsumData('${days[4]}', 32),
      _ConsumData('${days[3]}', 40),
      _ConsumData('${days[2]}', 40),
      _ConsumData('${days[1]}', 40),
      _ConsumData('Hoje', 5)
    ];
  }

  //Controladores
  var _descriController = TextEditingController();
  var _valueController = TextEditingController();
  var _localController = TextEditingController();
  var _dateController = TextEditingController();

  late UserStore _userStore = UserStore();
  late MovimentStore _movimentStore = MovimentStore();

  showNotification(sald, minim) async {
    setState(() {
      if (sald < minim) {
        Provider.of<NotificationService>(context, listen: false)
            .showNotification(CustomNotification(
                id: 2,
                title: 'CUIDADO!',
                body: 'Seu saldo está abaixo do mínimo',
                payload: '/home_page'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const MyAppBar(),
        drawer: MyDrawer(),
        backgroundColor: Color.fromARGB(255, 217, 245, 243),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              width: screenSize.width * 0.35,
              height: screenSize.width * 0.35,
              child: IconButton(
                  icon: Icon(
                    Icons.add_a_photo,
                    size: screenSize.width * 0.15,
                  ),
                  onPressed: (() {})),
            ),
            SizedBox(
              width: screenSize.width * 0.85,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: screenSize.width * 0.85,
                          margin: const EdgeInsets.only(top: 5),
                          child: const Center(
                            child: Text('SALDO / MÍNIMO',
                                style: TextStyle(color: Colors.black54)),
                          )),
                      Container(
                          width: screenSize.width * 0.85,
                          margin: const EdgeInsets.only(top: 2),
                          child: Center(
                            child: Observer(
                              builder: (_) => Text(
                                  'R\$${_userStore.sald!.toStringAsFixed(2)} / R\$${_userStore.minim!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(
                                      255,
                                      0,
                                      194,
                                      184,
                                    ),
                                  )),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) => Container(
                margin: const EdgeInsets.only(top: 10),
                width: screenSize.width * 0.85,
                height: screenSize.height * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 0, 194, 184)),
                    color: Color.fromARGB(255, 217, 245, 243)),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Consumo'),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_ConsumData, String>>[
                    LineSeries(
                      dataSource: data,
                      xValueMapper: (_ConsumData values, _) => values.days,
                      yValueMapper: (_ConsumData values, _) => values.values,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: screenSize.width * 0.05,
                    ),
                    width: screenSize.width * 0.35,
                    height: screenSize.height * 0.07,
                    child: TextFormField(
                      controller: _localController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 194, 184)),
                      decoration: const InputDecoration(
                          labelText: 'Local',
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 194, 184))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 194, 184)))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenSize.width * 0.05,
                    ),
                    width: screenSize.width * 0.20,
                    height: screenSize.height * 0.07,
                    child: TextFormField(
                      controller: _valueController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 194, 184)),
                      decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Valor',
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 194, 184))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 194, 184)))),
                    ),
                  ),
                  Container(
                    width: screenSize.width * 0.20,
                    height: screenSize.height * 0.07,
                    child: TextFormField(
                      controller: _dateController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 194, 184)),
                      decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Data',
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.black54),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 194, 184))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 194, 184)))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              width: screenSize.width * 0.85,
              height: screenSize.height * 0.08,
              child: TextFormField(
                controller: _descriController,
                minLines: 1,
                maxLines: 4,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 194, 184), fontSize: 14),
                decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'Descrição',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 194, 184)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: SizedBox(
                width: screenSize.width * 0.85,
                height: screenSize.height * 0.07,
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    width: screenSize.width * 0.3,
                    height: screenSize.width * 0.1,
                    child: IconButton(
                        icon: Icon(
                          Icons.remove,
                        ),
                        onPressed: (() async {
                          var inputFormat = DateFormat('dd/MM/yyyy');
                          var inputDate = inputFormat.parse(
                              '${_dateController.text}'); // <-- dd/MM 24H format

                          var outputFormat = DateFormat('yyyy/MM/dd');
                          var outputDate = outputFormat.format(inputDate);

                          await registerMoviment(
                              _userStore.ID!,
                              _localController.text,
                              double.parse(_valueController.text),
                              _descriController.text,
                              outputDate.replaceAll('/', '-'),
                              'OUT');
                          _userStore.setSald(_userStore.sald! -
                              double.parse(_valueController.text));

                          await showNotification(
                              _userStore.sald!, _userStore.minim!);
                          _dateController.text = '';
                          _valueController.text = '';
                          _descriController.text = '';
                          _localController.text = '';
                        })),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 5, left: screenSize.width * 0.25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    width: screenSize.width * 0.3,
                    height: screenSize.width * 0.1,
                    child: IconButton(
                        icon: Icon(
                          Icons.add,
                        ),
                        onPressed: (() async {
                          var inputFormat = DateFormat('dd/MM/yyyy');
                          var inputDate = inputFormat.parse(
                              '${_dateController.text}'); // <-- dd/MM 24H format

                          var outputFormat = DateFormat('yyyy/MM/dd');
                          var outputDate = outputFormat.format(inputDate);
                          await registerMoviment(
                              _userStore.ID!,
                              _localController.text,
                              double.parse(_valueController.text),
                              _descriController.text,
                              outputDate.replaceAll('/', '-'),
                              'IN');
                          _userStore.setSald(_userStore.sald! +
                              double.parse(_valueController.text));
                          _dateController.text = '';
                          _valueController.text = '';
                          _descriController.text = '';
                          _localController.text = '';
                        })),
                  ),
                ]),
              ),
            )
          ]),
        ));
  }
}
