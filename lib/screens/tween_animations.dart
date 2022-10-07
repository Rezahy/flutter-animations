import 'package:flutter/material.dart';

class TweenAnimations extends StatefulWidget {
  const TweenAnimations({Key? key}) : super(key: key);

  @override
  _TweenAnimationsState createState() => _TweenAnimationsState();
}

class _TweenAnimationsState extends State<TweenAnimations>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 500))
        ..forward();
  late final Animation<Color?> colorAnimation =
      ColorTween(begin: Colors.blue, end: Colors.deepOrange)
          .animate(animationController);
  late final Animation<double> opacityAnimation =
      Tween<double>(begin: 1.0, end: 0.5).animate(animationController);

  late final Animation<double> scaleAnimation =
      Tween<double>(begin: 1.0, end: 2.0).animate(CurvedAnimation(
          parent: animationController, curve: Curves.easeInOut));

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Opacity(
                      opacity: opacityAnimation.value,
                      child: Container(
                        width: 150 * scaleAnimation.value,
                        height: 150 * scaleAnimation.value,
                        decoration: BoxDecoration(
                          color: colorAnimation.value,
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
