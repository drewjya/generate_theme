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
      {{name}}: Color.lerp(this.{{name}}, other.{{name}}, t),
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
    return AppColorExtension(
      {{#colorsExtension}}
      {{#isTheme}}
      {{name}}: AppColor.{{isColorNameDark}},
      {{/isTheme}}
      
      {{#noTheme}}
      {{name}}: AppColor.{{name}},
      {{/noTheme}}
      {{/colorsExtension}}
    );
  }
  factory AppColorExtension.light(){
      return AppColorExtension(
      {{#colorsExtension}}
      {{#isTheme}}
      {{name}}: AppColor.{{isColorNameLight}},
      {{/isTheme}}
      
      {{#noTheme}}
      {{name}}: AppColor.{{name}},
      {{/noTheme}}
      {{/colorsExtension}}
    );
  }
}