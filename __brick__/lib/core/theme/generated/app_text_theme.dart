import 'package:flutter/widgets.dart';

import 'app_color.dart';
import 'app_font.dart';

class AppTextTheme {
  {{#colors}}
  static const {{name}} = TextStyle(fontFamily: "{{fontFamily}}",color:AppColor.{{name}}, );
  {{/colors}}

  {{#textStyles}}
  static const {{name}} = TextStyle(fontFamily: "{{fontFamily}}",fontSize : {{size}},);
  {{/textStyles}}

  
}
