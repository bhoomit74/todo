import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/dashboard/components/header.dart';
import 'package:todo/presentation/styles/app_constants.dart';
import 'package:todo/presentation/styles/app_strings.dart';
import 'package:todo/presentation/widgets/app_search_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppConstants.padding32,
        child: Column(
          children: [
            const Header(),
            AppConstants.gap20,
            AppSearchBar(
                hint: AppStrings.searchTaskHere,
                onSearch: (query) {
                  //TODO: Perform search
                }),
            AppConstants.gap20,
          ],
        ),
      )),
    );
  }
}
