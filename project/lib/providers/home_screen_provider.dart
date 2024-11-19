import 'package:flutter/material.dart';
import 'package:project/models/ticket_model.dart';
import 'package:project/widgets/flutter_auto_complete_textfield.dart';
import 'package:provider/provider.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider(){

  }
  int? currentTabIndex =0;

  void listenOnTabChanging(TabController controller , FruitSearchProvider provider){
    controller.addListener((){
      if (controller.indexIsChanging) {
        updateTabIndex(controller.index , provider);
      }
    });
  }
  
  void updateTabIndex(int index , FruitSearchProvider provider) {
    currentTabIndex = index;
    provider.clearSelection();
    notifyListeners();
    print("currenttab index");
    print("$currentTabIndex");
  }
}
