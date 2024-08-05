import 'package:mental_healing/common/widget_components/drop_down/select.dart';
import 'package:mental_healing/common/widget_components/drop_down/widget_dropdown.dart';
import 'package:mental_healing/import.dart';

class DropdownBoxSelect<T> extends StatelessWidget with BaseMixin {
  DropdownBoxSelect({
    Key? key,
    this.title = '',
    this.initialValue,
    required this.data,
    required this.selectedValue,
    this.isEnabled = true,
    this.width,
    this.hint = '---',
    this.icon,
    this.isExpanded = true,
    this.borderColor,
    this.hintStyle,
    this.textColor,
    this.colorBg,
    this.showSearch = false,
    this.errText,
    this.focusNode,
    this.isRequired = false,
    this.isField = false,
    this.isRequiredValue = false,
    this.fieldList,
    this.onChangeMultiple,
    this.itemHeight = 50,
    this.buttonPadding = 0,
    this.isShowDivider = true,
    this.marginTop = 0,
    this.searchInnerWidgetHeight = 100,
    this.isActive = true,
    this.isNormalDropdown = false,
    this.titleStyle,
  }) : super(key: key);

  final String title;
  final String hint;
  final Select<T>? initialValue;
  final List<Select<T>> data;
  final Function(Select<T>?) selectedValue;
  final bool isEnabled;
  final double? width;
  final Color? borderColor;
  final String? icon;
  final bool? isExpanded;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final Color? textColor;
  final Color? colorBg;
  final bool showSearch;
  final String? errText;
  final FocusNode? focusNode;
  final bool isRequired;
  final bool isField;
  final bool isRequiredValue;
  final double itemHeight;
  final double buttonPadding;
  final bool isShowDivider;
  final List<Select<T>>? fieldList;
  final Function(List<Select<T>> value)? onChangeMultiple;
  final double marginTop;
  final bool isActive;
  final double searchInnerWidgetHeight;
  final bool isNormalDropdown;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: textStyle.bold(size: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (isRequired)
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            color: color.redColor,
                            padding: const EdgeInsets.only(
                                left: 7, right: 7, top: 4, bottom: 3),
                            child: Text(
                              'LocaleKeys.required.tr',
                              style: textStyle.bold(
                                  size: 10, color: color.white, height: 1),
                            ),
                          )
                        else
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            color: color.redColor,
                            padding: const EdgeInsets.only(
                                left: 7, right: 7, top: 4, bottom: 3),
                            child: Text(
                              'LocaleKeys.unRequired.tr',
                              style: textStyle.bold(
                                  size: 10, color: color.white, height: 1),
                            ),
                          )
                      ],
                    ),
                  ),
                Expanded(
                  child: SizedBox(
                    height: itemHeight + 1,
                    child: DropdownCustom<T>(
                      hint: hint,
                      onChanged: selectedValue,
                      value: initialValue,
                      data: data,
                      textColor: textColor,
                      focusNode: focusNode,
                      icon: icon,
                      isNormalDropdown: isNormalDropdown,
                      itemHeight: itemHeight,
                      isExpanded: isExpanded!,
                      hintStyle: hintStyle,
                      iconColor: textColor,
                      showSearch: showSearch,
                      isField: isField,
                      isRequiredValue: isRequiredValue,
                      onChangeMultiple: onChangeMultiple,
                      fieldList: fieldList,
                      buttonPadding: buttonPadding,
                      isShowDivider: isShowDivider,
                      isActive: isActive,
                      titleStyle: titleStyle,
                      searchInnerWidgetHeight: searchInnerWidgetHeight,
                    ),
                  ),
                ),
              ],
            ),
            if (errText != null && initialValue == null) _buildErr()
          ],
        ),
      ),
    );
  }

  Widget _buildErr() {
    return Padding(
      padding: isNotNullOrEmpty(title)
          ? const EdgeInsets.only(top: 6, bottom: 6, left: 60)
          : const EdgeInsets.only(top: 6, bottom: 6),
      child: Text(
        errText!,
        style: textStyle.regular(
          size: 12,
          color: color.redColor,
        ),
      ),
    );
  }
}
