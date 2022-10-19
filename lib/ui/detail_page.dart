import 'package:flutter/material.dart';

import '../data/model/kdrama.dart';

class DetailPage extends StatelessWidget {
  final KoreanDrama kdrama;
  const DetailPage({Key? key,required this.kdrama}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea (
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(kdrama.banner),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          )
                          ,
                          const FavoriteButton(),
                        ],
                      )
                    )
                  )
                ]
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child:  Text(kdrama.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    )
                ),
              ),
              Container (
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8.0),
                        Text(kdrama.schedule),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(height: 8.0),
                        Text(kdrama.schedule),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.favorite),
                        SizedBox(height: 8.0),
                        Text(kdrama.numEpisode.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: const Text(
                    "A powerful sorceress in a blind woman's body encounters a man from a prestigious family, who wants her help to change his destiny.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0
                    )
                ),
              ),
              SizedBox (
                height:150,
                child:ListView(
                  scrollDirection: Axis.horizontal,
                  children: kdrama.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:Image.network(url),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}):super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}
class _FavoriteButtonState extends State<FavoriteButton>{
  bool isFave=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(
        isFave ? Icons.favorite:Icons.favorite_border,
        color: Colors.red
      ),
      onPressed: () {
        setState((){
          isFave = !isFave;
        });
      },
    );
  }

}