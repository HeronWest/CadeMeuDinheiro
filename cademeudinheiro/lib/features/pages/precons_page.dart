import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user/user_store.dart';

class PreConsPage extends StatefulWidget {
  const PreConsPage({super.key});

  @override
  State<PreConsPage> createState() => _PreConsPageState();
}

class _PreConsPageState extends State<PreConsPage> {
  late double _value;
  late UserStore _userStore = UserStore();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    _value = _userStore.minim!;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 194, 184))),
                  onPressed: (() async {
                    Navigator.pushNamed(context, '/consult_page');
                  }),
                  child: Text(
                    'MOVIMENTAÇÕES',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 194, 184))),
                  onPressed: (() async {
                    Navigator.pushNamed(context, '/relatory_page');
                  }),
                  child: Text(
                    'EMITIR RELATÓRIO',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ]),
      ),
    );
  }
}
