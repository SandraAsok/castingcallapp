import 'package:equatable/equatable.dart';

class DirectorModel extends Equatable {
  final String id;
  final String image;
  final String userName;

  const DirectorModel({
    required this.id,
    required this.image,
    required this.userName,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'userName': userName,
      };
}
