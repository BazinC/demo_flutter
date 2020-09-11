import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/custom_theme.dart';
import 'package:responsive_demo/dashboard_card.dart';
import 'package:responsive_demo/data_providers/api_client.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child: Text('Test api')),
                Expanded(
                  child: FutureBuilder(
                    future: Provider.of<ApiClient>(context).getTask("82u462"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        debugPrint('Step 3, build widget: ${snapshot.data}');
                        // Build the widget with data.
                        return Center(child: Container(child: Text('${snapshot.data}')));
                      } else {
                        // We can show the loading view until the data comes back.
                        debugPrint('Step 1, build loading widget');
                        return FittedBox(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          DashboardCard(
            child: Text('Another card'),
          ),
          DashboardCard(
            child: Text('Another card'),
          ),
        ],
      )),
    );
  }
}
