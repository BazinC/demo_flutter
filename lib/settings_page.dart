import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
      children: [
        ListTile(
          title: Text('The design is intended to be responsive'),
          subtitle: Text('Launch the demo on a desktop web browser, change window width, or enable device preview'),
        ),
        _SlowAnimationTile(),
        _DevicePreviewTile(),
      ],
    );
  }
}

class _SlowAnimationTile extends StatefulWidget {
  const _SlowAnimationTile({
    Key key,
  }) : super(key: key);

  @override
  __SlowAnimationTileState createState() => __SlowAnimationTileState();
}

class __SlowAnimationTileState extends State<_SlowAnimationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Slow animation'),
      trailing: Switch(
        value: timeDilation != 1.0,
        onChanged: (switchedOn) {
          setState(() {
            timeDilation = switchedOn ? 5.0 : 1.0;
          });
        },
      ),
    );
  }
}

class _DevicePreviewTile extends StatelessWidget {
  const _DevicePreviewTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Enable device preview'),
      trailing: Switch(
        value: context.watch<DevicePreviewNotifier>().isEnabled,
        onChanged: (switchedOn) {
          context.read<DevicePreviewNotifier>().isEnabled = switchedOn;
        },
      ),
    );
  }
}
