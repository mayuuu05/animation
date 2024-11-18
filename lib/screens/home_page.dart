import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color? selectedColor;
  String selectedColorName = '';

  List colorData = [
    {'color': Colors.red, 'name': 'Red'},
    {'color': Colors.orange, 'name': 'Orange'},
    {'color': Colors.yellow, 'name': 'Yellow'},
    {'color': Colors.green, 'name': 'Green'},
    {'color': Colors.blue[900], 'name': 'Dark Blue'},
    {'color': Colors.indigo, 'name': 'Indigo'},
    {'color': Colors.purple, 'name': 'Purple'},
    {'color': Colors.amber, 'name': 'Amber'},
    {'color': Colors.brown, 'name': 'Brown'},
    {'color': Colors.blueAccent, 'name': 'Blue'},
    {'color': Colors.pinkAccent, 'name': 'Pink'},
    {'color': Colors.blueGrey, 'name': 'Blue Grey'},
    {'color': Colors.teal, 'name': 'Teal'},
    {'color': Colors.cyan, 'name': 'Cyan'},
    {'color': Colors.black, 'name': 'Black'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Drag & Drop',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: colorData.length,
                itemBuilder: (context, index) {
                  return Draggable<Color>(
                    data: colorData[index]['color'],
                    feedback: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: colorData[index]['color'],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorData[index]['color'],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 100),
          DragTarget<Color>(
            onAcceptWithDetails: (color) {
              setState(() {
                selectedColor = color as Color?;
                selectedColorName = colorData.firstWhere(
                        (element) => element['color'] == color,
                    orElse: () => {'color': Colors.transparent, 'name': ''})['name']!;
              });
            },
            builder: (context, candidateData, rejectedData) {
              return DottedBorder(
                color: Colors.black,
                strokeWidth: 2,
                dashPattern: [6, 3],
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: Container(
                  height: 150,
                  width: 150,
                  color: selectedColor ?? Colors.white,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              selectedColorName,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: selectedColor ?? Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
