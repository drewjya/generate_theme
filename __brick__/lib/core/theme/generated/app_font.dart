{{#screenUtil}}
import 'package:flutter_screenutil/flutter_screenutil.dart';
{{/sceenUtil}}
class AppFont {
  {{#fontSizes}}
  static double {{name}} = {{size}};
  {{/fontSizes}}
}
