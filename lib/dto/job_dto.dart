class JobDTO {
  final String date;
  final String title;
  final String description;
  final String type;

  const JobDTO({
    required this.date,
    required this.title,
    required this.description,
    required this.type,
  });

  factory JobDTO.fromJson(Map<String, dynamic> json) {
    return JobDTO(
      date: json['date'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
    );
  }
}