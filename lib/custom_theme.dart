import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_theme.freezed.dart';

@freezed
abstract class CustomThemeData with _$CustomThemeData {
  const factory CustomThemeData({
    Color primary,
    Color background,
    Color secondaryBackground,
    Color secondaryShadow,
    Color gradientStart,
    Color gradientEnd,
    @required Duration transitionDuration,
  }) = _CustomThemeData;

  static const _defaultTransitionDuration = Duration(milliseconds: 200);

  factory CustomThemeData.fallback(BuildContext context) {
    return CustomThemeData(
      primary: Colors.black,
      background: Colors.white,
      secondaryBackground: Colors.grey[50],
      secondaryShadow: Theme.of(context).shadowColor,
      gradientStart: Theme.of(context).accentColor,
      gradientEnd: Theme.of(context).backgroundColor,
      transitionDuration: _defaultTransitionDuration,
    );
  }

  factory CustomThemeData.light() {
    return CustomThemeData(
      primary: Colors.black,
      background: Color(0xFFFBFDFF),
      secondaryBackground: Color(0xFFFFFFFF),
      secondaryShadow: Color(0xFFADADAD),
      gradientStart: Color(0xFF813BED),
      gradientEnd: Color(0xFF4FC7F1),
      transitionDuration: _defaultTransitionDuration,
    );
  }

  factory CustomThemeData.dark() {
    return CustomThemeData(
      primary: Color(0xFFD6D6D6),
      background: Color(0xFF1F1F1F),
      secondaryBackground: Color(0xFF383838),
      secondaryShadow: Color(0xFF333333),
      gradientStart: Color(0xFF56269E),
      gradientEnd: Color(0xFF3FA0C4),
      transitionDuration: _defaultTransitionDuration,
    );
  }
}

class CustomTheme extends InheritedWidget {
  final CustomThemeData data;
  const CustomTheme({
    Key key,
    @required Widget child,
    @required this.data,
  })  : assert(data != null),
        super(
          key: key,
          child: child,
        );

  static CustomThemeData of(BuildContext context) {
    var result = context.dependOnInheritedWidgetOfExactType<CustomTheme>();
    return result?.data ?? CustomThemeData.fallback(context);
  }

  @override
  bool updateShouldNotify(CustomTheme oldWidget) {
    return data != oldWidget.data;
  }
}
