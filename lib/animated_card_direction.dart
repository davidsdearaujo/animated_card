import 'package:flutter/material.dart';

enum AnimatedCardDirection { left, right, top, bottom }
late Map<AnimatedCardDirection, Offset> initialOffset;
configureInitialOffset(BuildContext context) {
  initialOffset = {
    AnimatedCardDirection.right: Offset(MediaQuery.of(context).size.width, 0),
    AnimatedCardDirection.left: Offset(-MediaQuery.of(context).size.width, 0),
    AnimatedCardDirection.top: Offset(0, -MediaQuery.of(context).size.height),
    AnimatedCardDirection.bottom: Offset(0, MediaQuery.of(context).size.height),
  };
}
