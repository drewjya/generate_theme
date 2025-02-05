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
    colorsListExtension
        .add({"name": "${color['name']}", 'fontFamily': fontFamily});
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

    textExtensions.add({
      'name': '${color["name"]}'.camelCase,
      'theme': isTheme,
      'noTheme': !isTheme
    });
  }

  final List<dynamic> colorExtlist =
      (context.vars['colorExtension'] as List<dynamic>?) ?? [];
  final List<Map<String, dynamic>> colorExtension = [];
  for (var color in colorExtlist) {
    print(color);
    final isTheme = color["theme"] != null;
    colorExtension.add({
      'name': '${color["name"]}'.camelCase,
      'theme': isTheme,
      'noTheme': !isTheme
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
