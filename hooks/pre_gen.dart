import 'package:mason/mason.dart';

import 'generator/generator.dart';

void run(HookContext context) {
  // Process Colors

  final data = colorGenerator(context);
  final formattedColors = data.formattedColors;
  final nameColor = data.nameColor;

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
  final List<Map<String, String>> textExtensions = [];
  for (var color in nameColor) {
    for (var fontSize in formattedFontSizes) {
      textExtensions.add({
        'name': '${color}_${fontSize['name']}'.camelCase,
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
