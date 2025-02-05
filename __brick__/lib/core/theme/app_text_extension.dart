import 'package:flutter/widgets.dart';


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

}

