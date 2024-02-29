void main() {
  // 추가
  List<int> a1 = const [1];
  a1 = [...a1, 2];
  print(a1); // [1, 2]

  // 수정
  List<int> b1 = const [1];
  b1 = b1.map((v) => v == 1 ? 2 : v).toList();
  print(b1); // [2]

  // 삭제
  List<int> c1 = const [1];
  c1 = c1.where((v) => v != 1).toList(); // where : 값들을 비교해서 true인 값만 반환
  print(c1); // []

  // 컴파일 타임에 고정될 수 없는 객체는 const로 선언할 수 없다.
  // 위에서 추가, 수정, 삭제 된 후의 리스트 객체값은 가변 객체이다.

  // 불변 객체로 만들기 위해서는
  c1 = List.unmodifiable(c1.where((v) => v != 1).toList());
  // 이런 식으로 선언해야 런타임에 수정이 불가능한 객체가 된다.

  // 하지만 const 키워드를 사용하는 경우에만 얕은 복사의 장점을 가질 수 있다.
  // 즉, const 가 붙어야 값이 같은 경우 동일한 메모리 주소를 가리키게 된다.
}
