import 'package:drag_and_drop/screens/hero/screen2.dart';
import 'package:flutter/material.dart';

class HeroWidget extends StatefulWidget {
  const HeroWidget({super.key});

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'photo',
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page2(),));
                  },
                  child: Container(
                    width: 200,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(image:NetworkImage('https://img.freepik.com/premium-vector/cute-coffee-mug-with-face-illustration-design-template-vector_988987-1323.jpg'),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60,),
              Hero(
                tag: 'grey',
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page2(),));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}