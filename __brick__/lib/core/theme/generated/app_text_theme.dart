import 'package:flutter/widgets.dart';

import 'app_font.dart';

class AppTextTheme {
  {{#textStyles}}
  static const {{name}} = TextStyle(fontSize : {{size}}, fontFamily: "{{fontFamily}}",);
  {{/textStyles}}
  
}
