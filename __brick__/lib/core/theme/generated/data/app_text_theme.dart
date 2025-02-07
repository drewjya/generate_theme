import 'package:flutter/widgets.dart';

import 'app_color.dart';
import 'app_font.dart';

class AppTextTheme {
  {{#colors}}
  static final {{name}} = TextStyle(fontFamily: "{{fontFamily}}",color:AppColor.{{name}}, letterSpacing: {{letter_spacing}},);
  {{/colors}}

  {{#textStyles}}
  static final {{name}} = TextStyle(fontFamily: "{{fontFamily}}",fontSize : {{size}}, letterSpacing: {{letter_spacing}},);
  {{/textStyles}}

  
}
