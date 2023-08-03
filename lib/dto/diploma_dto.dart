class DiplomeDTO {
  final String date;
  final String title;
  final String description;
  final bool isCurrent;

  const DiplomeDTO({
    required this.date,
    required this.title,
    required this.description,
    this.isCurrent = false,
  });
}