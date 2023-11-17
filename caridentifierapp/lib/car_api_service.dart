import 'dart:convert';
import 'package:caridentifierapp/car_model.dart';
import 'package:http/http.dart' as http;

class CarApiService {
static const String baseUrl = 'https://api.api-ninjas.com/v1/cars';
  static const String apiKey = 'HQFOejzNXetb3Eqv1aoGVA==ChQT6d1ZRcqCw2EY';

  Future<List<CarModel>> searchCars({
    String? make,
    String? model,
    String? fuelType,
    String? drive,
    int? cylinders,
    String? transmission,
    int? year,
    double? minCityMpg,
    double? maxCityMpg,
    /* add other parameters */
  }) async {
    final Map<String, String> queryParams = {
      'limit': '3', // Default limit is 5, you can change it as needed
      'make': make ?? '', // Include only if not null
      'model': model ?? '', // Include only if not null
      'fuel_type': fuelType ?? '', // Include only if not null
      'drive': drive ?? '', // Include only if not null
      'cylinders': cylinders?.toString() ?? '', // Include only if not null
      'transmission': transmission ?? '', // Include only if not null
      'year': year?.toString() ?? '', // Include only if not null
      'min_city_mpg': minCityMpg?.toString() ?? '', // Include only if not null
      'max_city_mpg': maxCityMpg?.toString() ?? '', // Include only if not null
      // Add other parameters here
    };

    final Uri uri = Uri.parse('$baseUrl?${_encode(queryParams)}');

    final response = await http.get(uri, headers: {'X-Api-Key': apiKey});

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load car data');
    }
  }


  String _encode(Map<String, String> params) {
    return params.entries
        .map((entry) =>
            '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
        .join('&');
  }
}
