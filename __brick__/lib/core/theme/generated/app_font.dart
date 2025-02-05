class AppFont {
  {{#fontSizes}}
  static const double {{name}} = {{size}}.0;
  {{/fontSizes}}
}
