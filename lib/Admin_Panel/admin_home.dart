import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  Widget _buildSingleContainer({ required BuildContext context,  required IconData icon, required int count, required String name,}){
    return  Card(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Icon(icon,size: 30,color: Colors.grey,),
                SizedBox(width: 10,),
                Text(name,style: TextStyle(fontSize: 18,color:Colors.grey,fontWeight: FontWeight.bold),),
              ],
            ),
            // SizedBox(height: 0,),
            Text(count.toString(),style: TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
   AdminPanel({Key ?key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
             appBar: AppBar(
               bottom: TabBar(
                 indicatorColor:Theme.of(context).primaryColor ,
                   indicatorWeight:3,
                   tabs: [
                 Text("Dashboard",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),
                 ),
                 Text("Manage",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.grey),)
               ]
               ),
               backgroundColor: Colors.white,
               title: Text("Admin Home",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
               ),
               centerTitle: true,
               elevation: 0.0,
             ),
        body: Container(
          child: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: GridView.count(
                  mainAxisSpacing: 5,
                 crossAxisSpacing: 5,
                 crossAxisCount: 2,
                  children: [
                    _buildSingleContainer(
                        context:context,
                        icon:Icons.person,
                        count: 1,
                        name:"User"
                    ),
                    _buildSingleContainer(
                        context:context,
                        icon:Icons.category,
                        count: 18,
                        name:"Categories"
                    ),
                    _buildSingleContainer(
                        context:context,
                        icon:Icons.closed_caption,
                        count: 18,
                        name:"Feature Products"
                    ),
                    _buildSingleContainer(context:context,
                        icon:Icons.beach_access,
                        count: 40,
                        name:"Active Products"
                    ),
                    _buildSingleContainer(
                        context:context,
                        icon:Icons.shopping_cart,
                        count: 7,
                        name:"Order"
                    ),
                    _buildSingleContainer(
                        context:context,
                        icon:Icons.message,
                        count:1,
                        name:"Messages"
                    ),
                  ],
             ),
                ),
              Container(
                child: Center(
                  child: Text("Manage the Dashboard Details"),
                ),
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}