import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final String PATH = 'assets/images/image';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,//scroll from left to right
        children: <Widget>[
          Category('$PATH/dress.png', 'Dress'),
          Category('$PATH/pants.png', 'Pants'),
          Category('$PATH/t-shirt.png', 'T-shirt'),
        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category(this.image_location, this.image_caption);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          height: 80.0,
          child: ListTile(
          title: Image.asset(
            image_location,
            width: 100.0,
            height: 80.0,),
          subtitle: Container(
            alignment: Alignment.topCenter,
            child: Text(image_caption),
          ),
        ),
        ), 
      ),
    );
  }
}