import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:task_1/models/article_model.dart';

class ArticlePage extends StatelessWidget {
  final ArticleModel article;
  final bool darkMode;

  @override
  const ArticlePage({super.key, required this.article, required this.darkMode});

  // static const List<Color> _page_colors = [Colors.black, Colors.white];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkMode ? Colors.black : Colors.white,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white54,
            gradient: const LinearGradient(
              colors: [Colors.pink, Colors.lightBlue],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Author: ${article.author}",
                      style: const TextStyle(
                          fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      article.description,
                      style: const TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(article.url));
                        if (kDebugMode) {
                          print(article.url);
                        }
                      },
                      child: const Text(
                        "Read more",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
