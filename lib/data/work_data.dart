

class Work {
  final String description;
  final String date;
  final String location;
  final String phoneNumber;
  final String name;

  Work({
    required this.description,
    required this.date,
    required this.location,
    required this.phoneNumber,
    required this.name,
  });

  Map<String, String> toJson() {
    return {
      'description': description,
      'date': date,
      'location': location,
      'phoneNumber': phoneNumber,
      'Name': name,
    };
  }

  factory Work.fromJson(Map<String, String> json) {
    return Work(
      description: json['description']!,
      date: json['date']!,
      location: json['location']!,
      phoneNumber: json['phoneNumber']!,
      name: json['Name']!,
    );
  }
}