import 'package:flutter/material.dart';

import 'app_color.dart';

extension GenThemeTextStyleExtension on TextStyle {
  
  {{#colorsListExtension}}
  TextStyle get {{name}} => copyWith(
    color: AppColor.{{name}},
  );
  {{/colorsListExtension}}


  {{#fontWeights}}
  TextStyle get {{.}} => copyWith(
    fontWeights: FontWeight.w{{.}},
  );
  {{/fontWeights}}
}
