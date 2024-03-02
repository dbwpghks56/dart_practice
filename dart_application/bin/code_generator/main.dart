import 'dart:convert';

import 'Person.dart';

void main() {
  Person a = Person(name: '유제환', age: 26);
  Person b = a;

  a = a.copyWith(name: "나는야 제환");

  print("$a");
  print("$b");

  bool valueEquality =
      Person(name: '유제환', age: 26) == Person(name: '유제환', age: 26);

  print("값 비교 결과: $valueEquality");

  // json 직렬화
  Map<String, dynamic> json = a.toJson();
  print(json);

  String jsonString = jsonEncode(json);

  // json 역직렬화
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  Person person = Person.fromJson(jsonMap);
  print("fromJson: $person");
}
