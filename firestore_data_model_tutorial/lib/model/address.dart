class Address {
  final String streetName;
  final String buildingName;
  final String cityName;

  Address(
      {required this.streetName,
      required this.buildingName,
      required this.cityName});

  Map<String, dynamic> toMap() {
    return {
      'streetName': streetName,
      'buildingName': buildingName,
      'cityName': cityName,
    };
  }

  Address.fromMap(Map<String, dynamic> addressMap)
      : streetName = addressMap["streetName"],
        buildingName = addressMap["buildingName"],
        cityName = addressMap["cityName"];
}