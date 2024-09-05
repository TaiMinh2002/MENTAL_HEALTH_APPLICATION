import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
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
    this.suffixIcon1,
    this.suffixIcon2,
    this.suffixPressed1,
    this.suffixPressed2,
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
  final String? suffixIcon1;
  final String? suffixIcon2;
  final VoidCallback? suffixPressed1;
  final VoidCallback? suffixPressed2;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        scrolledUnderElevation: 0,
        bottom: bottom,
        automaticallyImplyLeading: false,
        actions: _buildActions(),
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

  List<Widget> _buildActions() {
    List<Widget> actionWidgets = actions ?? <Widget>[];

    if (suffixIcon1 != null) {
      actionWidgets.add(
        GestureDetector(
            onTap: suffixPressed1,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(suffixIcon1!, width: 35),
            )),
      );
    }

    if (suffixIcon2 != null) {
      actionWidgets.add(
        GestureDetector(
            onTap: suffixPressed2,
            child: SvgPicture.asset(suffixIcon2!, width: 35)),
      );
    }

    if (actionTitleButton != null) {
      actionWidgets.add(
        Center(
          child: ButtonWidget(
            title: actionTitleButton!,
            onClick: actionPress!,
            textColor: Colors.white,
            borderColor: Colors.white,
            height: 30,
            width: actionButtonWidth,
            borderRadius: actionButtonRadius,
            padding: actionButtonPadding,
            margin: EdgeInsets.only(right: marginRight ?? 14),
          ),
        ),
      );
    } else {
      actionWidgets.add(SizedBox(width: marginRight));
    }

    return actionWidgets;
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
        padding: EdgeInsets.only(left: 16),
        child: SvgPicture.asset(leadingIcon ?? AssetIcons.iconBack, width: 45),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
