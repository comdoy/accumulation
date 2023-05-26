import 'package:accumulation/utils/src/img_asset.dart';
import 'package:flutter/widgets.dart';

class INetworkImage extends StatelessWidget {
  const INetworkImage({
    Key? key,
    this.image,
    String? placeholder,
    this.width,
    this.height,
    BoxFit? fit,
    this.borderRadius = 0,
  })  : fit = fit ?? BoxFit.cover,
        placeholder = placeholder ?? ImgAsset.transparent,
        super(key: key);

  const INetworkImage.cricle({
    Key? key,
    this.image,
    String? placeholder,
    BoxFit? fit,
    double radius = 0,
  })  : fit = fit ?? BoxFit.cover,
        borderRadius = radius * 0.5,
        width = radius,
        height = radius,
        placeholder = placeholder ?? ImgAsset.transparent,
        super(key: key);

  final String? image;

  final String placeholder;

  final double? width;

  final double? height;

  final BoxFit fit;

  final double? borderRadius;

  Image get placeholderImage {
    return Image.asset(
      placeholder,
      width: width,
      height: height,
      fit: fit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: image==null
          ? placeholderImage
          : FadeInImage.assetNetwork(
              placeholder: placeholder,
              image: image!,
              fit: fit,
              height: height,
              width: width,
              imageErrorBuilder: (b, o, s) => placeholderImage,
            ),
    );
  }
}
