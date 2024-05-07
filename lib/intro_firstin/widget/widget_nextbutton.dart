import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveling_app/intro_firstin/controller/intro_controller.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.08,
      right: MediaQuery.of(context).size.width * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
        ),
        onPressed: () => IntroController.instance.nextPage(),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
