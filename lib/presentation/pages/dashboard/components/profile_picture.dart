import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/profile/profile.dart';
import 'package:todo/presentation/styles/styles.dart';

class ProfilePicture extends StatelessWidget {
  final String? profileUrl;
  final double size;
  final BorderRadius? borderRadius;
  final Color borderColor;
  final double borderWidth;
  const ProfilePicture(
      {super.key,
      this.profileUrl,
      this.size = 40,
      this.borderRadius,
      this.borderColor = AppColors.primary,
      this.borderWidth = 2});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
      child: Hero(
        tag: "123",
        child: Container(
          decoration: BoxDecoration(
              borderRadius: borderRadius ?? AppConstants.borderRadius40,
              border: Border.all(color: borderColor, width: borderWidth)),
          child: ClipRRect(
            borderRadius: borderRadius ?? AppConstants.borderRadius40,
            child: CachedNetworkImage(
                imageUrl: profileUrl ?? AppImages.defaultProfilePic,
                fit: BoxFit.cover,
                width: size,
                height: size),
          ),
        ),
      ),
    );
  }
}
