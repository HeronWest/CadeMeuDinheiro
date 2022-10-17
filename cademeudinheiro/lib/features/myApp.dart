import 'package:cademeudinheiro/features/moviment/moviment_store.dart';
import 'package:cademeudinheiro/features/pages/login_page.dart';
import 'package:cademeudinheiro/features/user/user_store.dart';
import 'package:cademeudinheiro/services/firebase_messaging_service.dart';
import 'package:cademeudinheiro/services/nottification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../adm/adm_store.dart';
import '../routes/routes.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final UserStore _userStore = UserStore();
  final MovimentStore _movimentStore = MovimentStore();
  final AdmStore _admStore = AdmStore();


  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        Provider<NotificationService>(create: (context) => NotificationService()),
        Provider<UserStore>(create: (_) => _userStore),
        Provider<MovimentStore>(create: (_) => _movimentStore),
        Provider<AdmStore>(create: (_) => _admStore),
        Provider<FirebaseMessagingService>(create: (context) => FirebaseMessagingService(context.read<NotificationService>()))
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
