class A {
  final int value; // 바꿀 수 없게 된다.

  const A(this.value);

  @override
  String toString() {
    return "A($value)";
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || // 이것이 기본적으로 주소 같은지 비교하는 것
        other is A && // other 가 A 인지
            runtimeType == other.runtimeType && // 런타임에 타입이 서로 같은지
            value == other.value; // 값 비교
  }

  // hashCode 기반의 자료형은 hashCode 값이 변경되지 않는다는 전제하에 구현되어 있기 때문에 불변 객체로 만드는 게 좋다.
  @override // operator 를 override로 커스텀 할 경우 hashcode 또한 해줘야된다.
  int get hashCode => value.hashCode;
}

void main() {
  print(A(1) == A(1));

  print(A(1).hashCode);

  print(A(1));
}
