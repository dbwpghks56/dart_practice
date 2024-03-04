class Scanner {
  void scanning() => print('Scanning...');
}

// 다중상속을 해결할 수 있지만, Printer만 상속받는 방법을 찾아야한다.
class Printer extends Scanner {
  void printing() => print('Printing...');
}

// dart 는 다중 상속을 지원하지 않는다.
class Machine extends Printer {}

void main() {
  var machine = Machine();
  machine.printing();
  machine.scanning();
}
