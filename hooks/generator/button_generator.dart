import 'package:mason/mason.dart';

List<Map<String, dynamic>> buttonGenerator(HookContext context) {
  final List<dynamic>? buttonStyle =
      context.vars['buttonStyle'] as List<dynamic>?;

  if (buttonStyle == null || buttonStyle.isEmpty) {
    context.logger.warn('No button styles found in config.json.');
    return [];
  }

  final List<Map<String, dynamic>> buttonStyles = [];
  for (final button in buttonStyle) {
    if (button is Map<String, dynamic> && button.containsKey('name')) {
      final String name = button['name'].toString();
      final num padding = button['padding'] is num
          ? button['padding'] as num
          : num.tryParse(button['padding'].toString()) ?? 0;
      final num radius = button['radius'] is num
          ? button['radius'] as num
          : num.tryParse(button['radius'].toString()) ?? 0;
      final color = button['color'];
      final theme = button['theme'] == 'true';
      final noTheme = button['theme'] != 'true';

      final borderWidth = button['border_width'] is num
          ? button['border_width'] as num
          : num.tryParse(button['border_width'].toString()) ?? 0;
      final borderColor = button['border_color'];
      final borderTheme = button['border_theme'] == 'true';
      final borderNoTheme = button['border_theme'] != 'true';

      buttonStyles.add({
        'name': name,
        'padding': padding,
        'radius': radius,
        'color': color,
        'theme': theme,
        'noTheme': noTheme,
        'borderWidth': borderWidth,
        'borderColor': borderColor,
        'borderTheme': borderTheme,
        'borderNoTheme': borderNoTheme,
      });
    }
  }

  return buttonStyles;
}
