import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';

class SelectStress extends StatefulWidget with BaseMixin {
  final CompleteAccountController controller =
      Get.put(CompleteAccountController());
  SelectStress({super.key});

  @override
  State<SelectStress> createState() => _SelectStressState();
}

class _SelectStressState extends State<SelectStress> {
  int selectedNumber = 1;

  Color getColorForNumber(int number) {
    switch (number) {
      case 1:
        return widget.color.color9BB168;
      case 2:
        return widget.color.colorFFCE5C;
      case 3:
        return widget.color.colorC0A091;
      case 4:
        return widget.color.colorED7E1C;
      case 5:
        return widget.color.colorA694F5;
      default:
        return widget.color.colorACA9A5;
    }
  }

  String getTextForNumber(int number) {
    switch (number) {
      case 1:
        return LocaleKeys.feeling_calm.tr;
      case 2:
        return LocaleKeys.bit_stressed.tr;
      case 3:
        return LocaleKeys.fair_amount_of_stress.tr;
      case 4:
        return LocaleKeys.quite_stressed.tr;
      case 5:
        return LocaleKeys.extremely_stressed.tr;
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$selectedNumber',
            style: widget.textStyle.bold(
              size: 150,
              color: getColorForNumber(selectedNumber),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.color.whiteColor,
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                int number = index + 1;
                bool isSelected = number == selectedNumber;
                widget.controller.setStress(selectedNumber);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedNumber = number;
                    });
                  },
                  child: Container(
                    decoration: isSelected
                        ? BoxDecoration(
                            color: getColorForNumber(number),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: getColorForNumber(selectedNumber),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          )
                        : null,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 11.0, vertical: 10),
                    child: Text(
                      '$number',
                      style: widget.textStyle.bold(
                        size: 22,
                        color: isSelected
                            ? widget.color.whiteColor
                            : widget.color.color6F4E37,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              getTextForNumber(selectedNumber),
              style: widget.textStyle.bold(
                size: 18,
                color: getColorForNumber(selectedNumber),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
