
import 'package:flutter/material.dart';
import 'package:project/widgets/findFlightWidget.dart';
import 'package:project/widgets/flutter_auto_complete_textfield.dart';
import 'package:project/widgets/offers_widget.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TabBarContainerScreen(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("offers"))),
            OffersWidget(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("offers"))),
            OffersWidget(),
          ],
        ),
      ),
    );
  }
}


class CounterProvider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}