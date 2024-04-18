import 'dart:ui';

extension ColorExtensions on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  ColorFilter colorFiltered({BlendMode blendMode = BlendMode.srcIn}) {
    return ColorFilter.mode(this, blendMode);
  }
}
