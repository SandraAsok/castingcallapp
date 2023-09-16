import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String id;
  final String image;
  final String userName;
  final String age;
  final String interest;
  final String bio;
  final String experience;

  const UserProfile({
    required this.id,
    required this.image,
    required this.userName,
    required this.age,
    required this.interest,
    required this.bio,
    required this.experience,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'userName': userName,
        'age': age,
        'interest': interest,
        'bio': bio,
        'experience': experience,
      };
}
