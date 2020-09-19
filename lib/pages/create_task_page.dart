import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/cubit/cubit/create_task_cubit.dart';
import 'package:responsive_demo/repositories/task_repository.dart';
import 'package:responsive_demo/widgets/clickup_appbar_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage();

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  String _name;
  String _description;
  // String _email;
  // String _password;
  // String _url;
  // String _phoneNumber;
  // String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                _buildName(),
                _buildDescription(),
                SizedBox(height: 100),
                RaisedButton(
                  child: BlocConsumer<CreateTaskCubit, CreateTaskState>(
                      listener: (context, state) {
                        if (state is Success) {
                          Navigator.of(context).pop();
                        } else if (state is Error) {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.text)));
                        }
                      },
                      builder: (context, state) => state.when(
                            initial: () => Text(
                              'Submit',
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            loading: () => CircularProgressIndicator(),
                            error: (String error) => Text(
                              'Submit',
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            success: (Task) => Text(
                              'Submit',
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          )),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_description);
                    context.bloc<CreateTaskCubit>().createTask(_name, description: _description);
                    // print(_email);
                    // print(_phoneNumber);
                    // print(_url);
                    // print(_password);
                    // print(_calories);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ));
  }
}
