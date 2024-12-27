import 'package:mental_healing/base/base_common_widgets.dart';
import 'package:mental_healing/import.dart';

class SelectCoverImage extends BaseWidget with BaseCommonWidgets {
  SelectCoverImage(
      {super.key, required this.title, required this.onTapItem, this.icon});
  final String title;
  final VoidCallback onTapItem;
  final IconData? icon;
  @override
  Widget builder() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTapItem,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (icon != null) Icon(icon, size: 25.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title.tr,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle.regular(size: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
