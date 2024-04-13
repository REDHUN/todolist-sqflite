// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  String title;
  String? todoid;
  String description;
  bool isdone;
  bool isdeleted;

  TodoEntity({
    this.todoid,
    required this.title,
    required this.description,
    required this.isdone,
    required this.isdeleted,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'isdone': isdone ? 1 : 0,
        'isdeleted': isdeleted ? 1 : 0,
        'todoid': todoid,
      };

  @override
  List<Object?> get props => [title, description, isdeleted, isdone, todoid];
}
