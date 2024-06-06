class AddProductParams {
  final String nameProduct;
  final String categoryProduct;
  final int hargaProduct;
  String? imageUrl;
  AddProductParams(
      {required this.nameProduct,
      required this.categoryProduct,
      required this.hargaProduct,
      this.imageUrl});
}
