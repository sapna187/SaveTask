import 'package:data_app/api_movie/utils/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: modified_text(text: '⭐ Average Rating - ' + vote, size: 18, color: Colors.amber,)),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded', size: 24, color: Colors.amber,)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
                  modified_text(text: 'Releasing On - ' + launch_on, size: 14, color: Colors.amber,)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, size: 18, color: Colors.amber,)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
