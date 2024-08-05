import 'package:extended_image/extended_image.dart';
import 'package:mental_healing/import.dart';

class WidgetNetworkImage extends StatelessWidget with BaseMixin {
  const WidgetNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = 0.0,
    this.fit = BoxFit.contain,
    this.borderRadius,
    this.circleImage = false,
    this.placeHolder,
    this.onTap,
  });
  final String? imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool circleImage;
  final Widget? placeHolder;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ??
          BorderRadius.circular(circleImage ? width! * 3 : radius),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? GestureDetector(
              onTap: onTap ?? () {},
              behavior: HitTestBehavior.opaque,
              child: ExtendedImage.network(
                imageUrl!,
                width: width,
                height: height,
                fit: fit,
                cache: true,
                clearMemoryCacheIfFailed: true,
                loadStateChanged: (ExtendedImageState state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      return const SizedBox();
                    // return Image.asset(
                    //   AssetImages.noImage,
                    //   fit: fit,
                    //   width: width,
                    //   height: height,
                    // );
                    case LoadState.completed:
                      break;
                    case LoadState.failed:
                      return const SizedBox();
                    // return Image.asset(
                    //   AssetImages.noImage,
                    //   fit: fit,
                    //   width: width,
                    //   height: height,
                    // );
                  }
                  return null;
                },
              ),
            )
          : placeHolder ?? SizedBox(width: width, height: height),
    );
  }
}
