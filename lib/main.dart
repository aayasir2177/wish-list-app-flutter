import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list_app/providers/favorite_provider.dart';
import 'package:wish_list_app/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (create) => FavoriteProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.indigoAccent,
              titleTextStyle: TextStyle(color: Colors.white70, fontSize: 24))),
      home: const HomeScreen(),
    );
  }
}
