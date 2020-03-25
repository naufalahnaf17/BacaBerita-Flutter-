import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

import 'package:http/http.dart';

class Headlines extends StatefulWidget {
  @override
  _HeadlinesState createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> with AutomaticKeepAliveClientMixin {

  bool isLoading = true;
  List articles;

  void getData() async {
    var url = "http://newsapi.org/v2/top-headlines?country=id&apiKey=cb840bd87bfc48b8985aec9daf0b6a13";
    Response response = await get(url);

    if(response.statusCode == 200){
      setState(() {
        articles = jsonDecode(response.body)['articles'];
        isLoading = false;
      });
      print(articles[0]['title']);
    }else{
      print('Terjadi Kesalahan');
    }

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading == true){
     return Container(
       child: loadingScreen,
     );
    }else{
      return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: articles == null ? 0 : articles.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/content' , arguments: {
                        'url' : articles[index]['url'],
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
                          child: Image.network(
                            articles[index]['urlToImage'],
                            fit: BoxFit.cover,
                            height: 250,
                            width: MediaQuery.of(context).size.width * 1,
                          ),
                        ),
                        Positioned(
                          top: 200,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                padding : EdgeInsets.all(8),
                                child: Text(
                                  articles[index]['title'],
                                  style: TextStyle(
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Widget loadingScreen =
  Center(
    child: SpinKitRotatingCircle(
      color: Colors.black,
      size: 50.0,
    ),
  );

  @override
  bool get wantKeepAlive => true;

}



