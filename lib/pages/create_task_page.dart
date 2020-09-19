import 'package:flutter/material.dart';
import 'package:responsive_demo/color_extention.dart';
import 'package:responsive_demo/cubit/cubit/status_cubit.dart' as status;
import 'package:responsive_demo/cubit/cubit/tasks_cubit.dart' as task;
import 'package:responsive_demo/custom_theme.dart';
import 'package:responsive_demo/model/status.dart';
import 'package:responsive_demo/widgets/clickup_appbar_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../globals.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage();

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  String _name;
  String _description;
  Status _status;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildStatus(List<Status> statusList) {
    return DropdownButtonFormField<Status>(
      decoration: InputDecoration(
        labelText: 'Status',
      ),
      items: (statusList..sort((statusA, statusB) => statusB.orderindex.compareTo(statusA.orderindex)))
          .map((status) => DropdownMenuItem<Status>(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor.fromHex(status.color),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(status.status),
                  ],
                ),
                value: status,
              ))
          .toList(),
      validator: (Status value) {
        if (value == null) {
          return 'Select a task';
        }

        return null;
      },
      onChanged: (Status value) {
        _status = value;
      },
      onSaved: (Status value) {
        _status = value;
      },
    );
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Task Name'),
      maxLength: 100,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter a Task Name';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description (optional)'),
      maxLength: 250,
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: ClickUpAppBarBackground(),
          title: const Text('Create Task'),
          actions: <Widget>[],
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocConsumer<status.StatusCubit, status.StatusState>(
                    listener: (context, state) {
                      if (state is status.Error) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    builder: (context, state) => state.maybeWhen(
                          loaded: (statusList) => _buildStatus(statusList),
                          loading: (statusList) => Stack(
                            children: [
                              _buildStatus(statusList),
                              CircularProgressIndicator(),
                            ],
                          ),
                          orElse: () => SizedBox.shrink(),
                        )),
                _buildName(),
                _buildDescription(),
                SizedBox(height: 100),
                RaisedButton(
                  color: CustomTheme.of(context).secondaryBackground,
                  child: BlocConsumer<task.TasksCubit, task.TasksState>(
                      listener: (context, state) {
                        if (state is task.Loaded) {
                          Navigator.of(context).pop();
                        } else if (state is task.Error) {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                        }
                      },
                      builder: (context, state) => state.maybeWhen(
                          loading: (tasks) => CircularProgressIndicator(),
                          orElse: () => Text(
                                'Submit',
                                style: Theme.of(context).textTheme.bodyText1,
                              ))),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    logger.i(_name);
                    logger.i(_description);
                    context.bloc<task.TasksCubit>().createTask(_name, defaultListID, description: _description, status: _status);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
