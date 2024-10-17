import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(0xFF907257),
        ),
      backgroundColor: Color(0xFFE8DDCB),
      appBar: AppBar(
        backgroundColor: Color(0xFFE8DDCB),
        title: Text('Todo',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          // Example container repeated multiple times
          for (int i = 0; i < 10; i++) 
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFE8DDCB),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Grocery List",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Buy milk, eggs, bread, and butter from the supermarket."),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(0xFF907257),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "personal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(0xFF907257),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "shopping",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
