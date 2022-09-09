import 'package:ecommereceapp/screens/home_page.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  DetailScreen({Key? key, required this.image, required this.name, required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count=1;
  Widget _buildSizeProduct({required String name}){
    return  Container(
      height: 60,
      width: 60,
      color: Color(0xfff2f2f2),
      child: Center(
        child: Text(name,style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  Widget _buildColorProduct({required Color? color}){
    return  Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

  Widget _buildImage({required String image}){
   return Center(
      child: Container(
        width: 350,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                  image: DecorationImage(fit:BoxFit.fill,
                      image: AssetImage("images/${widget.image}"))
              ),
            ),
          ),
        ),
      ),
    );
  }

  final TextStyle myStyle=TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Page",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
            },
      ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
        ],
      ),
      body: Container(
          child: ListView(
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildImage(image:"manwatch.jpg"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 100,
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(widget.name,style: myStyle,
                                  ),
                                  Text("\$${widget.price.toString()}",style: TextStyle(color: Color(0xff9b96d6)),
                                  ),
                                  Text("Description :",style: myStyle
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 170,
                          child: Wrap(
                            children: <Widget>[
                               Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                                   "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                                   " It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                                   "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
                                   " and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",style: TextStyle(fontSize: 17),)
                            ],
                          ),
                        ),
                        Text("Size",style: myStyle
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: 265,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                               _buildSizeProduct(name: "S"),
                              _buildSizeProduct(name: "M"),
                              _buildSizeProduct(name: "L"),
                              _buildSizeProduct(name: "XXL"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Color",style: myStyle
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: 265,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              _buildColorProduct(color: Colors.blue[200]),
                              _buildColorProduct(color: Colors.green[200]),
                              _buildColorProduct(color:Colors.yellow[200] ),
                              _buildColorProduct(color: Colors.cyan[200]),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Quantity",style: myStyle,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color:Colors.blue[200] ,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                               GestureDetector(
                                 onTap: (){
                                  setState(() {
                                    if(count>1){
                                      count--;
                                    }

                                  });
                               }, child: Icon(Icons.remove),
                               ),
                              Text(count.toString(),style: TextStyle(fontSize: 18),),
                              GestureDetector(onTap: (){
                                setState(() {
                                  count++;
                                });
                              }, child: Icon(Icons.add),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink,
                              onPrimary: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text("Check Out",style: myStyle,),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
