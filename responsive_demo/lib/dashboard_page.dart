import 'package:flutter/material.dart';
import 'package:responsive_demo/custom_theme.dart';
import 'package:responsive_demo/dashboard_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: CustomTheme.of(context).background,
      child: Scrollbar(
          child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2,
          maxCrossAxisExtent: 500,
        ),
        padding: const EdgeInsets.all(8.0),
        children: [
          DashboardCard(
            child: Text('test 1'),
          ),
          DashboardCard(
            child: Text('test 2'),
          ),
        ],
      )),
    );
  }
}
