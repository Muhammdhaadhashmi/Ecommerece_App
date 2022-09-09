import 'package:ecommereceapp/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../widgets/single_product.dart';

class ListProducts extends StatelessWidget {
  final String name;
  const ListProducts({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Products",
          style: TextStyle(color: Colors.black),
        ),
       elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> HomePage()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
        ),
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
        margin: EdgeInsets.symmetric(horizontal: 20),
        child:ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: 70,
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: <Widget>[
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
            SizedBox(height: 10,),
            Container(
              height: 700,
              child: GridView.count(
               mainAxisSpacing: 10,
                childAspectRatio: 0.7,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                children: <Widget>[
                SingleProduct(name: "Man Long T-Shirts", price: 30.0, image: "man.jpg"),
                  SingleProduct(name: "Women White Watch", price: 33.0, image: "watch.jpg"),
                  SingleProduct(name: "Mobile Cover", price: 40.0, image: "mobilecover.jfif"),
                  SingleProduct(name: "Google Mp3", price: 25.0, image: "mp3.jpg"),
                  SingleProduct(name: "Camera", price: 20.0, image: "Camera.jpg"),
                  SingleProduct(name: "Mouse", price: 10.0, image: "mouse.jpg"),
              ],),
            ),
            //     Row(
            //       children: <Widget>[
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             Row(
            //               children: <Widget>[
            //                 _buildFeaturedProduct(
            //                     name: "Man Long T-Shirts",
            //                     price: 30.0,
            //                     image: "images/Man T-shirts.jpeg"),
            //                 _buildFeaturedProduct(
            //                     name: "Women White Watch",
            //                     price: 33.0,
            //                     image: "images/womenwatch.jpg")
            //               ],
            //             ),
            //
            //   ],
            // ),
            //       ],
            //     ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
