import 'package:mason/mason.dart';

import 'generator/button_generator.dart';
import 'generator/color_extension_generator.dart';
import 'generator/font_weight_generator.dart';
import 'generator/generator.dart';

void run(HookContext context) {
  // Process Colors

  final formattedColors = colorGenerator(context);

  // Process Font Sizes

  final List<Map<String, dynamic>> formattedFontSizes =
      appSizeGenerator(context);

  final screenUtil = context.vars['screen_util'] as bool? ?? false;

  final List<String> fontWeights =
      List.generate(9, (index) => "${100 + index * 100}");
  final weightData = fontWeightGenerator(context);

  final fontFamily = context.vars['fontFamily'] as String? ?? 'Inter';

  print(weightData);
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

  final List<Map<String, dynamic>> colorExtension =
      colorExtensionGenerator(context);

  final buttonStyles = buttonGenerator(context);

  context.vars = {
    'colors': formattedColors,
    'fontSizes': formattedFontSizes,
    'textStyles': textStyles,
    "textExtensions": textExtensions,
    "colorsExtension": colorExtension,
    "colorsListExtension": colorsListExtension,
    "fontWeights": fontWeights,
    "screen_util": screenUtil,
    "weightData": weightData,
    "button_styles": buttonStyles
  };
}
