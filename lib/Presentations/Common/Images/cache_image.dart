import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Shimmers/app_shimmers.dart';
import 'package:rite_funeral_flutter/imports.dart';

class CacheImage extends StatelessWidget {
  const CacheImage(
      {this.width,
      this.height,
      required this.url,
      this.fit,
      this.bgColor,
        this.isCircle,
      this.loaderBgColor,
      this.loaderIconSize,
      this.errorUrl,
      this.radius,
      this.loaderWidget,
      super.key});
  final bool? isCircle;
  final double? height;
  final double? width;
  final Size? loaderIconSize;
  final Color? loaderBgColor;
  final Color? bgColor;
  final Widget? loaderWidget;
  final String url;
  final BoxFit? fit;
  final BorderRadiusGeometry? radius;

  ///This URL will be asset image url
  final String? errorUrl;
  @override
  Widget build(BuildContext context) {

    // print(url);

    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: url.split(".").last.toLowerCase() == "svg"
          ? Container(
              color: bgColor ?? const Color(0x00e6e6e6),
              height: height,
              width: width,
              child: url.startsWith("http")
                  ? SvgPicture.network(
                      url,
                      height: height,
                      width: width,
                      fit: fit ?? BoxFit.cover,
                    )
                  : SvgPicture.asset(
                      url,
                      height: height,
                      width: width,
                      fit: fit ?? BoxFit.cover,
                    ),
            )
          :
      url.startsWith("http")?


      ColoredBox(
              color: bgColor ?? Colors.transparent,
              child:  CachedNetworkImage(
                fit: fit,
                progressIndicatorBuilder: (context, child, progress) {
                  return loaderWidget ??
                      AppShimmer(
                          child: Container(
                        height: height,
                        width: width,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ));
                },
                cacheKey: url,
                errorWidget: (context, str, dyn) {
                  return Image.asset(
                    errorUrl ?? "assets/images/logo.png",
                    fit: fit ?? BoxFit.cover,
                    width: width,
                    height: height,
                  );
                },
                imageUrl: url,
                width: width,
                height: height,
                imageBuilder: (context, imageProvider) {
               return  isCircle!= null ? CircleAvatar(
                    radius: 30.sp,
                    backgroundImage: imageProvider,
                  )
                  : Image(
                  image: imageProvider,
                  width: width,
                  height: height,
                  fit: fit,
                  );
                },)
            ): Image.asset(
        url ?? "assets/images/logo.png",
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
