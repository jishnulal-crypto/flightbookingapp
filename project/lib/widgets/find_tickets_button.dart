import 'package:flutter/material.dart';
import 'package:project/widgets/flutter_auto_complete_textfield.dart';
import 'package:provider/provider.dart';

class FindTicketsButton extends StatelessWidget {
  const FindTicketsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final fruitProvider = Provider.of<FruitSearchProvider>(context);

    return ElevatedButton(onPressed: (){
       print(fruitProvider.searchCriteria.toString());
    }, child: Text("Search Tickets"));
  }
} 