import 'package:brasil_fields/brasil_fields.dart';
import 'package:cademeudinheiro/adm/adm_controller.dart';
import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/widgets/appbar.dart';
import 'package:cademeudinheiro/features/widgets/drawer.dart';
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

class _homeState extends State<HomePage> {

  late UserStore _userStore;
  late MovimentStore _movimentStore;
  AdmController _admController = AdmController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    _movimentStore = Provider.of<MovimentStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const MyAppBar(),
        drawer: MyDrawer(),
        backgroundColor: Color.fromARGB(255, 217, 245, 243),
        body: Observer(builder: (context) {
          return _movimentStore.load
              ? SingleChildScrollView(
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
                                        style:
                                            TextStyle(color: Colors.black54)),
                                  )),
                              Container(
                                  width: screenSize.width * 0.85,
                                  margin: const EdgeInsets.only(top: 2),
                                  child: Center(
                                    child: Text(
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
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: screenSize.width * 0.85,
                      height: screenSize.height * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 0, 194, 184)),
                          color: Color.fromARGB(255, 217, 245, 243)),
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        title: ChartTitle(text: 'Consumo'),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<dynamic, String>>[
                          LineSeries(
                            dataSource: _movimentStore.data,
                            xValueMapper: (values, _) =>
                                values.days,
                            yValueMapper: (values, _) =>
                                values.values,
                          )
                        ],
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
                              onChanged: _movimentStore.setLocalController,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 194, 184)),
                              decoration: const InputDecoration(
                                  labelText: 'Local',
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 0, 194, 184))),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 0, 194, 184)))),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: screenSize.width * 0.05,
                            ),
                            width: screenSize.width * 0.20,
                            height: screenSize.height * 0.07,
                            child: TextFormField(
                              onChanged: _movimentStore.setValueController,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 194, 184)),
                              decoration: const InputDecoration(
                                  isDense: true,
                                  labelText: 'Valor',
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 0, 194, 184))),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 0, 194, 184)))),
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.20,
                            height: screenSize.height * 0.07,
                            child: TextFormField(
                              onChanged: _movimentStore.setDateController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter(),
                              ],
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 194, 184)),
                              decoration: const InputDecoration(
                                  isDense: true,
                                  labelText: 'Data',
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 0, 194, 184))),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 0, 194, 184)))),
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
                        onChanged: _movimentStore.setDescriController,
                        minLines: 1,
                        maxLines: 4,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 194, 184),
                            fontSize: 14),
                        decoration: const InputDecoration(
                            isDense: true,
                            labelText: 'Descrição',
                            labelStyle:
                                TextStyle(fontSize: 14, color: Colors.black54),
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
                                      '${_movimentStore.dateController}'); // <-- dd/MM 24H format

                                  var outputFormat = DateFormat('yyyy/MM/dd');
                                  var outputDate =
                                      outputFormat.format(inputDate);

                                  await _admController.registerMoviment(
                                      _userStore.ID!,
                                      _userStore.ID!,
                                      _movimentStore.localController,
                                      double.parse(_movimentStore.valueController),
                                      _movimentStore.descriController,
                                      outputDate.replaceAll('/', '-'),
                                      'OUT');
                                  _userStore.setSald(_userStore.sald! -
                                      double.parse(
                                          _movimentStore.valueController));

                                  await showNotification(
                                      _userStore.sald!, _userStore.minim!);
                                  await _movimentStore.setLastMoviments();
                                  _movimentStore.cleanControllers();
                                })),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 5, left: screenSize.width * 0.25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            width: screenSize.width * 0.3,
                            height: screenSize.width * 0.1,
                            child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: (() async {
                                  var inputFormat = DateFormat('dd/MM/yyyy');
                                  var inputDate = inputFormat.parse(
                                      '${_movimentStore.dateController}'); // <-- dd/MM 24H format

                                  var outputFormat = DateFormat('yyyy/MM/dd');
                                  var outputDate =
                                      outputFormat.format(inputDate);
                                  await _admController.registerMoviment(
                                      _userStore.ID!,
                                      _userStore.ID!,
                                      _movimentStore.localController,
                                      double.parse(_movimentStore.valueController),
                                      _movimentStore.descriController,
                                      outputDate.replaceAll('/', '-'),
                                      'IN');

                                  _userStore.setSald(_userStore.sald! + double.parse(_movimentStore.valueController));
                                  await _movimentStore.setLastMoviments();
                                  _movimentStore.cleanControllers();
                                })),
                          ),
                        ]),
                      ),
                    )
                  ]),
                )
              : const Center(child: CircularProgressIndicator());
        }));
  }

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
}
