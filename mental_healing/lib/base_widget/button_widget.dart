import 'package:mental_healing/import.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.title,
    required this.onClick,
    this.width,
    this.height = 50,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 100,
    this.textWeight,
    this.textSize = 14,
    this.prefixIcon,
    this.suffixIcon,
    this.margin,
    this.padding = 16,
    this.disable = false,
    this.isLoading = false,
    this.elevation = 0,
    this.content,
  }) : super(key: key);

  final String title;
  final String? content;
  final Function() onClick;

  final double? width;
  final double height;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final FontWeight? textWeight;
  final double? textSize;
  final String? prefixIcon;
  final String? suffixIcon;
  final EdgeInsets? margin;
  final double padding;
  final bool disable;
  final bool isLoading;
  final double elevation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: ElevatedButton(
          onPressed: disable || isLoading ? null : onClick,
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            backgroundColor: bgColor ?? Color(0xff4F3422),
            disabledBackgroundColor: Colors.grey,
            padding: EdgeInsets.symmetric(horizontal: padding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: borderColor != null
                  ? BorderSide(color: borderColor!, width: 1)
                  : BorderSide.none,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefixIcon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: SvgPicture.asset(prefixIcon!, width: 16),
                    ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: textSize,
                        height: 1.2),
                  ),
                  if (suffixIcon != null)
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: SvgPicture.asset(suffixIcon!, width: 24),
                    ),
                ],
              ),
              if (content != null)
                Text(
                  content!,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )
            ],
          ),
        ),
      ),
    );
  }
}
