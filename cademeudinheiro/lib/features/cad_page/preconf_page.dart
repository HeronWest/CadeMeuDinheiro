import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user/user_store.dart';

class PreConfPage extends StatefulWidget {
  const PreConfPage({super.key});

  @override
  State<PreConfPage> createState() => _PreConfPageState();
}

class _PreConfPageState extends State<PreConfPage> {
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
                    Navigator.pushNamed(context, '/conf_page');
                  }),
                  child: Text(
                    'PERFIL',
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
                  onPressed: (() async {}),
                  child: Text(
                    'TROCAR SENHA',
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
