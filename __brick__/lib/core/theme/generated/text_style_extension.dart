import 'package:flutter/material.dart';
{{#screen_util}}
import 'package:flutter_screenutil/flutter_screenutil.dart';
{{/screen_util}}

import 'app_color.dart';
import 'app_font.dart';
import 'num_extension.dart';

extension GenThemeTextStyleExtension on TextStyle {
  
  {{#colorsListExtension}}
  TextStyle get {{name}} => copyWith(
    color: AppColor.{{name}},
  );
  {{/colorsListExtension}}
  {{#fontWeights}}
  TextStyle get w{{.}} => copyWith(
    fontWeight: FontWeight.w{{.}},
  );
  {{/fontWeights}}
  {{#fontSizes}}
  TextStyle get {{name}} => copyWith(
    fontSize: AppFont.{{name}},
  );
  {{/fontSizes}}

  {{#screen_util}}
  {{#fontSizes}}
  TextStyle {{name}}Orientation(BuildContext context) => copyWith(
    fontSize: AppFont.{{name}}Basic.orientationSp(context),
  );
  {{/fontSizes}}
  {{/screen_util}}

}
