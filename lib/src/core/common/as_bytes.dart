import 'dart:convert';
import 'dart:typed_data';

extension StringAsBytes on String {
  Uint8List get asBytes {
    return Uint8List.fromList(utf8.encode(this));
  }
}