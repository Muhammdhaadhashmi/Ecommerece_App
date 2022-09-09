import 'package:ecommereceapp/screens/Detail_screen.dart';
import 'package:ecommereceapp/screens/listproduct.dart';
import 'package:ecommereceapp/screens/profile_screen.dart';
import 'package:ecommereceapp/widgets/single_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'check_out.dart';
import 'contactus.dart';

class HomePage extends StatefulWidget {
  HomePage({Key ?key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Widget _buildCategoryProducts({ required String image, required int color}){
    return  CircleAvatar(
      maxRadius: 40,
      backgroundColor:Color(color),
      child: Container(
        height: 24,
        child: Image(
          color: Colors.white,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }

  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;

  bool profileColor = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(" Muhammad Haad",style:TextStyle(color: Colors.black)
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/haad.png"),
                ),
                decoration: BoxDecoration(
                    color: Color(0xfff8f8f8),
                ),
                accountEmail: Text("muhammad.haad96@gmail.com",style:TextStyle(color: Colors.black)),
            ),
            ListTile(
              selected: homeColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  contactUsColor = false;
                  checkoutColor = false;
                  aboutColor = false;
                  profileColor = false;
                });
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              selected: checkoutColor,
              onTap: () {
                setState(() {
                  checkoutColor = true;
                  contactUsColor = false;
                  homeColor = false;
                  profileColor = false;
                  aboutColor = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => CheckOut()));
              },
              leading: Icon(Icons.shopping_cart),
              title: Text("Checkout"),
            ),
            ListTile(
              selected: aboutColor,
              onTap: () {
                setState(() {
                  aboutColor = true;
                  contactUsColor = false;
                  homeColor = false;
                  profileColor = false;
                  checkoutColor = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => About()));
              },
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
            ListTile(
              selected: profileColor,
              onTap: () {
                setState(() {
                  aboutColor = false;
                  contactUsColor = false;
                  homeColor = false;
                  profileColor = true;
                  checkoutColor = false;
                });
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ProfileScreen(),
                  ),
                );
              },
              leading: Icon(Icons.info),
              title: Text("Profile"),
            ),
            ListTile(
              selected: contactUsColor,
              onTap: () {
                setState(() {
                  contactUsColor = true;
                  checkoutColor = false;
                  profileColor = false;
                  homeColor = false;
                  aboutColor = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => ContactUS()));
              },
              leading: Icon(Icons.phone),
              title: Text("Contact Us"),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            onPressed: () {
              _key.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            )),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            Container(
                              height: 50,
                              // child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: <Widget>[
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                // CarouselSlider(
                                //   items: <Widget>[
                                //   for(var i=0; i<dashDataRandomCategories.length; i++)
                                //     Container(
                                //         margin:
                                //         const EdgeInsets.only(top: 0.0, left: 20.0),
                                //         decoration: BoxDecoration(
                                //           image: DecorationImage(
                                //             fit: BoxFit.fill,
                                //             image: AssetImage(
                                //               dashDataRandomCategories[i],
                                //               "images/manpent.jfif",
                                //               image:
                                //             ),
                                //           ),
                                //         ),
                                //     ),
                                //         ],
                                //   options: CarouselOptions(
                                //       height: 100,
                                //     autoPlay: true,
                                //    autoPlayInterval: Duration(seconds: 4),
                                //     autoPlayAnimationDuration: Duration(milliseconds: 800),
                                //     autoPlayCurve: Curves.fastOutSlowIn,
                                //     enlargeCenterPage: true,
                                //     scrollDirection: Axis.horizontal,
                                // ),
                                //     ),
                                  // Container(
                                  //   height: 240,
                                  //   child: Carousel(
                                  //     autoplay: true,
                                  //     showIndicator: false,
                                  //     images: [
                                  //       AssetImage("images/manpent.jfif"),
                                  //       AssetImage("images/watch.jpg"),
                                  //       AssetImage("images/camera.jpg"),
                                  //     ],
                                  //   ),
                                  // ),
                                  Text(
                                    "Categories",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Text(
                                  //   "View more",
                                  //   style: TextStyle(
                                  //       fontSize: 17,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              child: Row(
                                children: <Widget>[
                                  _buildCategoryProducts(image: "dress.png",  color: 0xff4ff2af),
                                  _buildCategoryProducts(image: "shirt.png", color: 0xfff38cdd),
                                  _buildCategoryProducts(image: "shoes.png", color: 0xff4ff2af),
                                  _buildCategoryProducts(image: "pent.png", color:  0xff74acf7),
                                  _buildCategoryProducts(image: "tie.png", color: 0xfffc6c8d),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Featured",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ListProducts(name:"Featured"),),);
                                  },
                                  child: Text(
                                    "View more",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>DetailScreen(
                                image:" man.jpg", price: 30.0, name:"Man Long T-Shirts"
                            )));
                          },
                            child: SingleProduct(image:" man.jpg", price: 30.0, name:"Man Long T-Shirts")),
                        GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>DetailScreen(
                                  image:"watch.jpg", price: 33.0, name:"Women White Watch"
                              )));
                            },
                            child: SingleProduct(image:"watch.jpg", price: 33.0, name:"Women White Watch")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 70,
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "New Archives" ,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ListProducts(name: "New Archives",)));
                  },
                  child: Text(
                    "View more",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>DetailScreen(
                              image:"manwatch.jpg", price: 33.0, name:"A Men Wrist Watch"
                          )));
                        },
                          child: SingleProduct(image:"manwatch.jpg", price: 33.0, name:"A Men Wrist Watch")),
                      GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>DetailScreen(
                                  image:"pent.jpg", price: 33.0, name:"A Men Pent"
                              )));
                            },
                          child: SingleProduct(image:"pent.jpg", price: 33.0, name:"A Men Pent")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}
//featured product.