import 'package:flutter/widgets.dart';

import 'app_text_theme.dart';

class AppTextExtension extends ThemeExtension<AppTextExtension> {
  
  {{#textExtensions}}
  final TextStyle {{name}};
  {{/textExtensions}}
  

  const AppTextExtension({
    {{#textExtensions}}
    required this.{{name}},
    {{/textExtensions}}
  });

  @override
  ThemeExtension<AppTextExtension> copyWith({
    {{#textExtensions}}
    TextStyle? {{name}},
    {{/textExtensions}}
  }) {
    return AppTextExtension(
      {{#textExtensions}}
      {{name}}: {{name}} ?? this.{{name}},
      {{/textExtensions}}
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
    );
  }

  factory AppTextExtension.dark(){
    return AppTextExtension(
      {{#textExtensions}}
      {{#isTheme}}
      {{name}}: AppTextTheme.{{isThemeNameDark}},
      {{/isTheme}}
      {{#notTheme}}
      {{name}}: AppTextTheme.{{name}},
      {{/notTheme}}
      {{/textExtensions}}
    );
  }


  factory AppTextExtension.light(){
    return AppTextExtension(
      {{#textExtensions}}
      {{#isTheme}}
      {{name}}: AppTextTheme.{{isThemeNameLight}},
      {{/isTheme}}
      {{#notTheme}}
      {{name}}: AppTextTheme.{{name}},
      {{/notTheme}}
      {{/textExtensions}}
    );
  }

}

