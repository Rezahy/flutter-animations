import 'package:flutter/material.dart';

class MoveAnimation extends StatefulWidget {
  const MoveAnimation({Key? key}) : super(key: key);

  @override
  _MoveAnimationState createState() => _MoveAnimationState();
}

class _MoveAnimationState extends State<MoveAnimation> {
  double top = 0;
  double left = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: top,
              left: left,
              curve: Curves.easeInOut,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 3),
                          blurRadius: 20)
                    ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            top += 50;
            if (left < 200) {
              left += 50;
            } else {
              left -= 50;
            }
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
