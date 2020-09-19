import 'package:animations/animations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/adaptive_scaffold.dart';
import 'package:responsive_demo/app_providers.dart';
import 'package:responsive_demo/cubit/cubit/status_cubit.dart';
import 'package:responsive_demo/custom_theme.dart';
import 'package:responsive_demo/dashboard_card.dart';
import 'package:responsive_demo/dashboard_page.dart';
import 'package:responsive_demo/pages/create_task_page.dart';
import 'package:responsive_demo/settings_page.dart';
import 'package:responsive_demo/tasks_page.dart';
import 'package:responsive_demo/widgets/clickup_appbar_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ResponsiveDemoApp());
}

const double _fabDimension = 56.0;

class ResponsiveDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DevicePreviewNotifier>(
      create: (context) => DevicePreviewNotifier(),
      child: AppProviders(
        child: Consumer<DevicePreviewNotifier>(builder: (context, devicePreviewNotifier, child) {
          return DevicePreview(
            enabled: devicePreviewNotifier.isEnabled,
            areSettingsEnabled: false,
            isToolBarVisible: false,
            builder: (context) => ChangeNotifierProvider.value(
              value: devicePreviewNotifier,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Responsive demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                builder: (context, child) {
                  return DevicePreview.appBuilder(
                    context,
                    CustomTheme(
                      data: _responsiveTheme(context),
                      child: OverridenMaterialTheme(
                        child: child,
                      ),
                    ),
                  );
                },
                home: MainPage(),
              ),
            ),
          );
        }),
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

class OverridenMaterialTheme extends StatelessWidget {
  const OverridenMaterialTheme({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //TODO : add comment here why we redefine Theme.
    final theme = Theme.of(context);
    final customTheme = CustomTheme.of(context);
    return AnimatedTheme(
      duration: customTheme.transitionDuration,
      child: child,
      data: theme.copyWith(
          inputDecorationTheme: theme.inputDecorationTheme.copyWith(
            labelStyle: TextStyle(color: customTheme.primary),
            hintStyle: TextStyle(color: customTheme.primary),
            helperStyle: TextStyle(color: customTheme.primary),
          ),
          scaffoldBackgroundColor: customTheme.background,
          navigationRailTheme: theme.navigationRailTheme.copyWith(backgroundColor: customTheme.secondaryBackground),
          textTheme: GoogleFonts.montserratTextTheme(theme.textTheme).apply(
            displayColor: customTheme.primary,
            bodyColor: customTheme.primary,
          ),
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
      title: Text('Hey Corentin'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ThemeSwitcher(),
        ),
      ],
      appBarFlexibaleSpace: ClickUpAppBarBackground(),
      currentIndex: _pageIndex,
      destinations: [
        AdaptiveScaffoldDestination(title: 'Dashboard', icon: Icons.dashboard),
        AdaptiveScaffoldDestination(title: 'Tasks', icon: Icons.check_box),
        AdaptiveScaffoldDestination(title: 'Settings', icon: Icons.settings),
      ],
      body: _pageAtIndex(_pageIndex),
      onNavigationIndexChange: (newIndex) {
        setState(() {
          _pageIndex = newIndex;
        });
      },
      floatingActionButton: _hasFloatingActionButton ? _buildFab(context) : null,
    );
  }

  bool get _hasFloatingActionButton {
    if (_pageIndex == 1) return true;
    return false;
  }

  Widget _buildFab(BuildContext context) {
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    return OpenContainer(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        context.bloc<StatusCubit>().getStatusList();
        return const CreateTaskPage();
      },
      closedElevation: 6.0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(_fabDimension / 2),
        ),
      ),
      closedColor: Theme.of(context).colorScheme.secondary,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return SizedBox(
          height: _fabDimension,
          width: _fabDimension,
          child: Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        );
      },
    );
  }

  static Widget _pageAtIndex(int index) {
    switch (index) {
      case 0:
        return DashboardPage();
      case 1:
        return TasksPage();
      default:
        return SettingsPage();
    }
  }
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLight = context.watch<LightThemeNotifier>().isLight;
    return IconButton(
      icon: isLight ? const Icon(Icons.wb_sunny) : const Icon(Icons.nights_stay),
      onPressed: () {
        final lightThemeNotifier = context.read<LightThemeNotifier>();
        lightThemeNotifier.isLight = !lightThemeNotifier.isLight;
      },
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

class DevicePreviewNotifier extends ChangeNotifier {
  bool get isEnabled => _isEnabled;
  bool _isEnabled = false;
  set isEnabled(bool value) {
    if (_isEnabled != value) {
      _isEnabled = value;
      notifyListeners();
    }
  }
}
