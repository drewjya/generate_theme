import 'dart:developer';

import 'package:mason/mason.dart';

List<Map<String, String>> fontWeightGenerator(HookContext context) {
  final List<Map<String, String>> fontWeights = [];

  final fontWeightData = context.vars['fontWeight'] as List<dynamic>?;
  if (fontWeightData != null && fontWeightData.isNotEmpty) {
    for (final fontWeight in fontWeightData) {
      if (fontWeight is Map<String, dynamic> &&
          fontWeight.containsKey('name') &&
          fontWeight.containsKey('value')) {
        log("Font Weigt $fontWeight");
        final String name = fontWeight['name'].toString();
        final String weight = fontWeight['value'].toString();
        fontWeights.add({'name': name, 'weight': weight});
      }
    }
  } else {
    context.logger.warn('No font weights found in config.json.');
  }

  return fontWeights;
}
