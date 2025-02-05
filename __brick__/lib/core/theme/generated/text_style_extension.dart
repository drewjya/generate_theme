import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_font.dart';

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


}
