import 'package:flutter/material.dart';
class AppColors {
  {{#colors}}
  static const Color {{name}} = Color({{value}});
  {{/colors}}
}
