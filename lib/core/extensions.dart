import 'package:enough_convert/latin/latin2.dart';

extension StringFormatExtension on String {
  String toLatin2() {
    final codec = Latin2Codec();
    return codec.decode(this.codeUnits);
  }
}
