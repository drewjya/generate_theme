
extension GenThemeTextStyleExtension on TextStyle {
  
  {{#colorsListExtension}}
  TextStyle get {{name}} => copyWith(
    color: AppColor.{{name}},
  );
  {{/colorsListExtension}}
}