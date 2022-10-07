import 'package:flutter/material.dart';
import 'package:flutter_animation_examples/screens/custom_animation_controller.dart';
import 'package:flutter_animation_examples/screens/move_animation.dart';
import 'package:flutter_animation_examples/screens/opacity_animation.dart';
import 'package:flutter_animation_examples/screens/rotate_animation.dart';
import 'package:flutter_animation_examples/screens/scale_animation.dart';
import 'package:flutter_animation_examples/screens/tween_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation Expamples',
      home: TweenAnimations(),
    );
  }
}
