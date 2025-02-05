import 'package:flutter/widgets.dart';

import 'app_color.dart';
import 'app_font.dart';

class AppTextTheme {
  {{#colors}}
  static const {{name}} = TextStyle(color:AppColor.{{name}}, fontFamily: "{{fontFamily}}",);
  {{/colors}}
  
  {{#textStyles}}
  static const {{name}} = TextStyle(fontSize : {{size}}, fontFamily: "{{fontFamily}}",);
  {{/textStyles}}

  
}
