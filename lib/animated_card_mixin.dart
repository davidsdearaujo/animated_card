import 'dart:async';

import 'package:flutter/material.dart';
import 'animated_card_direction.dart';

mixin AnimatedCardMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  late AnimationController controller;
  late Animation<Offset> initAnimation;

  late AnimationController optionsController;
  late Animation<double> optionsRemoveButtonAnimation;
  late Animation<double> optionsCardAnimation;

  late AnimationController removeController;

  late Animation<double> removeAnimation;
  late Animation<double> removeHeightAnimation;

  late Curve curve;

  bool removed = false;
  Timer? initTimer;
  var futures = <StreamSubscription>[];

  Duration get initDelay;
  Duration get duration;
  AnimatedCardDirection get direction;
  Offset? get initOffset;

  @override
  void initState() {
    super.initState();

    //controllers
    controller = AnimationController(vsync: this, duration: duration, value: removed ? 1 : 0);
    optionsController = AnimationController(vsync: this, duration: Duration(milliseconds: 400), value: removed ? 1 : 0);
    removeController = AnimationController(vsync: this, duration: Duration(seconds: 1), value: removed ? 1 : 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    configureInitialOffset(context);

    //curves
    CurvedAnimation removeCurve(Interval interval) => CurvedAnimation(curve: Curves.ease, parent: CurvedAnimation(curve: interval, parent: removeController));
    CurvedAnimation initialCurve() => CurvedAnimation(curve: curve, parent: controller);

    //animations
    initAnimation = Tween<Offset>(begin: initOffset ?? initialOffset[direction], end: Offset(0, 0)).animate(initialCurve());
    optionsRemoveButtonAnimation = Tween<double>(begin: MediaQuery.of(context).size.width / 2, end: 0).animate(optionsController);
    optionsCardAnimation = Tween<double>(begin: 0, end: MediaQuery.of(context).size.width / 3).animate(optionsController);
    removeAnimation = Tween<double>(begin: 0, end: 1).animate(removeCurve(Interval(0, 0.5)));
    removeHeightAnimation = Tween<double>(begin: 1, end: 0).animate(removeCurve(Interval(0.5, 1)));
    initTimer = Timer(initDelay, () => controller.forward());
  }

  @override
  void dispose() {
    initTimer?.cancel();
    futures.forEach((f) => f.cancel());
    controller.dispose();
    removeController.dispose();
    super.dispose();
  }
}
