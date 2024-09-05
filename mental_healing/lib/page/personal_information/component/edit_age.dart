import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/page/personal_information/personal_information_controller.dart';

class EditAge extends StatefulWidget with BaseMixin {
  const EditAge({super.key});

  @override
  State<EditAge> createState() => _EditAgeState();
}

class _EditAgeState extends State<EditAge> {
  final PersonalInformationController controller =
      Get.put(PersonalInformationController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.45;
    double height = 50.0;

    return GestureDetector(
      onTap: () {
        controller.showAgePicker(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Age',
                  style: TextStyle(
                    color: widget.color.mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: widget.color.whiteColor,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: widget.color.color616161,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                        '${controller.selectedAge.value}',
                        style: TextStyle(
                          color: widget.color.blackColor,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  Icon(Icons.arrow_drop_down, color: widget.color.color616161),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
