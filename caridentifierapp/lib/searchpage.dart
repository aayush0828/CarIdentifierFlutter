import 'package:caridentifierapp/cardetail.dart';
import 'package:flutter/material.dart';
import 'car_model.dart'; // Import your CarModel class
import 'car_api_service.dart'; // Import your CarApiService class

class SearchCarPage extends StatefulWidget {
  @override
  _SearchCarPageState createState() => _SearchCarPageState();
}

class _SearchCarPageState extends State<SearchCarPage> {
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final CarApiService _apiService = CarApiService();

  void _searchCars(BuildContext context) async {
    final String modelQuery = _modelController.text.trim();
    final String yearQuery = _yearController.text.trim();

    if (modelQuery.isNotEmpty) {
      try {
        final List<CarModel> results = await _apiService.searchCars(
          model: modelQuery,
          year: int.tryParse(yearQuery),
        );
        if (results.isNotEmpty) {
          // Show a dialog to choose from the results
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Choose a car'),
              content: Column(
                children: [
                  for (var car in results)
                    ListTile(
                      title: Text('${car.make} ${car.model} ${car.year}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailPage(car: car),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          );
        } else {
          // Handle case when no results are found
          // You can show a snackbar or navigate to an error page
          print('No results found');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Cars'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _modelController,
              decoration: InputDecoration(
                hintText: 'Enter car model...',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _yearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter car year...',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _searchCars(context),
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
