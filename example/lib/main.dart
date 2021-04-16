import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';

final lista = List.generate(50, (index) => index);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Card Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListagemScreen(),
    );
  }
}

class ListagemScreen extends StatelessWidget {
  const ListagemScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Animation Example")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return AnimatedCard(
            direction: AnimatedCardDirection.left, //Initial animation direction
            initDelay: const Duration(milliseconds: 0), //Delay to initial animation
            duration: const Duration(seconds: 1), //Initial animation duration
            onRemove: () => lista.removeAt(index), //Implement this action to active dismiss
            curve: Curves.bounceOut, //Animation curve
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
