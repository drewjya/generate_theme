import 'package:mason/mason.dart';

List<Map<String, String>> colorGenerator(HookContext context) {
  final List<dynamic>? colorsList = context.vars['colors'] as List<dynamic>?;
  final List<Map<String, String>> formattedColors = [];

  if (colorsList != null && colorsList.isNotEmpty) {
    for (final color in colorsList) {
      if (color is Map<String, dynamic> && color.containsKey('name') && color.containsKey('hex')) {
        final String name = color['name'].toString();
        String hexColor = color['hex'].toString().toUpperCase();

        if (!hexColor.startsWith('#')) {
          context.logger.warn('Color "$name" does not start with "#". Skipping...');
          continue;
        }

        final cleanHex = hexColor.replaceFirst('#', '');
        if (cleanHex.length == 6) {
          formattedColors.add({'name': name, 'value': '0xFF$cleanHex'});
        } else {
          context.logger.warn('Invalid hex format for "$name": $hexColor');
        }
      }
    }
  } else {
    context.logger.warn('No colors found in config.json.');
  }
  return formattedColors;
}
