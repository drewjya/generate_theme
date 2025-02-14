import 'package:mason/mason.dart';

List<Map<String, dynamic>> colorExtensionGenerator(HookContext context) {
  final List<dynamic>? colorsList = context.vars['colors'] as List<dynamic>?;
  final List<Map<String, dynamic>> formattedColors = [];
  

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
              formattedColors.add({'name': name, 'theme':false, 'noTheme':true });
            }
          }
        } else if (color.containsKey('light') && color.containsKey('dark')) {
          // Light/Dark Mode Colors
          String lightHex =
              color['light'].toString().toUpperCase().replaceFirst('#', '');
          String darkHex =
              color['dark'].toString().toUpperCase().replaceFirst('#', '');
          if ((lightHex.length == 6 || lightHex.length == 8) && (darkHex.length == 6||darkHex.length == 8)) {
            formattedColors
                .add({'name': '${name}', 'noTheme':false, 'theme':true});
            
          }
        }
      }
    }
  } else {
    context.logger.warn('No colors found in config.json.');
  }
  return formattedColors;
}
