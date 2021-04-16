# animated_card

Package to animate the initialization of any widget, with the possibility of using a custom dismissible.

![](https://github.com/davidsdearaujo/animated_card/raw/master/example.gif) ![](https://github.com/davidsdearaujo/animated_card/raw/master/example2.gif)

## How to use

**pubspec.yaml**

> To Flutter Version <= 1.22.6
> ```
>   animated_card: 1.0.0+8<lastest version>
> ```
> 
> To Flutter Version >= 2.0.0
> ```
>   animated_card: <lastest version>
> ```

**import**
```
import 'package:animated_card/animated_card.dart';
```

Simple implementation
```
AnimatedCard(
    child: <Widget>,
),
```

Dismissible implementation
```
AnimatedCard(
    direction: AnimatedCardDirection.left, //Initial animation direction 
    initDelay: Duration(milliseconds: 0), //Delay to initial animation
    duration: Duration(seconds: 1), //Initial animation duration
    onRemove: () => lista.removeAt(index), //Implement this action to active dismiss
),
```

## [Example](https://github.com/davidsdearaujo/animated_card/tree/master/example)


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
