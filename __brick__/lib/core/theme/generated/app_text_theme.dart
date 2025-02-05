import 'package:flutter/widgets.dart';

import 'app_color.dart';
import 'app_font.dart';

class AppTextTheme {
  {{#textStyles}}
  static const {{name}} = TextStyle(fontSize : {{size}}, fontFamily: "{{fontFamily}}",);
  {{/textStyles}}

  {{#colors}}
  static const {{name}} = TextStyle(color:AppColor.{{name}}, fontFamily: "{{fontFamily}}",);
  {{/colors}}
  
}
