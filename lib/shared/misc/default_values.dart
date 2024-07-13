import 'package:delivery_app/features/category/domain/entities/category_model.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';

class DefaultValues {
  DefaultValues._();
  static const String all = "All";
  static const String food = "Food";
  static const String drink = "Drink";
  static const String property = "Property";
  static const String service = "Service";
  static List<CategoryModel> listcategoryModel = [
    const CategoryModel(title: all, imageUrl: FilePaths.alljpg),
    const CategoryModel(title: food, imageUrl: FilePaths.foodjpg),
    const CategoryModel(title: drink, imageUrl: FilePaths.drinkjpg),
    const CategoryModel(title: property, imageUrl: FilePaths.property),
    const CategoryModel(title: service, imageUrl: FilePaths.servicejpg)
  ];
}
