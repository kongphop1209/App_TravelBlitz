import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeatWaveAnimation extends StatefulWidget {
  const HeatWaveAnimation(
      {Key? key,
      required Animation<double> animation,
      required Container Function(dynamic context, dynamic child) builder})
      : super(key: key);

  @override
  _HeatWaveAnimationState createState() => _HeatWaveAnimationState();
}

class _HeatWaveAnimationState extends State<HeatWaveAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 5.w,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
