import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_bloc.dart';
import 'cart_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);//get CarBloc class
    int count = 0;
    if(bloc.cart.length > 0){
      count = bloc.cart.values.reduce((a, b) => a + b);//combine 2 values of the list
    }
    return Scaffold(
      //top of the screen
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Shopping App'),    
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    debugPrint('tapped');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                  },
                ),
                Icon(Icons.brightness_1, size: 20.0, color: Colors.red),
                Positioned(         
                  child: Text(
                    '$count',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                    ),),
                   left: 6.0,
                   top: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
      //body
      body: GridView.count(//list of item
          crossAxisCount: 2, //2 column
          children: List.generate(6, (index) {//generate 6 items 
            return GestureDetector(//detect action
              onTap: () {//add to cart  when user click to index item    
                bloc.addToCart(index);
                
              },
              child: Container( //display image of item
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/image/${index + 1}.png'),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(width: 1, color: Colors.red),
                ),
              ),
            );
          })),
    );
  }
}
drawerButton() {
  return Drawer(
    //draw on the left of the app bar
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
          leading: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onTap: () {},
        ),
        //Wiget 7: A line separate between icon
        Divider(
          color: Colors.red,
        ),
        //Widget 8: Setting icon
        ListTile(
          title: Text('Setting'),
          leading: Icon(
            Icons.settings,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
        //Widget 9: About
        ListTile(
          title: Text('About'),
          leading: Icon(
            Icons.help,
            color: Colors.green,
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}
