import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/page/expert_detail/expert_detail_controller.dart';
import 'package:mental_healing/common/widget_components/smart_scroll/smart_scroll_widget.dart';
import 'package:mental_healing/import.dart';

class ExpertDetailPage extends BaseScreen<ExpertDetailController>
    with SmartLoadListWidget {
  ExpertDetailPage({super.key});

  @override
  Widget builder() {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: buildSmartList(
          controller,
          enablePullUp: false,
          child: Stack(
            children: [
              Image.asset(AssetImages.expertDetailCover),
              Positioned(
                top: 15,
                left: 15,
                child: BackButtonWidget(
                  iconColor: color.whiteColor,
                  paddingSize: 0,
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.62,
                minChildSize: 0.62,
                maxChildSize: 0.62,
                builder: (context, scrollController) {
                  return Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              _headerWidget(),
                              _aboutExpert(),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: ButtonWidget(
                            onClick: () {},
                            textSize: 18,
                            textColor: color.whiteColor,
                            title: LocaleKeys.get_appointment.tr,
                            height: 55,
                            width: double.infinity,
                            bgColor: color.color64B5F6,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Obx(() {
      final item = controller.dataList.first;
      return Row(
        children: [
          if (isNotNullOrEmpty(item.avatar))
            CircleAvatar(
              backgroundImage: NetworkImage(item.avatar!),
              radius: 50,
            ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    style: textStyle.bold(size: 18, color: color.blackColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      item.contact_info ?? '',
                      maxLines: 3,
                      style:
                          textStyle.regular(size: 14, color: color.blackColor),
                    ),
                  ),
                  Row(
                    children: [
                      _activity(
                        icon: AssetIcons.expertChat,
                        onTap: () {
                          controller.handleCreateRoom(item.id ?? 0);
                        },
                      ),
                      _activity(
                        icon: AssetIcons.expertCall,
                        onTap: () {},
                      ),
                      _activity(
                        icon: AssetIcons.expertReview,
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  Widget _activity({required String icon, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: icon == AssetIcons.expertChat
            ? EdgeInsets.only(left: 0.r)
            : EdgeInsets.only(left: 15.r),
        decoration: BoxDecoration(
            color: color.colorA5D6A7, borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset(
          icon,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(color.whiteColor, BlendMode.srcIn),
        ),
      ),
    );
  }

  Widget _aboutExpert() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.specializations.tr,
              style: textStyle.bold(size: 18, color: color.blackColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                controller.dataList.first.specialization_string ?? '',
                style: textStyle.regular(size: 14, color: color.color333333),
              ),
            ),
            Text(
              LocaleKeys.about_expert.tr,
              style: textStyle.bold(size: 18, color: color.blackColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                controller.dataList.first.bio ?? '',
                style: textStyle.regular(size: 14, color: color.color333333),
              ),
            ),
            Text(
              LocaleKeys.phone_number.tr,
              style: textStyle.bold(size: 18, color: color.blackColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                controller.dataList.first.phone_number ?? '',
                style: textStyle.regular(size: 14, color: color.color333333),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  ExpertDetailController? putController() => ExpertDetailController();
}
