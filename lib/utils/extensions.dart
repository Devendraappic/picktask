import 'dart:io';

extension FileEx on File {
  String get name => path.split(Platform.pathSeparator).last;
}

extension StringExtension on String {
  String capitalizeText() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
