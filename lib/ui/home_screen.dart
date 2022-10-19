import 'package:flutter/material.dart';

import '../data/model/kdrama.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('KDrama List'),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          final KoreanDrama kdrama = koreanDramaList[index];
          return InkWell(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailPage(kdrama: kdrama);
              }));
            },
            child:Card(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex:1,
                    child:Image.asset(kdrama.banner),
                  ),
                  Expanded(
                    flex:2,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(kdrama.name,style: TextStyle(fontSize: 16.0),),
                          SizedBox(height: 10),
                          Text(kdrama.broadcaster),
                        ],
                      )
                    )
                  )
                ],
              )
            )
          );
        },
        itemCount: koreanDramaList.length,
      )
    );
  }
}
