import 'package:delivery_app/features/detail_toko/presentation/pages/tabs/about_store.dart';
import 'package:delivery_app/features/detail_toko/presentation/pages/tabs/all_product_store.dart';
import 'package:delivery_app/features/detail_toko/presentation/pages/tabs/categories_store.dart';
import 'package:delivery_app/shared/widgets/sliver_appbar.dart';

List<CustomTabModel> listTabDetailStore = [
  CustomTabModel(
      onTap: () {
        print("Ini Store");
      },
      title: "About Store",
      child: const AboutStore()),
  CustomTabModel(
      onTap: () {
        print("Ini Produk");
      },
      title: "Products",
      child: const AllProductStore()),
  CustomTabModel(
      onTap: () {
        print("Tab Kategori");
      },
      title: "Categories",
      child: const CategoriesStore())
];
