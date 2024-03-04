mixin class Scanner {
  void scanning() => print('Scanning...');
}

mixin class Printer {
  void printing() => print('Printing...');
}

// 위 문법을 mixin이라고 부르며, 두 클래스에 동일한 이름의 메서드나 속성이 존재하는 경우, 더 뒤에 선언된 클래스의 것이 사용됩니다.
// extends 와 같이 사용할 수 있다.
class Machine with Printer, Scanner {}

void main() {
  var machine = Machine();
  machine.printing();
  machine.scanning();
}

/** 
class Scanner {}       // mixin 불가능 & 인스턴스 생성 가능
mixin Scanner {}       // mixin 가능 & 인스턴스 생성 불가능
mixin class Scanner {} // mixin 가능 & 인스턴스 생성 가능
*/
