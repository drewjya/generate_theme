import 'package:mason/mason.dart';

import 'generator/generator.dart';

void run(HookContext context) {
  // Process Colors

  final formattedColors = colorGenerator(context);

  // Process Font Sizes

  final List<Map<String, dynamic>> formattedFontSizes =
      appSizeGenerator(context);

  final fontFamily = context.vars['fontFamily'] as String? ?? 'Inter';

  final List<Map<String, String>> textStyles = [];

  for (var color in formattedColors) {
    for (var fontSize in formattedFontSizes) {
      textStyles.add({
        'name': ('${color['name']}_' + "${fontSize['name']}").camelCase,
        'size': "AppSizes.${fontSize['name']}",
        'color': "AppColors.${color['name']}",
        'fontFamily': fontFamily
      });
    }
  }

  final List<dynamic> colorsList =
      (context.vars['textExtension'] as List<dynamic>?) ?? [];
  final List<Map<String, dynamic>> textExtensions = [];
  for (var color in colorsList) {
    final isTheme = color["theme"] != null;
    for (var fontSize in formattedFontSizes) {
      
        textExtensions.add({
          'name': '${color["name"]}_${fontSize['name']}'.camelCase,
          'isTheme': isTheme,
          "noTheme":!isTheme,
        });
      
    }
  }
  context.vars = {
    'colors': formattedColors,
    'fontSizes': formattedFontSizes,
    'textStyles': textStyles,
    "textExtensions": textExtensions
  };
}
