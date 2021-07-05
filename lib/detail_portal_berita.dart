import 'package:flutter/material.dart';
import 'package:portal_berita/model/berita_item.dart';

class DetailPortalBeritaPage extends StatefulWidget {
  final Article article;
  const DetailPortalBeritaPage({Key key, this.article}) : super(key: key);

  @override
  _DetailPortalBeritaPageState createState() => _DetailPortalBeritaPageState();
}

class _DetailPortalBeritaPageState extends State<DetailPortalBeritaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail News App"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.network( (widget.article.urlToImage == null)
                            ? 'https://www.apple.com/v/apple-news/g/images/shared/apple-news__6xg2yiktruqy_og.png'
                            : widget.article.urlToImage
                        ,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text((widget.article.title == null)
                                ? 'null'
                                : widget.article.title,),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text((widget.article.author == null)
                                  ? 'null'
                                  : widget.article.author,),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
