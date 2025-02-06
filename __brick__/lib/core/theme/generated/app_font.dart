{{#screen_util}}
import 'package:flutter_screenutil/flutter_screenutil.dart';
{{/screen_util}}

class AppFont {
  {{#fontSizes}}
  static final {{name}} = {{size}};
  {{/fontSizes}}

  {{#fontSizes}}
  static final {{name}}Basic = {{basic}};
  {{/fontSizes}}
}
