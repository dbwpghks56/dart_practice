import 'dart:convert';

class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  // factory 키워드를 사용하면 생성자를 여러 개 만들 수 있다.
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return '이름은 $name 나이는 $age세 입니다.';
  }
}

void main() {
  // 네트워크 응답 문자열
  String jsonString = '{"name": "유제환", "age": 26 }';

  // Json 포맷 String -> Map<String, dynamic>
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  print(jsonMap);

  // Map<String, dynamic> -> Person
  Person person = Person.fromJson(jsonMap);

  print(person.toString());

  // Person -> Map<String, dynamic>
  print(person.toJson());

  // Map<String, dynamic> -> Json 포맷 String
  String personString = jsonEncode(person.toJson());
  print(personString);
}
