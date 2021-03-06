import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/firstpage.dart';
import 'package:food_delivery/account.dart';
import './loginpage/sigin_page.dart';
import './bloc/cartListBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import './model/fooditem.dart';
import './bloc/listTileColorBloc.dart';
import './cart.dart';
import './loginpage/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  debugDefaultTargetPlatformOverride =TargetPlatform.fuchsia;
   runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
          title: "Fast Food",
          home: FirstPage(),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/landingpage': (BuildContext context) => new MyApp(),
            '/signup': (BuildContext context) => new SignUpPage(),
            '/homepage': (BuildContext context) => new Home(),
            '/signin': (BuildContext context) => new SignInPage(),
            '/firstpage': (BuildContext context) => new FirstPage(),
            '/account': (BuildContext context) => new DrawerExample(),
          }),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  getCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top:50,bottom: 40),
              color: Colors.lightGreen,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(left: 10,right: 18),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Text(
                      '9489303930',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 70),
                      child: GestureDetector(
                        child: Icon(
                          CupertinoIcons.chevron_forward,
                          color: Colors.white,
                          size: 25,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/account');
                        }
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text(
                'Order History',
                style: TextStyle(fontSize: 18,color: Colors.black54),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Help & Support',
                style: TextStyle(fontSize: 18,color: Colors.black54),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.autorenew),
              title: Text(
                'Update',
                style: TextStyle(fontSize: 18,color: Colors.black54),
              ),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 18,color: Colors.black54),
              ),
              onTap: () => _popupDialog(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
              FirstHalf(),
              SizedBox(height: 45),
              for (var foodItem in fooditemList.foodItems)
              Builder(
                builder: (context) {
                  return ItemContainer(foodItem: foodItem);
                },
              )
          ],
        ),
      )),
    );
  }
}
void _popupDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(20),
          content: Text('Are you sure you want to logout ?'),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('No')),
            FlatButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed('/firstpage'),
                child: Text('Yes,Logout')),
          ],
        );
      });
}
class ItemContainer extends StatelessWidget {
  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);
        final snackBar = SnackBar(
          content: Text('???${foodItem.title} added to Cart'),
          duration: Duration(milliseconds: 550),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
        leftAligned: (foodItem.id % 2) == 0 ? true : false,
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 30),
          title(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items({
    @required this.leftAligned,
    @required this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
    @required this.hotel,
  });

  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 0;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 10),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(containerBorderRadius),
                    right: Radius.circular(containerBorderRadius)
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )),
                            ),
                            Text("\???$itemPrice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                                children: [
                                  TextSpan(text: "by "),
                                  TextSpan(
                                      text: hotel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700))
                                ]),
                          ),
                        ),
                        SizedBox(height: containerPadding),
                      ])),
            ],
          ),
        )
      ],
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.availability,
    @required this.selected,
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: selected ? Colors.accents : Colors.white,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey[200],
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(15, 0),
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: selected ? Colors.transparent : Colors.grey[200],
                    width: 1.5)),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
          Container(
              padding: EdgeInsets.all(45),
              width: 350,
              height: 175,
              decoration: new BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
              image: new AssetImage(
              'assets/fastfood.png',
              ),
              fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
              ),
          ),
      ],
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<FoodItem> foodItems = snapshot.data;
              int length = foodItems != null ? foodItems.length : 0;
              return buildGestureDetector(length, context, foodItems);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else {
          return;
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: Text(length.toString()),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.amberAccent, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
