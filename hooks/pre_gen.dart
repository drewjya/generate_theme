import 'package:mason/mason.dart';

import 'generator/generator.dart';

void run(HookContext context) {
  // Process Colors

  final formattedColors = colorGenerator(context);

  // Process Font Sizes

  final List<Map<String, dynamic>> formattedFontSizes =
      appSizeGenerator(context);

  final List<String> fontWeights =
      List.generate(9, (index) => "${100 + index * 100}");

  final fontFamily = context.vars['fontFamily'] as String? ?? 'Inter';

  final List<Map<String, String>> textStyles = [];

  final List<Map<String, String>> colorsListExtension = [];
  for (var color in formattedColors) {
    colorsListExtension.add({"name": "${color['name']}"});
  }

  for (var fontSize in formattedFontSizes) {
    textStyles.add({
      'name': ("${fontSize['name']}").camelCase,
      'size': "AppFont.${fontSize['name']}",
      'fontFamily': fontFamily
    });
  }

  final List<dynamic> colorsList =
      (context.vars['textExtension'] as List<dynamic>?) ?? [];
  final List<Map<String, dynamic>> textExtensions = [];

  for (var color in colorsList) {
    final isTheme = color["theme"] != null;
    for (var fontSize in formattedFontSizes) {
      textExtensions.add({
        'name': '${color["name"]}_${fontSize['name']}'.camelCase,
        "isThemeNameLight":
            '${fontSize['name']}'.camelCase+'.'+ '${color["name"]}_light'
                .camelCase,
        "isThemeNameDark":
            '${fontSize['name']}'.camelCase+'.' +'${color["name"]}_dark'
                .camelCase,
        'isTheme': isTheme,
        "noTheme": !isTheme,
      });
    }
  }

  final List<dynamic> colorExtlist =
      (context.vars['colorExtension'] as List<dynamic>?) ?? [];
  final List<Map<String, dynamic>> colorExtension = [];
  for (var color in colorExtlist) {
    final isTheme = color["theme"] != null;

    colorExtension.add({
      'name': '${color["name"]}'.camelCase,
      'isTheme': isTheme,
      "noTheme": !isTheme,
      "isColorNameLight": '${color["name"]}_light'.camelCase,
      "isColorNameDark": '${color["name"]}_dark'.camelCase,
    });
  }

  context.vars = {
    'colors': formattedColors,
    'fontSizes': formattedFontSizes,
    'textStyles': textStyles,
    "textExtensions": textExtensions,
    "colorsExtension": colorExtension,
    "colorsListExtension": colorsListExtension,
    "fontWeights": fontWeights,
  };
}
