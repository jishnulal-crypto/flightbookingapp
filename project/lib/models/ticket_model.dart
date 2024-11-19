class SearchCriteria {
  String? selectedToLocation;
  String? selectedFromLocation;
  String? selectedDeparture;

  SearchCriteria({
    this.selectedToLocation,
    this.selectedFromLocation,
    this.selectedDeparture,
  });

  // Factory method to create an instance from a map (useful for serialization)
  factory SearchCriteria.fromMap(Map<String, dynamic> map) {
    return SearchCriteria(
      selectedToLocation: map['selectedToLocation'] as String?,
      selectedFromLocation: map['selectedFromLocation'] as String?,
      selectedDeparture: map['selectedDeparture'] as String?,
    );
  }

  // Convert the instance to a map (useful for serialization)
  Map<String, dynamic> toMap() {
    return {
      'selectedToLocation': selectedToLocation,
      'selectedFromLocation': selectedFromLocation,
      'selectedDeparture': selectedDeparture,
    };
  }

  // Override toString for easier debugging and logging
  @override
  String toString() {
    return 'SearchCriteria(selectedToLocation: $selectedToLocation, selectedFromLocation: $selectedFromLocation, selectedDeparture: $selectedDeparture)';
  }
}
