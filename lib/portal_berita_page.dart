import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portal_berita/detail_portal_berita.dart';
import 'package:http/http.dart' as http;
import 'package:portal_berita/model/berita_item.dart';


class PortalBeritaApp extends StatefulWidget {
  const PortalBeritaApp({Key key}) : super(key: key);

  @override
  _PortalBeritaAppState createState() => _PortalBeritaAppState();
}


class _PortalBeritaAppState extends State<PortalBeritaApp> {
  Future<List<Article>> getData() async{
    List<Article> list;
    String url = 'https://newsapi.org/v2/top-headlines?country=jp&apiKey=b71cd3aa60ac4a11a1f803a36a6ed30e';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var result = data["articles"] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      // return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
    return list;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
        body : FutureBuilder(
          future: getData(),
          builder: (context, snaphot) {
            return snaphot.data != null ? listViewWidget(snaphot.data)
                : Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
    );
  }

  ListView listViewWidget(List<Article> article) {

    return ListView.builder(
      itemCount: article.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPortalBeritaPage(article: article[index],);

              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                
              ),
              elevation: 5,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        (article[index].urlToImage == null)
                            ? 'https://www.apple.com/v/apple-news/g/images/shared/apple-news__6xg2yiktruqy_og.png'
                            : article[index].urlToImage
                        ,fit: BoxFit.cover,
                        width: 300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        (article[index].title == null)
                            ? 'null'
                            : article[index].title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 15),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            (article[index].author == null)
                                ? 'null'
                                : article[index].author,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, right: 15),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            (article[index].publishedAt == null)
                                ? 'null':
                            article[index].publishedAt,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[400]),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }





}
