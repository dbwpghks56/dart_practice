class A {
  final int value1; // 불변 객체로 만들기 위해서는 final 키워드를 사용한다.
  final int value2;

  const A({
    // 불변 객체로 만들기 위해서는 const 키워드를 사용한다.
    required this.value1,
    required this.value2,
  });

  @override
  String toString() {
    return 'A(value1: $value1, value2: $value2)';
  }

  A copyWith({
    int? value1,
    int? value2,
  }) {
    return A(value1: value1 ?? this.value1, value2: value2 ?? this.value2);
  }
}

void main() {
  A a = A(value1: 1, value2: 2);
  A b = a; // 얕은 복사

  // a.value1 = 3; 불변 객체로 만들었기 때문에 컴파일 에러가 발생한다.

  // a = A(value1: 2, value2: a.value2); // 새로운 객체를 만들어서 할당한다. (깊은 복사)
  a = a.copyWith(value1: 2); // copyWith 메서드를 사용해서 새로운 객체를 만들어서 할당한다. (깊은 복사)

  print(a);
  print(b);
}
