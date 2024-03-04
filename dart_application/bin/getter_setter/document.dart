class Document {
  // _ 로 시작되면 private 라고 생각하면 된다. 외부 접근 X
  String _content;

  // 의존성이 있는 코드들을 getter와 setter로 묶어서 관리
  String get content {
    _readCount += 1;
    return _content;
  }

  set content(String value) {
    _content = value;
    _updateCount += 1;
  }

  // private 으로 바꿔줌으로 외부에서 의도치 않게 변경되는 것을 방지
  int _readCount = 0;
  int _updateCount = 0;

  // 통계
  String get statistic =>
      "readCount : $_readCount / updateCount : $_updateCount";

  Document(this._content);
}
