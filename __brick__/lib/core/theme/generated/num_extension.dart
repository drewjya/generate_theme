import 'package:flutter/material.dart';

{{#screen_util}}
import 'package:flutter_screenutil/flutter_screenutil.dart';
{{/screen_util}}

extension GenerateThemeNum on num {
  double orientationSp(BuildContext context) =>
      (this / ((MediaQuery.orientationOf(context) == Orientation.portrait) ? 1 : 2.3))
      {{#screen_util}}
      .sp
      {{/screen_util}}
      ;
}
