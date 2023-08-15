import 'package:hive_flutter/hive_flutter.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class TodoModel extends HiveObject {
  TodoModel({
   required this.taskTitle,
   required this.task,
   

  });

  @HiveField(0)
  String taskTitle;

  @HiveField(1)
  String task;


}
