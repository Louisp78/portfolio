class DiplomaDTO {
  final String date;
  final String title;
  final String description;
  final bool isCurrent;

  const DiplomaDTO({
    required this.date,
    required this.title,
    required this.description,
    this.isCurrent = false,
  });

  factory DiplomaDTO.fromJson(Map<String, dynamic> json) {
    return DiplomaDTO(
      date: json['date'],
      title: json['title'],
      description: json['description'],
      isCurrent: json['isCurrent'] ?? false,
    );
  }
}