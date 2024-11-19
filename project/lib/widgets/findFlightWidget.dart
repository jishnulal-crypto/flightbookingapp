import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/models/departureModel.dart';
import 'package:project/models/fromLocationModel.dart';
import 'package:project/models/ticket_model.dart';
import 'package:project/models/toLocationModel.dart';
import 'package:project/providers/home_screen_provider.dart';
import 'package:project/utils/utils.dart';
import 'package:project/widgets/find_tickets_button.dart';
import 'package:project/widgets/flutter_auto_complete_textfield.dart';
import 'package:project/widgets/tab_item_widget.dart';
import 'package:provider/provider.dart';

class TabBarContainerScreen extends StatefulWidget {
  @override
  State<TabBarContainerScreen> createState() => _TabBarContainerScreenState();
}

class _TabBarContainerScreenState extends State<TabBarContainerScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  FruitSearchProvider? _fruitSearchProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _fruitSearchProvider = context.read<FruitSearchProvider>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DefaultTabController(
        length: 3, // Number of tabs
        child: SizedBox(

            width: double.infinity,
            height: 340,
            child: Consumer<HomeScreenProvider>(
              builder: (context, provider, child) {
              _fruitSearchProvider = Provider.of<FruitSearchProvider>(context);
              _tabController ??= DefaultTabController.of(context);
              provider.listenOnTabChanging(_tabController!,_fruitSearchProvider!);
              return Column(
                children: [
                  SizedBox(height: 10,),
                  SizedBox(
                    child: TabBar(
                      dividerColor: Colors.white,
                      indicatorColor: Colors.white,
                      tabs: [
                        Center(child: TabItemWidget(text: "Tab1",)),
                        Center(child: TabItemWidget(text: "Tab2",)),
                        Center(child: TabItemWidget(text: "Tab3",)),
                      ],
                    ),
                  ),
                  // Consumer<HomeScreenProvider>(
                  //   builder: (context, provider, child) {
                  //     return Text(
                  //       "Current Tab Index: ${provider.currentTabIndex}",
                  //       style: TextStyle(
                  //           fontSize: 18, fontWeight: FontWeight.bold),
                  //     );
                  //   },
                  // ),
                  // TabBarView for content switching
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)
                      ),
                      
                      width: double.infinity,
                      height: 300,
                      child: TabBarView(
                        children: [
                          Center(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SearchTextField(
                                category: SearchCategory.from,
                                onSelected: (value) {},
                              ),
                              SearchTextField(
                                category: SearchCategory.to,
                                onSelected: (model) {},
                              ),
                              SearchTextField(
                                category: SearchCategory.departure,
                                onSelected: (model) {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                          Center(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SearchTextField(
                                onSelected: (value) {},
                              ),
                              SearchTextField(
                                onSelected: (model) {},
                              ),
                              SearchTextField(
                                onSelected: (model) {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                          Center(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SearchTextField(
                                onSelected: (value) {},
                              ),
                              SearchTextField(
                                onSelected: (model) {},
                              ),
                              SearchTextField(
                                onSelected: (model) {},
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  FindTicketsButton()
                ],
              );
            })),
      ),
    );
  }

  //  @override
  // void dispose() {
  //   _tabController!.dispose();
  //   super.dispose();
  // }
}
