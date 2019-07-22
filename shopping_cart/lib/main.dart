import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shopping_cart/components/horizontal_listview.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String PATH = 'assets/images/image';
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200.0,
      width: 100.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('$PATH/pic1.png'),
          AssetImage('$PATH/pic2.png'),
          AssetImage('$PATH/pic3.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.red,
        indicatorBgPadding: 4.0,
      ),
    );
    return Scaffold(
      //top of the screen
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.green,
        title: Text('Shopping App'),
        actions: <Widget>[
          //icon on the right of the app bar
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      //draw on the left of the app bar
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //Widget 1: User Information
            UserAccountsDrawerHeader(
              accountName: Text('Mai Hoàng Long'),
              accountEmail: Text('mailonggit@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            //Widget 2: Home Page icon
            ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home, color: Colors.blue),
              onTap: () {},
            ),
            //Widget 3: My account icon
            ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person, color: Colors.blue),
              onTap: () {},
            ),
            //Widget 4: My order icon
            ListTile(
              title: Text('My Order'),
              leading: Icon(Icons.shopping_basket, color: Colors.red),
              onTap: () {},
            ),
            //Widget 5: Categories icon
             ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.category),
              onTap: () {},
            ),
            //Widget 6: Favorite icon
             ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.favorite, color: Colors.red,),
              onTap: () {},
            ),
            //Wiget 7: A line separate between icon
            Divider(color: Colors.red,),
            //Widget 8: Setting icon
             ListTile(
              title: Text('Setting'),
              leading: Icon(Icons.settings, color: Colors.grey,),
              onTap: () {},
            ),
            //Widget 9: About
             ListTile(
              title: Text('About'),
              leading: Icon(Icons.help, color: Colors.green,),
              onTap: () {},
            ),
          ],
        ),
      ),
      //body
      body: ListView(
        children: <Widget>[
          //list of scroll image
          image_carousel,
          //category
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Categories', style: TextStyle(fontSize: 15.0)),                 
          ),
          //horizontal listview   
          HorizontalList(),
        ],
      ),
    );
  }
}
