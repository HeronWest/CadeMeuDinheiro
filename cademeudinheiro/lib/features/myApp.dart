import 'package:cademeudinheiro/features/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

    ],
    child: MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      home: LoginPage(),
    ),
    );
  }
}