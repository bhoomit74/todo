import 'package:flutter/material.dart';
import 'package:todo/presentation/styles/styles.dart';

class DismissibleTile extends StatelessWidget {
  final Widget child;
  final Function() onDelete;
  const DismissibleTile(
      {super.key, required this.child, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
            padding: AppConstants.padding16,
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.red, Colors.deepOrange])),
            child: const Align(
                alignment: Alignment.centerRight, child: Icon(Icons.delete))),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            onDelete();
          }
        },
        child: child);
  }
}
