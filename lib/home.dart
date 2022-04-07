import 'package:flutter/material.dart';
// import 'package:submissiondicodingflutter/main.dart';
import 'package:submissiondicodingflutter/model/data.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tumbuhan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                    child: Container(
                      margin: EdgeInsets.all(9.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 300,
                                child: Image.network(item,
                                    fit: BoxFit.cover, width: 600.0),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ))
                      .toList(),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(10),
                child: Text(
                  "List Tumbuhan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 260),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final ListTumbuhan tumbuhan = tumbuhanList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DetailTumbuhan(
                            tumbuhandesk: tumbuhan,
                          );
                        }));
                  },
                  child: Card(
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              tumbuhan.imageUrls,
                              width: 350,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    tumbuhan.name,
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'Oxygen'),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: tumbuhanList.length,
            ),
          )
        ],
      ),

    );
  }
}
