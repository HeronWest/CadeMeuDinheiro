import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'dart:io';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cademeudinheiro/features/moviment/moviment_model.dart';
import 'package:cademeudinheiro/features/widgets/appbar.dart';
import 'package:cademeudinheiro/features/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'package:pdf/widgets.dart' as pw;
import '../moviment/moviment_store.dart';
import 'package:flutter_sms/flutter_sms.dart';

class CustomRow {
  final String movDate;
  final String movLoc;
  final String movDes;
  final String movValue;
  final String movType;

  CustomRow(
      this.movDate, this.movLoc, this.movDes, this.movValue, this.movType);
}

pw.Expanded itemColumn(List<CustomRow> elements, bool fourColumns) {
  return pw.Expanded(
    child: pw.Column(
      children: [
        for (var element in elements)
          pw.Column(children: [
            pw.Row(
              children: [
                pw.Expanded(
                    child: pw.Text(
                  element.movDate,
                  textAlign: pw.TextAlign.left,
                )),
                pw.Expanded(
                    child: pw.Text(
                  element.movLoc,
                  textAlign: pw.TextAlign.left,
                )),
                pw.Expanded(
                    child: pw.Text(
                  element.movDes,
                  textAlign: pw.TextAlign.left,
                )),
                fourColumns
                    ? pw.Expanded(
                        child: pw.Text(
                        element.movValue,
                        textAlign: pw.TextAlign.right,
                      ))
                    : pw.Container(),
                pw.Expanded(
                    child: pw.Text(
                  element.movType,
                  textAlign: pw.TextAlign.right,
                )),
              ],
            ),
            pw.SizedBox(height: 15),
          ])
      ],
    ),
  );
}

itemRow(CustomRow elements, bool fiveColumns) {
  return pw.Container(
    padding: pw.EdgeInsets.only(bottom: 10),
    child: pw.Column(
      children: [
        pw.Column(children: [
          pw.Row(
            children: [
              pw.Expanded(
                  child: pw.Text(elements.movDate,
                      textAlign: pw.TextAlign.left,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 14))),
              pw.Expanded(
                  child: pw.Text(elements.movLoc,
                      textAlign: pw.TextAlign.left,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 14))),
              pw.Expanded(
                  child: pw.Text(elements.movDes,
                      textAlign: pw.TextAlign.left,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 14))),
              pw.Expanded(
                  child: pw.Text(elements.movValue,
                      textAlign: pw.TextAlign.right,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 14))),
              pw.Expanded(
                  child: pw.Text(elements.movType,
                      textAlign: pw.TextAlign.right,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 14))),
            ],
          ),
          pw.SizedBox(height: 2),
        ])
      ],
    ),
  );
}

class PdfInvoiceService {
  Future<Uint8List> createInvoice(MovimentStore _movimentStore) async {
    final pdf = pw.Document();
    int n = 0;
    final CustomRow header =
        CustomRow('Data', 'Local', "Descrição", 'Valor', "Tipo");
    var elements = List<CustomRow>.generate(
        _movimentStore.moviments.length,
        (index) => CustomRow(
            _movimentStore.moviments[index].date!,
            _movimentStore.moviments[index].local!,
            _movimentStore.moviments[index].descri!,
            "R\$${_movimentStore.moviments[index].value!.toStringAsFixed(2)}",
            _movimentStore.moviments[index].type!));
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            itemRow(header, true),
            itemColumn(elements, true),
          ]);
        }));
    return pdf.save;
  }

  Future<String> savePdfFile(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    print(filePath);
    return filePath;
  }
}

class RelatoryPage extends StatefulWidget {
  const RelatoryPage({super.key});

  @override
  State<RelatoryPage> createState() => _RelatoryPageState();
}

class _RelatoryPageState extends State<RelatoryPage> {

  TextEditingController _dateControllerI = TextEditingController();
  TextEditingController _dateControllerF = TextEditingController();
  TextEditingController _valueControllerI = TextEditingController();
  TextEditingController _valueControllerF = TextEditingController();
  String dropdownValue = 'Ambos';
  String dropdownValue2 = 'Mais recentes';
  String dropdownID = 'IN';

  final PdfInvoiceService service = PdfInvoiceService();

  late MovimentStore _movimentStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movimentStore = Provider.of<MovimentStore>(context);
    _movimentStore.setMoviments();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 5),
                width: screenSize.width * 0.30,
                height: screenSize.height * 0.07,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _dateControllerI,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                  style:
                      const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                  decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Data Início',
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
              SizedBox(
                width: screenSize.width * 0.30,
                height: screenSize.height * 0.07,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _dateControllerF,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                  style:
                      const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
                  decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Data Fim',
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
          ),
          // SizedBox(
          //   width: screenSize.width * 0.20,
          //   height: screenSize.height * 0.07,
          //   child: DropdownButton<String>(
          //     alignment: Alignment.center,
          //     value: dropdownValue,
          //     elevation: 16,
          //     style: const TextStyle(color: Color.fromARGB(255, 0, 194, 184)),
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         dropdownValue = newValue!;
          //         if (newValue == 'Saída') {
          //           dropdownID = 'OUT';
          //         } else {
          //           dropdownID = 'IN';
          //         }
          //       });
          //     },
          //     items: <String>['Ambos', 'Saída', 'Entrada']
          //         .map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(value),
          //       );
          //     }).toList(),
          //   ),
          // ),
          SizedBox(
            width: screenSize.width * 0.65,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 0, 194, 184))),
              onPressed: () async {
                List rangeI = _dateControllerI.text.split('/');
                List rangeF = _dateControllerF.text.split('/');
                await _movimentStore.setMoviments(
                    initialDate: DateTime(int.parse(rangeI[2]),
                            int.parse(rangeI[1]), int.parse(rangeI[0]))
                        .toString(),
                    finalDate: DateTime(int.parse(rangeF[2]),
                            int.parse(rangeF[1]), int.parse(rangeF[0]))
                        .toString());
                final data = await service.createInvoice(_movimentStore);
                var filePath = await service.savePdfFile("relatorio", data);
              },
              child: const Text(
                'GERAR RELATÓRIO',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            width: screenSize.width * 0.65,
            child: Text(
              'Caso queira um relatório de todas as transações deixe os campos em branco que gerará automaticamente.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11),
            ),
          )
        ],
      ),
    );
  }
}
