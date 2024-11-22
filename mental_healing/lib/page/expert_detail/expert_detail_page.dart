import 'package:lottie/lottie.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/base_widget/button_widget.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/expert_detail/expert_detail_controller.dart';

class ExpertDetailPage extends StatelessWidget with BaseMixin {
  ExpertDetailPage({super.key});

  final ExpertDetailController controller = Get.put(ExpertDetailController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: Obx(() {
          if (controller.isLoading.value) {
            return Lottie.asset(AssetLotties.appLoading);
          }
          if (controller.expert.value == null) {
            return Center(child: Text(LocaleKeys.error_loading_data.tr));
          }

          return Stack(
            children: [
              Column(
                children: [
                  _headerWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Column(
                          children: [
                            _info(),
                            _bio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: color.color81C784,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              BackButtonWidget(
                iconColor: color.whiteColor,
                paddingSize: 0,
              ),
            ],
          ),
          Text(
            LocaleKeys.expert_detail.tr,
            textAlign: TextAlign.center,
            style: textStyle.medium(size: 18, color: color.whiteColor),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: color.whiteColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.whiteColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                controller.expert.value!.avatar,
                height: 130,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _infoItem(
                icon: AssetIcons.expertChat,
                label: LocaleKeys.chat.tr,
                value: LocaleKeys.chat_with_expert.tr,
                onTap: controller.handleChatExpert,
              ),
              _infoItem(
                icon: AssetIcons.expertCall,
                label: LocaleKeys.video_call.tr,
                value: LocaleKeys.video_call_with_expert.tr,
                onTap: () {},
              ),
              _infoItem(
                icon: AssetIcons.expertReview,
                label: '5',
                value: LocaleKeys.rating.tr,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(
      {required String icon,
      required String label,
      required String value,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.colorA5D6A7,
            ),
            child: SvgPicture.asset(
              icon,
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(color.whiteColor, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: textStyle.medium(size: 14, color: color.whiteColor),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: textStyle.regular(size: 12, color: color.whiteColor),
          ),
        ],
      ),
    );
  }

  Widget _info() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Dr. ${controller.expert.value!.name}',
            style: textStyle.bold(size: 20, color: color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              controller.expert.value!.specializationString,
              style: textStyle.regular(size: 16, color: color.color333333),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(Icons.star, color: color.colorFFD700, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.about_expert.tr,
            style: textStyle.bold(size: 18, color: color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              controller.expert.value!.bio,
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
              controller.expert.value!.phoneNumber,
              style: textStyle.regular(size: 14, color: color.color333333),
            ),
          ),
          Text(
            LocaleKeys.contact_info.tr,
            style: textStyle.bold(size: 18, color: color.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              controller.expert.value!.contactInfo,
              style: textStyle.regular(size: 14, color: color.color333333),
            ),
          ),
        ],
      ),
    );
  }
}
