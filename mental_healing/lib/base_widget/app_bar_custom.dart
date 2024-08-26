import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  AppBarCustom({
    Key? key,
    this.titleAppBar = '',
    this.widgetTitle,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.leadingPressed,
    this.backgroundColor,
    this.leadingIcon,
    this.hideLeading = false,
    this.elevation = 0.5,
    this.bottom,
    this.actionTitleButton,
    this.actionButtonRadius = 10,
    this.actionPress,
    this.actionButtonPadding = 0,
    this.backIconColor,
    this.actionButtonWidth,
    this.marginRight = 14,
  }) : super(key: key);

  final String titleAppBar;
  final Widget? widgetTitle;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final String? actionTitleButton;
  final VoidCallback? leadingPressed;
  final Function()? actionPress;
  final String? leadingIcon;
  final Color? backgroundColor;
  final bool hideLeading;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final double actionButtonRadius;
  final double actionButtonPadding;
  final double? actionButtonWidth;
  final Color? backIconColor;
  final double? marginRight;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight.h),
      child: AppBar(
        scrolledUnderElevation: 0,
        bottom: bottom,
        automaticallyImplyLeading: false,
        actions: actionTitleButton != null
            ? <Widget>[
                Center(
                  child: ButtonWidget(
                    title: actionTitleButton!,
                    onClick: actionPress!,
                    textColor: Colors.white,
                    borderColor: Colors.white,
                    height: 30.h,
                    width: actionButtonWidth,
                    borderRadius: actionButtonRadius,
                    padding: actionButtonPadding,
                    margin: EdgeInsets.only(right: 14.r),
                  ),
                ),
              ]
            : <Widget>[
                ...actions ?? <Widget>[],
                SizedBox(width: marginRight),
              ],
        backgroundColor: backgroundColor ?? Colors.white,
        centerTitle: centerTitle,
        leading: hideLeading ? const SizedBox() : _buildLeading(),
        elevation: elevation,
        shadowColor: const Color(0xFFEAEAEA),
        title: widgetTitle ??
            Text(
              titleAppBar,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
              maxLines: 2,
            ),
      ),
    );
  }

  Widget? _buildLeading() {
    if (!automaticallyImplyLeading) {
      return null;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (leadingPressed != null) {
          leadingPressed!();
        } else {
          Get.back();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 16.r),
        child: SvgPicture.asset(AssetIcons.iconBack, width: 45.w),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.r);
}
