import 'package:task_1/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName = 'Tesla';
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1561580125-028ee3bd62eb?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  categoryModel.dataUrl =
      "https://newsapi.org/v2/everything?q=tesla&from=2024-02-11&sortBy=publishedAt&apiKey=6f1178ebe543480d813e9a95b3c2aa63";
  category.add(categoryModel);
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'TechCrunch';
  categoryModel.imageUrl =
      "https://plus.unsplash.com/premium_photo-1677710419438-966e8dabea1f?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  categoryModel.dataUrl =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=6f1178ebe543480d813e9a95b3c2aa63";
  category.add(categoryModel);
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Wall Street Journal';
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1534470686156-ed1c44a2ec34?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  categoryModel.dataUrl =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=6f1178ebe543480d813e9a95b3c2aa63";
  category.add(categoryModel);
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Apple';
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1591815302525-756a9bcc3425?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  categoryModel.dataUrl =
      "https://newsapi.org/v2/everything?q=apple&from=2024-03-10&to=2024-03-10&sortBy=popularity&apiKey=6f1178ebe543480d813e9a95b3c2aa63";
  category.add(categoryModel);
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'US business';
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1541535881962-3bb380b08458?q=80&w=967&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  categoryModel.dataUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6f1178ebe543480d813e9a95b3c2aa63";
  category.add(categoryModel);
  return category;
}
