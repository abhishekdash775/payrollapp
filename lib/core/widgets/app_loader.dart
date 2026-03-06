import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader extends StatelessWidget {
  final bool isDarkBackground;
  const AppLoader({super.key, required this.isDarkBackground});

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      itemBuilder: (context, index) {
        final colors = isDarkBackground
            ? [
                Color(0xFFE0E0E0),
                Color(0xFFBDBDBD),
                Color(0xFF9E9E9E),
                Colors.white,
              ]
            : [
                Color(0xFF1A1C1E),
                Color(0xFF333333),
                Color(0xFF666666),
                Color(0xFF999999),
              ];
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors[index % colors.length],
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
      size: 30.0,
    );
  }
}
