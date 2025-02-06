import 'package:flutter/material.dart';

class AppColor {
  {{#colors}}
  static const Color {{name}} = Color({{value}});
  {{/colors}}
}
