import 'package:flutter/material.dart';

class RelativeTree extends StatelessWidget {
  const RelativeTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Opacity(
            opacity: 0.1,
            child: Image.asset(
              'asset/images/path28.png',
              fit: BoxFit.cover,
            )),
        Positioned(
            top: 60,
            child: SizedBox(
                height: 246,
                child: Image.asset(
                  'asset/images/group.png',
                  fit: BoxFit.contain,
                )))
      ],
    );
  }
}
