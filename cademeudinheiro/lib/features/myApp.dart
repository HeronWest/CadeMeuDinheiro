import 'package:cademeudinheiro/features/login_page/login_page.dart';
import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final UserStore _userStore = UserStore();
  final MovimentStore _movimentStore = MovimentStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => _userStore),
        Provider<MovimentStore>(create: (_) => _movimentStore)
      ],
      child: MaterialApp(
        initialRoute: Routes.initial,
        routes: Routes.routes,
        theme: ThemeData(
            sliderTheme:
                SliderThemeData(showValueIndicator: ShowValueIndicator.always),
            useMaterial3: true,
            primaryColor: Color.fromARGB(255, 0, 194, 184),
            fontFamily: 'Roboto'),
        home: LoginPage(),
      ),
    );
  }
}
