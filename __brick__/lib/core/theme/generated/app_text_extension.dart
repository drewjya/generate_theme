import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppTextExtension extends ThemeExtension<AppTextExtension> {
  
  {{#textExtensions}}
  final TextStyle {{name}};
  {{/textExtensions}}
  {{#fontSizes}}
  final TextStyle {{name}};
  {{/fontSizes}}
  

  const AppTextExtension({
    {{#textExtensions}}
    required this.{{name}},
    {{/textExtensions}}
    {{#fontSizes}}
    required this.{{name}},
    {{/fontSizes}}
  });

  @override
  ThemeExtension<AppTextExtension> copyWith({
    {{#textExtensions}}
    TextStyle? {{name}},
    {{/textExtensions}}
    {{#fontSizes}}
    TextStyle? {{name}},
    {{/fontSizes}}
  }) {
    return AppTextExtension(
      {{#textExtensions}}
      {{name}}: {{name}} ?? this.{{name}},
      {{/textExtensions}}
      {{#fontSizes}}
      {{name}}: {{name}} ?? this.{{name}},
      {{/fontSizes}}
    );
  }

  @override
  ThemeExtension<AppTextExtension> lerp(
      covariant ThemeExtension<AppTextExtension>? other, double t) {
    if (other is! AppTextExtension) {
      return this;
    }

    return AppTextExtension(
      {{#textExtensions}}
      {{name}}: TextStyle.lerp({{name}}, other.{{name}}, t)!,
      {{/textExtensions}}
      {{#fontSizes}}
      {{name}}: TextStyle.lerp({{name}}, other.{{name}}, t)!,
      {{/fontSizes}}
    );
  }

  factory AppTextExtension.dark(){
    return const AppTextExtension(
      
      {{#textExtensions}}
      
      {{#theme}}
      {{name}}: AppTextTheme.{{name}}Dark,
      {{/theme}}
      {{#noTheme}}
      {{name}}: AppTextTheme.{{name}},
      {{/noTheme}}

      {{/textExtensions}}
      {{#fontSizes}}
      {{name}}: AppTextTheme.{{name}},
      {{/fontSizes}}
    );
  }


  factory AppTextExtension.light(){
    return const AppTextExtension(
      {{#textExtensions}}
      {{#theme}}
      {{name}}: AppTextTheme.{{name}}Light,
      {{/theme}}
      {{#noTheme}}
      {{name}}: AppTextTheme.{{name}},
      {{/noTheme}}
      
      {{/textExtensions}}
      {{#fontSizes}}
      {{name}}: AppTextTheme.{{name}},
      {{/fontSizes}}
    );
  }

}

