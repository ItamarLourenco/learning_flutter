import 'package:flutter/material.dart';
import 'application/locator_setup.dart';
import 'delivery/comics_details_screen.dart';
import 'delivery/comics_list_screen.dart';


void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comics Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      initialRoute: "list_comics",
      routes: {
        "list_comics": (context) => ComicsListScreen(),
        "detail_comics": (context) => ComicsDetailScreen(),
      },
    );
  }
}
