import 'package:mental_healing/import.dart';
import 'widget_components/button/widget_button.dart';

class AppBarCustom extends BaseWidget<BaseController>
    implements PreferredSizeWidget {
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
  Widget builder() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight.h),
      child: AppBar(
        scrolledUnderElevation: 0,
        bottom: bottom,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actionTitleButton != null
            ? <Widget>[
                Center(
                  child: WidgetButton(
                    title: actionTitleButton!,
                    onClick: actionPress!,
                    textColor: color.white,
                    borderColor: color.white,
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
        backgroundColor: backgroundColor ?? color.white,
        centerTitle: centerTitle,
        leading: hideLeading ? const SizedBox() : _buildLeading(),
        leadingWidth: 90.w,
        elevation: elevation,
        shadowColor: const Color(0xFFEAEAEA),
        title: widgetTitle ??
            Text(
              titleAppBar,
              style: textStyle.extraBold(size: 25, color: color.black),
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
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Row(
          children: [
            SvgPicture.asset(
              AssetIcons.iconBack,
              width: 45.w,
            ),
          ],
        ),
      ),
    );
  }

  @override
  String? screenName() => null;

  @override
  Size get preferredSize => Size.fromHeight(50.r);
}
