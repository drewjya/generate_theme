import 'app_color.dart';
import 'app_font.dart';
import 'package:flutter/widgets.dart';

class AppTextTheme {
  {{#textStyles}}
  static const {{name}} = TextStyle(fontSize : {{size}}, color: {{color}}, fontFamily: "{{fontFamily}}",);
  {{/textStyles}}
  
}
