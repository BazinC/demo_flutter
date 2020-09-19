import 'package:flutter/material.dart';
import 'package:responsive_demo/custom_theme.dart';
import 'package:responsive_demo/main.dart';
import 'package:provider/provider.dart';

class ClickUpAppBarBackground extends StatelessWidget {
  const ClickUpAppBarBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    final colors = context.watch<LightThemeNotifier>().isLight
        ? <Color>[theme.gradientStart, theme.gradientEnd]
        : <Color>[theme.gradientEnd, theme.gradientStart];
    return AnimatedContainer(
      duration: theme.transitionDuration,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
    );
  }
}
