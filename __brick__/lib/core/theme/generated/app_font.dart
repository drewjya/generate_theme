{{^screen_util}}
import 'package:flutter_screenutil/flutter_screenutil.dart';
{{/screen_util}}

class AppFont {
  {{#fontSizes}}
  static double {{name}} = {{size}};
  {{/fontSizes}}
}
