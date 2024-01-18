class CarModel {
  String make;
  String model;
  String fuelType;
  String drive;
  int cylinders;
  String transmission;    
  int year;   
  double minCityMpg;
  double maxCityMpg;
  // Add other relevant fields
    
  CarModel({     
    required this.make,
    required this.model,   
    required this.fuelType,
    required this.drive,
    required this.cylinders,
    required this.transmission,
    required this.year,
    required this.minCityMpg,
    required this.maxCityMpg,
    // Add other fields
  });

  // Add a factory method to parse the JSON response
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      make: json['make'] ?? '',
      model: json['model'] ?? '',
      fuelType: json['fuel_type'] ?? '',
      drive: json['drive'] ?? '',
      cylinders: json['cylinders'] ?? 0,
      transmission: json['transmission'] ?? '',
      year: json['year'] ?? 0,
      minCityMpg: json['min_city_mpg'] ?? 0.0,
      maxCityMpg: json['max_city_mpg'] ?? 0.0,
      // Map other fields
    );
  }
}
