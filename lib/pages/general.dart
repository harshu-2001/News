import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:news_app/Homepage/news_api.dart';

class General {
  List<Articles> news=[];
  var decoder;

  Future getnews ()async{
    String url="https://newsapi.org/v2/top-headlines?language=en&country=in&apiKey=f14de4271bbc4f769da2cf8f68b5822f";
    News gen;
    var res = await http.get(Uri.parse(url));
    decoder = jsonDecode(res.body);
    gen=News.fromJson(decoder);
     if(gen.status == "ok"){
      gen.articles.forEach((element){

        if(element.urlToImage != 'null' && element.description != 'null'){
          Articles article = Articles(
            source: element.source,
            url: element.url,
            title: element.title,
            author: element.author,
            description: element.description,
            urlToImage: element.urlToImage,
            publishedAt: element.publishedAt,
            content: element.content,
            articleUrl: element.url,
          );
          news.add(article);
        }
      }
      );
     }
    //print(decoder);
       

  
}
}
class General_custom{
  List<dynamic>news=[];
  late News gen;
  Future getnews(String car) async{

    String url='https://newsapi.org/v2/top-headlines?language=en&$car&apiKey=f14de4271bbc4f769da2cf8f68b5822f';
    var res = await http.get(Uri.parse(url));
    var decoder = jsonDecode(res.body);
  }
}

