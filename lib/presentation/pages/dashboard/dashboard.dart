import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/dashboard/components/header.dart';
import 'package:todo/presentation/styles/app_constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppConstants.padding32,
        child: Column(
          children: [Header()],
        ),
      )),
    );
  }
}
