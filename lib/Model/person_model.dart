import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'person_model.g.dart';

@HiveType(typeId: 1)
class PersonModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  final String favColor;

  PersonModel({required this.name, required this.age, required this.favColor});
}
