import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).colorScheme.background,
    );
  }
}
