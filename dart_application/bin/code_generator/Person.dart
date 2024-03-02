import 'package:freezed_annotation/freezed_annotation.dart';

part 'Person.freezed.dart';
part 'Person.g.dart';

@freezed
class Person with _$Person {
  factory Person({
    required String name,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
