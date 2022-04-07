import 'package:flutter/material.dart';
import 'package:submissiondicodingflutter/home.dart';
import 'package:submissiondicodingflutter/model/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Staycation',
      theme: ThemeData(),
      debugShowCheckedModeBanner: (false),
      home: Home(),
    );
  }
}

class DetailTumbuhan extends StatelessWidget {
  late final ListTumbuhan tumbuhandesk;

  DetailTumbuhan({required this.tumbuhandesk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(tumbuhandesk.imageUrls),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                          FavouriteButtom()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 25.0),
                  child: Text(
                    tumbuhandesk.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0,),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  tumbuhandesk.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: tumbuhandesk.gambarkesamping.map((urlgambar) {
                      return Padding(
                        padding: EdgeInsets.all(14),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(urlgambar),
                        ),
                      );
                    }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FavouriteButtom extends StatefulWidget {
  const FavouriteButtom({Key? key}) : super(key: key);

  @override
  _FavouriteButtomState createState() => _FavouriteButtomState();
}

class _FavouriteButtomState extends State<FavouriteButtom> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}




