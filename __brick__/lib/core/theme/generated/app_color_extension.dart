import 'package:flutter/material.dart';

import 'app_color.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  {{#colorsExtension}}
  final Color {{name}};
  {{/colorsExtension}}

  const AppColorExtension({
    {{#colorsExtension}}
    required this.{{name}},
    {{/colorsExtension}}
  });

  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }
    
    return AppColorExtension(
      {{#colorsExtension}}
      {{name}}: Color.lerp({{name}}, other.{{name}}, t)!,
      {{/colorsExtension}}
    );
  }

    @override
  ThemeExtension<AppColorExtension> copyWith({
    {{#colorsExtension}}
    Color? {{name}},
    {{/colorsExtension}}
  }) {
    return AppColorExtension(
      {{#colorsExtension}}
      {{name}}: {{name}} ?? this.{{name}},
      {{/colorsExtension}}
    );
  }

  factory AppColorExtension.dark(){
    return const AppColorExtension(
      {{#colorsExtension}}
      {{#theme}}
      {{name}}: AppColor.{{name}}Dark,
      {{/theme}}
      {{#noTheme}}
      {{name}}: AppColor.{{name}},
      {{/noTheme}}
      {{/colorsExtension}}
    );
  }
  factory AppColorExtension.light(){
      return const AppColorExtension(
        {{#colorsExtension}}
      {{#theme}}
      {{name}}: AppColor.{{name}}Light,
      {{/theme}}
      {{#noTheme}}
      {{name}}: AppColor.{{name}},
      {{/noTheme}}
      {{/colorsExtension}}
    );
  }
}