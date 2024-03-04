// extension을 사용하여 기존 클래스에 새로운 기능을 추가할 수 있다.
void main() {
  // extension function 사용
  print('HELLO'.equalsIgnoreCase('hello'));
}

// String 클래스를 확장
extension MyStringExt on String {
  // Function
  // 대소문자를 무시하고 비교
  bool equalsIgnoreCase(String other) {
    return toLowerCase() == other.toLowerCase();
  }
}
