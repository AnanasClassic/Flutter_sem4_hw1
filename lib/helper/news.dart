import 'dart:convert';

import 'package:task_1/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews(String url) async {
    news = [];

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"]?.toString() ?? "",
            author: element["author"]?.toString() ?? "",
            description: element["description"]?.toString() ?? "",
            url: element["url"]?.toString() ?? "",
            urlToImage: element["urlToImage"]?.toString() ?? "",
            content: element["content"]?.toString() ?? "",
          );
          news.add(articleModel);
        }
      });
    }
  }
}
