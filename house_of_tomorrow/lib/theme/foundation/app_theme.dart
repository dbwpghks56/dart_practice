import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/theme/res/typo.dart';

// dart에서 part는 여러 파일에 걸쳐 작성된 코드를 하나의 클래스로 합치는데 사용된다.
part 'app_color.dart';
part 'app_deco.dart';
part 'app_typo.dart';

abstract class AppTheme {
  late final Brightness brightness;
  late final AppColor color;
  late final AppDeco deco;
  late final AppTypo typo;
}
