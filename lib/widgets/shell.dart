import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Shell extends StatelessWidget {
  const Shell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Idris Labidi"),
        actions: [
          ShadButton(
            child: Text("Projects"),
          ),
          ShadButton(
            child: Text("Activities"),
          )
        ],
      ),
      body: child,
    );
  }
}
