import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/adaptive_scaffold.dart';
import 'package:responsive_demo/custom_theme.dart';
import 'package:responsive_demo/dashboard_card.dart';
import 'package:responsive_demo/dashboard_page.dart';

void main() {
  runApp(ResponsiveDemoApp());
}

class ResponsiveDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LightThemeNotifier>(
          create: (context) => LightThemeNotifier(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Responsive demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child) => CustomTheme(
          data: _responsiveTheme(context),
          child: CustomTextTheme(
            child: child,
          ),
        ),
        home: MainPage(),
      ),
    );
  }

  CustomThemeData _responsiveTheme(BuildContext context) {
    // TODO : use mediaquery to response to screen size changes.
    // final mediaQuery = MediaQuery.of(context);
    final result = DashboardCardTheme.of(context);
    final isLight = context.watch<LightThemeNotifier>().isLight;

    return isLight ? CustomThemeData.light() : CustomThemeData.dark();
  }
}

class CustomTextTheme extends StatelessWidget {
  const CustomTextTheme({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //TODO : add comment here why we redefine Theme.
    final theme = Theme.of(context);
    final customTheme = CustomTheme.of(context);
    return Theme(
      child: child,
      data: theme.copyWith(
          navigationRailTheme: theme.navigationRailTheme.copyWith(backgroundColor: customTheme.secondaryBackground),
          textTheme: theme.textTheme.apply(displayColor: customTheme.primary, bodyColor: customTheme.primary),
          canvasColor: customTheme.secondaryBackground),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: Text('Demo App'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ThemeSwitcher(),
        ),
      ],
      currentIndex: _pageIndex,
      destinations: [
        AdaptiveScaffoldDestination(title: 'Home', icon: Icons.home),
        AdaptiveScaffoldDestination(title: 'Settings', icon: Icons.settings),
      ],
      body: _pageAtIndex(_pageIndex),
      onNavigationIndexChange: (newIndex) {
        setState(() {
          _pageIndex = newIndex;
        });
      },
    );
  }

  static Widget _pageAtIndex(int index) {
    if (index == 0) {
      return DashboardPage();
    }

    return Center(child: Text('Settings page'));
  }
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.red,
      value: context.watch<LightThemeNotifier>().isLight,
      onChanged: (value) => context.read<LightThemeNotifier>().isLight = value,
    );
  }
}

class LightThemeNotifier extends ChangeNotifier {
  bool get isLight => _isLight;
  bool _isLight = true;
  set isLight(bool value) {
    if (_isLight != value) {
      _isLight = value;
      notifyListeners();
    }
  }
}
