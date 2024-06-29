import 'package:flutter/material.dart';
import 'package:todo/domain/enums/greet.dart';
import 'package:todo/presentation/pages/dashboard/components/profile_picture.dart';
import 'package:todo/presentation/styles/styles.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${Greet.message},", style: AppTextStyle.h4()),
            Text("Bhoomit", style: AppTextStyle.h4Normal()),
          ],
        ),
        const ProfilePicture(),
      ],
    );
  }
}
