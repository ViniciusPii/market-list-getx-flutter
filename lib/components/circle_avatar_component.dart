import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_list/theme/app_dimension.dart';
import 'package:market_list/theme/app_extension.dart';

class CircleAvatarComponent extends StatelessWidget {
  const CircleAvatarComponent({
    Key? key,
    required this.url,
    this.size = AppDimension.size_4,
  }) : super(key: key);

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: AppExtension.primary,
      backgroundImage: CachedNetworkImageProvider(url),
    );
  }
}
