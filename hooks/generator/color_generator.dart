import 'package:mason/mason.dart';

List<Map<String, String>> colorGenerator(HookContext context) {
  final List<dynamic>? colorsList = context.vars['colors'] as List<dynamic>?;
  final fontFamily = context.vars['fontFamily'] as String? ?? 'Inter';
  final List<Map<String, String>> formattedColors = [];

  if (colorsList != null && colorsList.isNotEmpty) {
    for (final color in colorsList) {
      if (color is Map<String, dynamic> &&
          color.containsKey('name') &&
          (color.containsKey('hex') ||
              (color.containsKey('light') && color.containsKey('dark')))) {
        final String name = color['name'].toString();

        if (color.containsKey('hex')) {
          // Standard hex color
          String hexColor = color['hex'].toString().toUpperCase();
          if (hexColor.startsWith('#')) {
            final cleanHex = hexColor.replaceFirst('#', '');
            if (cleanHex.length == 6 || cleanHex.length == 8) {
              if (cleanHex.length == 8) {
                final end = cleanHex.substring(0, 6);
                final start = cleanHex.substring(7, 8);

                formattedColors.add({
                  'name': name,
                  'value': '0x$start$end',
                  "fontFamily": fontFamily
                });
              } else {
                formattedColors.add({
                  'name': name,
                  'value': '0xFF$cleanHex',
                  "fontFamily": fontFamily
                });
              }
            }
          }
        } else if (color.containsKey('light') && color.containsKey('dark')) {
          // Light/Dark Mode Colors
          String lightHex =
              color['light'].toString().toUpperCase().replaceFirst('#', '');
          String darkHex =
              color['dark'].toString().toUpperCase().replaceFirst('#', '');

          if ((lightHex.length == 6 || lightHex.length == 8) &&
              (darkHex.length == 6 || darkHex.length == 8)) {
            if (darkHex.length == 8) {
              final end = darkHex.substring(0, 6);
              final start = darkHex.substring(7, 8);

              formattedColors.add({
                'name': '${name}Dark',
                'value': '0x$start$end',
                "fontFamily": fontFamily
              });
            } else {
              formattedColors.add({
                'name': '${name}Dark',
                'value': '0xFF$darkHex',
                "fontFamily": fontFamily
              });
            }

            if (lightHex.length == 8) {
              final end = lightHex.substring(0, 6);
              final start = lightHex.substring(7, 8);

              formattedColors.add({
                'name': '${name}Light',
                'value': '0x$start$end',
                "fontFamily": fontFamily
              });
            } else {
              formattedColors.add({
                'name': '${name}Light',
                'value': '0xFF$lightHex',
                "fontFamily": fontFamily
              });
            }
          }
        }
      }
    }
  } else {
    context.logger.warn('No colors found in config.json.');
  }
  return formattedColors;
}
