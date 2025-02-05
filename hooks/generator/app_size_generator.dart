import 'package:mason/mason.dart';

List<Map<String, dynamic>> appSizeGenerator(HookContext context) {
  final List<dynamic>? fontSizesList =
      context.vars['fontSizes'] as List<dynamic>?;
      final screenUtil = context.vars['screen_util'] as bool? ?? false;

  final List<Map<String, dynamic>> formattedFontSizes = [];

  if (fontSizesList != null && fontSizesList.isNotEmpty) {
    for (final fontSize in fontSizesList) {
      if (fontSize is Map<String, dynamic> &&
          fontSize.containsKey('name') &&
          fontSize.containsKey('size')) {
        final String name = fontSize['name'].toString();
        final int size = fontSize['size'] is int
            ? fontSize['size'] as int
            : int.tryParse(fontSize['size'].toString()) ?? 0;

        if (size > 0) {
          formattedFontSizes.add({'name': name, 'size': "${size}.0${screenUtil?'.sp':''}"});
        } else {
          context.logger
              .warn('Invalid font size for "$name": ${fontSize['size']}');
        }
      }
    }
  } else {
    context.logger.warn('No font sizes found in config.json.');
  }
  return formattedFontSizes;
}
