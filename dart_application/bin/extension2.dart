class Machine {}

extension MyMachineExt on Machine {
  void printing() => print('Printing...');
  void scanning() => print('Scanning...');
}

void main() {
  final machine = Machine();
  machine.printing();
  machine.scanning();
}
