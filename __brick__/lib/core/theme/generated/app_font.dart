class AppFont {
  {{#fontSizes}}
  static double {{name}} = {{size}}.0;
  {{/fontSizes}}
}
