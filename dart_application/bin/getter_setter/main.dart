import 'document.dart';

void main() {
  final doc = Document("1");

  String content = doc.content;
  print(doc.statistic);

  doc.content = "2";
  print(doc.statistic);
}
