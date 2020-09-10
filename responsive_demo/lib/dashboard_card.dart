import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/custom_theme.dart';

part 'dashboard_card.freezed.dart';

@freezed
abstract class DashboardCardThemeData with _$DashboardCardThemeData {
  const factory DashboardCardThemeData({
    Color backgroundColor,
    Color shadowColor,
  }) = _DashboardCardThemeData;

  factory DashboardCardThemeData.fallback(BuildContext context) {
    return DashboardCardThemeData(
      backgroundColor: CustomTheme.of(context).secondaryBackground,
      shadowColor: CustomTheme.of(context).secondaryShadow,
    );
  }
}

class DashboardCardTheme extends InheritedWidget {
  final DashboardCardThemeData data;
  const DashboardCardTheme({
    Key key,
    @required Widget child,
    @required this.data,
  })  : assert(data != null),
        super(
          key: key,
          child: child,
        );

  static DashboardCardThemeData of(BuildContext context) {
    var result = context.dependOnInheritedWidgetOfExactType<DashboardCardTheme>();
    return result?.data ?? DashboardCardThemeData.fallback(context);
  }

  @override
  bool updateShouldNotify(DashboardCardTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class DashboardCard extends StatelessWidget {
  final Widget child;
  const DashboardCard({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return AnimatedContainer(
      duration: CustomTheme.of(context).transitionDuration,
      decoration: BoxDecoration(color: theme.secondaryBackground, borderRadius: BorderRadius.circular(4.0), boxShadow: [
        BoxShadow(
          color: theme.secondaryShadow,
          blurRadius: 20.0,
        ),
      ]),
      child: Center(child: child),
    );
  }
}
