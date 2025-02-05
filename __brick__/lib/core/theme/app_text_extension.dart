import 'package:flutter/widgets.dart';


class AppTextExtension extends ThemeExtension<AppTextExtension> {
  
  {{#textExtensions}}
  {{#isTheme}}
  final TextStyle {{name}}Light;
  final TextStyle {{name}}Dark;
  {{/isTheme}}
  {{#noTheme}}
  final TextStyle {{name}};
  {{/noTheme}}
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

}

