import 'package:flutter/material.dart';
import 'package:project/providers/home_screen_provider.dart';
import 'package:project/screens/dashboard_screen.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/widgets/flutter_auto_complete_textfield.dart';
import 'package:project/widgets/offers_widget.dart';
import 'package:provider/provider.dart';
void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => OffersProvider()),
        ChangeNotifierProvider(create: (_) => FruitSearchProvider()),
      ],
      child: MyApp(),
    ),
  );
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DashboardScreen(),
    );
  }
}


