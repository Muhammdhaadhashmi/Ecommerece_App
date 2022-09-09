import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;
   SingleProduct({required this.image, required this.price, required this.name});

  @override
  Widget build(BuildContext context) {
    // double width, height;
    // width = MediaQuery.of(context).size.width;
    // height = MediaQuery.of(context).size.height;
    return Card(
      child: Container(
        // height: height * 0.3,
        // width: width * 0.2 * 2 + 10,
        child: Column(
          children: <Widget>[
            // Expanded(
            //   flex: 3,
               Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 190,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/$image"
                        )),
                  ),
                ),
              ),
            Text(
              "\$ ${price.toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xff9b96d6)),
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
