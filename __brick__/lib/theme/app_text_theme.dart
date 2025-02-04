import 'app_colors.dart';
import 'app_size.dart';
import 'package:flutter/widgets.dart';

class AppTextTheme {
  {{#textStyles}}
  static const TextStyle {{name}} = TextStyle(fontSize : {{size}}, color: Color({{color}}), fontFamily: "{{fontFamily}}");
  {{/textStyles}}
}
