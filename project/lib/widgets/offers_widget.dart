import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final offersProvider = Provider.of<OffersProvider>(context);

    return Center(
      child: offersProvider.isLoading
          ? CircularProgressIndicator()
          : offersProvider.offers.isEmpty
              ? Text("No offers available")
              : Container(
                margin: EdgeInsets.all(
                  10
                ),
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: offersProvider.offers.length,
                    itemBuilder: (context, index) {
                      final offer = offersProvider.offers[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.local_offer, size: 40, color: Colors.blue),
                              SizedBox(height: 10),
                              Text(
                                offer,
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

// Provider class for managing offers data
class OffersProvider with ChangeNotifier {
  List<String> _offers = [];
  bool _isLoading = false;

  List<String> get offers => _offers;
  bool get isLoading => _isLoading;

  OffersProvider() {
    fetchOffers(); // Fetch offers when the provider is initialized
  }

  Future<void> fetchOffers() async {
    _isLoading = true;
    notifyListeners();

    // Simulate an API call
    await Future.delayed(Duration(seconds: 2), () {
      _offers = List.generate(20, (index) => "Offer ${index + 1}");
    });

    _isLoading = false;
    notifyListeners();
  }
}