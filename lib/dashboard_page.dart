import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_demo/custom_theme.dart';
import 'package:responsive_demo/dashboard_card.dart';

import 'model/models.dart';

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
          // DashboardCard(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Flexible(child: Text('Test GET task')),
          //       if (kIsWeb) Flexible(child: Text('(Not working on web platform. This API is not CORS enable)')),
          //       Expanded(
          //         child: FutureBuilder(
          //           future: Provider.of<ApiClient>(context).getTask("82u462"),
          //           builder: (context, snapshot) {
          //             if (snapshot.hasData) {
          //               debugPrint('Step 3, build widget: ${snapshot.data}');
          //               // Build the widget with data.
          //               return Center(child: Container(child: Text('${snapshot.data}')));
          //             } else {
          //               // We can show the loading view until the data comes back.
          //               debugPrint('Step 1, build loading widget');
          //               return FittedBox(child: CircularProgressIndicator());
          //             }
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // DashboardCard(
          //   child: FutureBuilder(
          //     future: Provider.of<ApiClient>(context).getTasks(defaultListID),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         debugPrint('Step 3, build widget: ${snapshot.data}');
          //         // Build the widget with data.
          //         return Center(child: Container(child: Text('${snapshot.data}')));
          //       } else {
          //         // We can show the loading view until the data comes back.
          //         debugPrint('Step 1, build loading widget');
          //         return FittedBox(child: CircularProgressIndicator());
          //       }
          //     },
          //   ),
          // ),
          DashboardCard(
            child: Text('A card'),
          ),
          DashboardCard(
            child: Text('Another card'),
          ),
        ],
      )),
    );
  }
}

class DummyTaskView extends StatelessWidget {
  const DummyTaskView({Key key, this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(task.name),
        ],
      ),
    );
  }
}
