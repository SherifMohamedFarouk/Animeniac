import 'package:animeniac/core/color/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/global_widgets/image_with_shimmer.dart';

class MangaSliderCardImage extends StatelessWidget {
  const MangaSliderCardImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            blackColor,
            blackColor,
            Colors.transparent,
          ],
          stops: [0.3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      child: ImageWithShimmer(
        height: size.height * 0.6,
        width: double.infinity,
        imageUrl: imageUrl,
      ),
    );
  }
}
