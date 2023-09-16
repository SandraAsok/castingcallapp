class Shortlist {
  final String? id;
  final String userId;
  final String name;
  final String title;
  final String director;
  final String date;
  final String time;
  final String venue;

  Shortlist({
    this.id,
    required this.userId,
    required this.name,
    required this.title,
    required this.director,
    required this.date,
    required this.time,
    required this.venue,
  });
}
