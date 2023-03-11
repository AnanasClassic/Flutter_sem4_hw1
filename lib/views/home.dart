import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_1/helper/news.dart';
import 'package:task_1/models/article_model.dart';
import 'package:task_1/views/article_page.dart';

import '../helper/data.dart';
import '../models/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>.empty();
  List<ArticleModel> articles = List<ArticleModel>.empty();

  bool _loading = true;
  bool _darkMode = false;
  bool _mainPage = true;
  int _index = 0;
  String _dataUrl = "";

  List<Image> suns = [
    Image.asset("assets/images/light_sun.png", width: 48, height: 48),
    Image.asset("assets/images/dark_sun.png", width: 48, height: 48),
  ];

  List<Image> reloads = [
    Image.asset("assets/images/light_reload.png", width: 36, height: 36),
    Image.asset("assets/images/dark_reload.png", width: 36, height: 36),
  ];

  List<Image> backs = [
    Image.asset("assets/images/light_back.png", width: 36, height: 36),
    Image.asset("assets/images/dark_back.png", width: 36, height: 36),
  ];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews(_dataUrl);
  }

  getNews(String url) async {
    if (url == "") {
      setState(() {
        _loading = false;
      });
      return;
    }
    setState(() {
      _loading = true;
    });
    News news = News();
    await news.getNews(_dataUrl);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _darkMode ? Colors.black : Colors.white,
        appBar: AppBar(
            backgroundColor: _darkMode ? Colors.black : Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _darkMode = !_darkMode;
                    });
                    if (kDebugMode) {
                      print('dark mode: $_darkMode');
                    }
                  },
                  icon: _darkMode ? suns[0] : suns[1],
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("F has been pressed\n You paid respects!"),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(0, 0)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: -20, vertical: -20)),
                  ),
                  child: const Text(
                    "F",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _mainPage
                    ? IconButton(
                        onPressed: () {
                          getNews(_dataUrl);
                        },
                        icon: _darkMode ? reloads[0] : reloads[1])
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            _mainPage = true;
                          });
                          if (kDebugMode) {
                            print('main page: $_mainPage');
                          }
                        },
                        icon: _darkMode ? backs[0] : backs[1]),
              ],
            )),
        body: _mainPage
            ? SingleChildScrollView(
                child: Container(
                  color: _darkMode ? Colors.black : Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.transparent,
                          ),
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(22),
                          gradient: const LinearGradient(
                            colors: [Colors.pink, Colors.lightBlue],
                          ),
                        ),
                        height: 110,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    if (kDebugMode) {
                                      print('tapped:$index');
                                    }
                                    setState(() {
                                      _dataUrl = categories[index].dataUrl;
                                    });
                                    getNews(_dataUrl);
                                  },
                                  child: CategoryTile(
                                    imageUrl: categories[index].imageUrl,
                                    categoryName:
                                        categories[index].categoryName,
                                    dataUrl: categories[index].dataUrl,
                                  ));
                            },
                          ),
                        ),
                      ),
                      _loading
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: articles.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      if (kDebugMode) {
                                        print('tapped:$index');
                                      }
                                      setState(() {
                                        _index = index;
                                        _mainPage = false;
                                      });
                                    },
                                    child: BlogTile(
                                        imageUrl: articles[index].urlToImage,
                                        title: articles[index].title,
                                        desc: articles[index].description));
                              })
                    ],
                  ),
                ),
              )
            : ArticlePage(article: articles[_index], darkMode: _darkMode));
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String dataUrl;
  final String categoryName;

  const CategoryTile(
      {super.key,
      required this.imageUrl,
      required this.dataUrl,
      required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, left: 4),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl,
                width: 200.0, height: 90.0, fit: BoxFit.cover),
          ),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26,
            ),
            child: Text(categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;

  const BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(22),
        color: Colors.white54,
        gradient: const LinearGradient(
          colors: [Colors.pink, Colors.lightBlue],
        ),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
