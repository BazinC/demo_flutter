import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/main.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ApiClient(),
        ),
        ChangeNotifierProvider<LightThemeNotifier>(
          create: (context) => LightThemeNotifier(),
        ),
      ],
      child: child,
    );
  }
}
