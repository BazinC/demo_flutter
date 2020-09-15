import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/main.dart';
import 'package:responsive_demo/repositories/task_repository.dart';

import 'cubit/cubit/tasks_cubit.dart';
import 'database/database.dart';
import 'globals.dart';

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
        Provider<ApiClient>(
          create: (context) => ApiClient(),
        ),
        Provider<DatabaseProvider>(
          create: (context) => DatabaseProvider.db,
        ),
        ProxyProvider2<ApiClient, DatabaseProvider, TaskRepository>(
          create: (_) => TaskRepository(),
          update: (context, apiClient, databaseProvider, previous) => previous
            ..apiClient = apiClient
            ..databaseProvider = databaseProvider,
        ),
        BlocProvider(create: (context) => TasksCubit(Provider.of<TaskRepository>(context, listen: false))..getTasks(defaultListID)),
        ChangeNotifierProvider<LightThemeNotifier>(
          create: (context) => LightThemeNotifier(),
        ),
      ],
      child: child,
    );
  }
}
