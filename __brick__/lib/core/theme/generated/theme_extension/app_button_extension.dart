import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated.dart';

class AppButtonExtension extends ThemeExtension<AppButtonExtension> {
  {{#button_styles}}
  final ButtonDecoration {{name}};
  {{/button_styles}}

  const AppButtonExtension({
    {{#button_styles}}
    required this.{{name}},
    {{/button_styles}}  
  });
  
  @override
  ThemeExtension<AppButtonExtension> copyWith({
    {{#button_styles}}
    ButtonDecoration? {{name}};
    {{/button_styles}}
  }) {
    return AppButtonExtension(
      {{#button_styles}}
      {{name}}: {{name}} ?? this.{{name}},
      {{/button_styles}}
    );
  }

  @override
  ThemeExtension<AppButtonExtension> lerp(
      covariant ThemeExtension<AppButtonExtension>? other, double t) {
    if (other is! AppButtonExtension) {
      return this;
    }
    
    return AppButtonExtension(
      {{#button_styles}}
      {{name}}: ButtonDecoration.lerp({{name}}, other.{{name}}, t)!,
      {{/button_styles}}
    );
  }

  factory AppButtonExtension.dark()=> AppButtonExtension(
    {{#button_styles}}
    {{name}}: ButtonDecoration(
    borderRadius: BorderRadius.circular({{radius}}),
    backgroundColor: AppColor.{{color}}
    {{#theme}}
    Dark
    {{/theme}}
    ,
    padding: EdgeInsets.add(
      {{padding}}
      {{#screen_util}}
      .sp
      {{/screen_util}}
    ),
    {{#border_color}}
    border: Border.all(
            color: 
            AppColor.{{borderColor}}
            {{#borderTheme}}
            Dark
            {{/borderTheme}}
            ,
            width: {{borderWidth}}{{#screen_util}}
      .sp
      {{/screen_util}},
          ),
    {{/border_color}}
  ),
    
    {{/button_styles}}
  );

}