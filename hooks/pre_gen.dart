import 'package:mason/mason.dart';

import 'generator/generator.dart';

void run(HookContext context) {
  // Process Colors

  final List<Map<String, String>> formattedColors = colorGenerator(context);

  // Process Font Sizes

  final List<Map<String, dynamic>> formattedFontSizes =
      appSizeGenerator(context);

  final fontFamily = context.vars['fontFamily'] as String? ?? 'Inter';

  final List<Map<String, String>> textStyles = [];

  List<String> textStylesData = [];

  for (var color in formattedColors) {
    for (var fontSize in formattedFontSizes) {
      final name = ('${color['name']}_' + "${fontSize['name']}").camelCase;

      textStylesData.add(
        "  static const $name = TextStyle(fontSize : AppSizes.${fontSize['name']}, color: AppColors.${color['name']}, fontFamily: \'$fontFamily\');",
      );
    }
  }
  context.vars = {
    'colors': formattedColors,
    'fontSizes': formattedFontSizes,
    'textStyles': textStylesData.join("\n")
  };
}
