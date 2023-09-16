class Posts {
  final String jobtitle;
  final String role;
  final String category;
  final String age;
  final String skill;
  final String contact;
  final String deadline;
  final List? imageList;
  final String? id;

  Posts({
    required this.jobtitle,
    required this.role,
    required this.category,
    required this.age,
    required this.skill,
    required this.contact,
    required this.deadline,
    this.imageList,
    this.id,
  });
}
