import 'dart:io';

class UploadImageProductParams {
  final String idProduct;
  final String filePath;
  final File file;
  UploadImageProductParams(
      {required this.file, required this.filePath, required this.idProduct});
}
