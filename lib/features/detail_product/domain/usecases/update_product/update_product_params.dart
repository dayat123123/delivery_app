class UpdateProductParams {
  final String idProduct;
  final String nameProduct;
  final int hargaProduct;
  final String? imageUrl;
  UpdateProductParams(
      {required this.hargaProduct,
      required this.idProduct,
      required this.imageUrl,
      required this.nameProduct});
}
