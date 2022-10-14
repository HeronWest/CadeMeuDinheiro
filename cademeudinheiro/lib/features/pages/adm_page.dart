import 'package:cademeudinheiro/features/widgets/appbar.dart';
import 'package:cademeudinheiro/features/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AdmPage extends StatefulWidget {
  const AdmPage({Key? key}) : super(key: key);

  @override
  State<AdmPage> createState() => _AdmPageState();
}

class _AdmPageState extends State<AdmPage> {

  bool _sortDate = true;
  bool _sortLocal = true;
  bool _sortValue = true;
  bool _sortType = true;
  bool _sortAsc = true;
  int? _sortColumnIndex;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
        width: screenSize.width * 0.9,
          height: screenSize.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 0, 194, 184)),
              color: Color.fromARGB(255, 217, 245, 243)),
        )],
        ),
      ),
    );
  }
}
