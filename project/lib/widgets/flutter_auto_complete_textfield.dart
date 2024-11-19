import 'package:flutter/material.dart';
import 'package:project/models/departureModel.dart';
import 'package:project/models/fromLocationModel.dart';
import 'package:project/models/ticket_model.dart';
import 'package:project/models/toLocationModel.dart';
import 'package:project/utils/utils.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String) onSelected;
  final SearchCategory? category;
  const SearchTextField({Key? key, required this.onSelected, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<FruitSearchProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            } else {
              provider.updateSearchText(textEditingValue.text);
              return provider.filteredOptions;
            }
          },
          onSelected: (v) {
            if (category != null) {
              print("details of the selected criteria");
              return provider.onSelected(v, category!);
  
            } else {}
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// Provider class to manage the search state
class FruitSearchProvider with ChangeNotifier {
  // Full list of fruits
  static const List<String> fruitOptions = <String>[
    'apple',
    'banana',
    'orange',
    'mango',
    'grapes',
    'watermelon',
    'kiwi',
    'strawberry',
    'sugarcane',
  ];

  SearchCriteria searchCriteria = SearchCriteria();

  // Current search text
  String _searchText = '';

  // Filtered options based on the search text
  List<String> get filteredOptions {
    return fruitOptions
        .where((option) => option.contains(_searchText.toLowerCase()))
        .toList();
  }

  // Update the search text and notify listeners
  void updateSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  void clearSelection() {
    // searchCriteria = SearchCriteria();
  }

  void updateToLocation(String location) {
    searchCriteria.selectedToLocation = location;
    notifyListeners();
  }

  void updateFromLocation(String location) {
    searchCriteria.selectedFromLocation = location;
    notifyListeners();
  }

  void updateDeparture(String departure) {
    searchCriteria.selectedDeparture = departure;
    notifyListeners();
  }

  void onSelected(String v, SearchCategory category) {
    if (category == SearchCategory.to) {
      updateToLocation(v);
    } else if (category == SearchCategory.from) {
      updateFromLocation(v);
    } else if (category == SearchCategory.departure) {
      updateDeparture(v);
    } else {}
      print(searchCriteria.toString());
  }
}
