import 'package:equatable/equatable.dart';

class A extends Equatable {
  final int value;

  const A(this.value);

  @override
  List<Object?> get props => [value]; // 이 화살표 함수의 배열 안에 비교할 값을 넣어주면 된다.
}

void main() {
  print(A(1) == A(1));

  print(A(1));
}
