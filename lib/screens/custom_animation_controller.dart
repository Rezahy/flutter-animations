import 'package:flutter/material.dart';

class CustomAnimationController extends StatefulWidget {
  const CustomAnimationController({Key? key}) : super(key: key);

  @override
  _CustomAnimationControllerState createState() =>
      _CustomAnimationControllerState();
}

class _CustomAnimationControllerState extends State<CustomAnimationController>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 1));

  // @override
  // void initState() {
  //   super.initState();
  //   animationController.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Animation Controller'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            // Opacity(
            //   opacity: animationController.value,
            //   child: Container(
            //     width: 150,
            //     height: 150,
            //     decoration: BoxDecoration(
            //         color: Colors.blueGrey,
            //         borderRadius: BorderRadius.circular(20),
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.black.withOpacity(0.2),
            //               offset: Offset(0, 3),
            //               blurRadius: 20)
            //         ]),
            //   ),
            // ),
            //best way fot app Performance
            AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Opacity(
                      opacity: animationController.value,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 3),
                                blurRadius: 20)
                          ],
                        ),
                      ),
                    ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationController.isCompleted) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
