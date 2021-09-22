import 'dart:convert';

import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news = [];

  Future <void> getNews() async{

    String url = "https://newsapi.org/v2/top-headlines?country=ng&apiKey=2d49a0b9560e4540b1306bb5b6f147ac";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null ){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['element']
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass{

  List<ArticleModel> news = [];

  Future <void> getNews(String category) async{

    String url = "https://newsapi.org/v2/top-headlines?category=$category&country=ng&apiKey=2d49a0b9560e4540b1306bb5b6f147ac";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null ){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['element']
          );

          news.add(articleModel);
        }
      });
    }
  }
}