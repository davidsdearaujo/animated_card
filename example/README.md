# [Example](https://github.com/davidsdearaujo/animated_card/tree/master/example)

**pubspec.yaml**
```
name: example
description: A new Flutter project.
version: 1.0.0+1

environment:
  sdk: ">=2.1.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^0.1.2
  animated_card: <last version>

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true
```

**main.dart**
```
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
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
