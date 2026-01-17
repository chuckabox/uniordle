import 'dart:ui';
import 'package:flutter/material.dart';

class MotionBlurRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  MotionBlurRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 450),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeOutQuart;

            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            final offsetAnimation = animation.drive(tween);

            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                // Blur intensity
                double blurValue = (1 - animation.value) * 15.0;

                return ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: blurValue,
                    sigmaY: 0,
                    tileMode: TileMode.decal,
                  ),
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
              child: child,
            );
          },
        );
}