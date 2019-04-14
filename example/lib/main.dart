import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Card Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListagemScreen(),
    );
  }
}

class ListagemScreen extends StatelessWidget {
  var lista = List.generate(50, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Animation Example")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return AnimatedCard(
            direction: AnimatedCardDirection.left, //Initial animation direction
            initDelay: Duration(milliseconds: 0), //Delay to initial animation
            duration: Duration(seconds: 1), //Initial animation duration
            onRemove: () => lista.removeAt(index), //Implement this action to active dismiss
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: Container(
                    height: 150,
                    child: Center(child: Text("$index")),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
