import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mental_healing/common/widget_components/drop_down/select.dart';
import 'package:mental_healing/import.dart';

class DropdownCustom<T> extends StatefulWidget {
  const DropdownCustom({
    Key? key,
    this.hint,
    required this.onChanged,
    this.value,
    required this.data,
    this.isExpanded = true,
    this.iconColor,
    this.textColor,
    this.hintColor,
    this.hintStyle,
    this.icon,
    this.isDense = false,
    this.maxLength = 1,
    this.showSearch = false,
    this.focusNode,
    this.isRequiredValue = false,
    this.isField = false,
    this.onChangeMultiple,
    this.fieldList,
    this.itemHeight = 50,
    this.buttonPadding = 0,
    this.isShowDivider = true,
    this.errText = '',
    this.isValidate = false,
    this.isActive = true,
    this.searchInnerWidgetHeight = 100,
    this.isNormalDropdown = false,
    this.titleStyle,
  }) : super(key: key);

  final String? hint;
  final Function(Select<T>?) onChanged;
  final Select<T>? value;
  final List<Select<T>> data;
  final bool isExpanded;
  final Color? iconColor;
  final Color? textColor;
  final Color? hintColor;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final String? icon;
  final bool isDense;
  final int maxLength;
  final bool showSearch;
  final FocusNode? focusNode;
  final bool isField;
  final bool isRequiredValue;
  final double itemHeight;
  final Function(List<Select<T>> value)? onChangeMultiple;
  final List<Select<T>>? fieldList;
  final double buttonPadding;
  final bool isShowDivider;
  final String errText;
  final bool isValidate;
  final bool isActive;
  final double searchInnerWidgetHeight;
  final bool isNormalDropdown;
  @override
  // ignore: library_private_types_in_public_api
  _DropdownCustomState<T> createState() => _DropdownCustomState<T>();
}

class _DropdownCustomState<T> extends State<DropdownCustom<T>> with BaseMixin {
  Select<T>? selectedValue;
  late List<Select<T>> data;
  bool isActiveButton = false;
  bool matchSearch = true;
  int counter = 0;
  TextEditingController searchContent = TextEditingController();
  List<Select<T>> selectedItems = [];
  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    data = widget.data;
    if (widget.fieldList != null) {
      selectedItems = widget.fieldList!;
    }
  }

  @override
  void didUpdateWidget(DropdownCustom<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      data = widget.data;
      setState(() {});
    }
    if (oldWidget.fieldList != widget.fieldList) {
      if (widget.fieldList != null) {
        selectedItems = widget.fieldList!;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<Select<T>>(
            hint: Text(
              widget.hint ?? '',
              maxLines: widget.maxLength,
              style: widget.hintStyle ??
                  textStyle.bold(
                      color: widget.hintColor ?? color.redColor, size: 14),
            ),
            // dropdownFullScreen: false,
            // scrollbarAlwaysShow: true,

            isExpanded: widget.isExpanded,
            focusNode: widget.focusNode,
            alignment: Alignment.centerLeft,
            // icon: widget.icon != null
            //     ? SizedBox(
            //         width: 16,
            //         height: 16.0,
            //         child:
            //             SvgPicture.asset(widget.icon!, width: 16, height: 16.0),
            //       )
            //     : Container(
            //         width: 30,
            //         height: 30,
            //         color:
            //             widget.isActive ? color.mainColor : color.colorCCCCCC,
            //         alignment: Alignment.center,
            //         padding: const EdgeInsets.all(7),
            //         margin: const EdgeInsets.only(right: 10),
            //         child: SvgPicture.asset(
            //           AssetIcons.arrowDown,
            //           width: 20,
            //           height: 20.0,
            //           // ignore: deprecated_member_use
            //           color: widget.iconColor ?? color.white,
            //         ),
            //       ),
            items: widget.isField
                ? data.map((item) {
                    return DropdownMenuItem<Select<T>>(
                      value: item,
                      enabled: false,
                      child: StatefulBuilder(
                        builder: (context, menuSetState) {
                          final bool isSelected = selectedItems.contains(item);
                          return InkWell(
                            onTap: () {
                              isSelected
                                  ? selectedItems.remove(item)
                                  : selectedItems.add(item);
                              setState(() {});
                              menuSetState(() {});
                            },
                            child: Container(
                              height: 56,
                              color: isSelected ? color.mainColor : color.white,
                              width: Get.width,
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                item.title?.tr ?? '',
                                style: textStyle.bold(
                                  size: 14.0,
                                  color: isSelected ? color.white : color.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList()
                : data
                    .map(
                      (Select<T> i) => DropdownMenuItem<Select<T>>(
                        value: i,
                        child: widget.isNormalDropdown
                            ? Center(child: _itemDropDown(i))
                            : _itemDropDown(i),
                      ),
                    )
                    .toList(),
            value: widget.isField
                ? (selectedItems.isEmpty ? null : selectedItems.last)
                : selectedValue,
            onChanged: (Select<T>? value) {
              if (widget.isRequiredValue) {
                widget.onChanged(value);
                setState(() => selectedValue = value);
              } else {
                widget.onChanged(value);
                setState(() => selectedValue = value);

                // if (value != selectedValue) {
                //   widget.onChanged(value);
                //   setState(() => selectedValue = value);
                // } else {
                //   widget.onChanged(null);
                //   setState(() => selectedValue = null);
                // }
              }
            },
            // dropdownDecoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5.0), color: color.white),
            // buttonDecoration: widget.isNormalDropdown
            //     ? null
            //     : BoxDecoration(
            //         borderRadius: BorderRadius.circular(0),
            //         border: Border.all(color: color.black, width: 1.0),
            //         color: color.white,
            //       ),
            selectedItemBuilder: (_) {
              return widget.isField
                  ? data.map(
                      (item) {
                        return Row(
                          children: [
                            Flexible(
                              child: Text(
                                selectedItems
                                    .map((e) => e.title)
                                    .toList()
                                    .join(','),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: widget.titleStyle ??
                                    textStyle.bold(
                                        size: 14.0, color: color.redColor),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList()
                  : data
                      .map((Select<T> i) => DropdownMenuItem<Select<T>>(
                            value: i,
                            child: Row(
                              mainAxisAlignment: widget.isNormalDropdown
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    i.title?.tr ?? '',
                                    maxLines: widget.maxLength,
                                    overflow: TextOverflow.ellipsis,
                                    style: widget.titleStyle ??
                                        textStyle.bold(
                                            size: 14.0, color: color.black),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList();
            },
            onMenuStateChange: (bool value) {
              setState(() => isActiveButton = value);
              setState(() => matchSearch = true);
              if (!value) {
                searchContent.clear();
              }
              if (widget.onChangeMultiple != null) {
                widget.onChangeMultiple!(selectedItems);
              }
            },
            // dropdownSearchData: DropdownSearchData(
            //   searchController: TextEditingController(),
            //   searchInnerWidget:
            // ),
            // itemPadding:
            //     EdgeInsets.symmetric(horizontal: widget.isField ? 0.0 : 10.0),
            // dropdownPadding: EdgeInsets.zero,
            // buttonPadding:
            //     EdgeInsets.symmetric(horizontal: widget.buttonPadding),
            // buttonHeight: widget.itemHeight - 1,
            // selectedItemHighlightColor: color.mainColor,
            // dropdownMaxHeight: 325,
            // dropdownScrollPadding: EdgeInsets.only(bottom: 5),
            // searchInnerWidgetHeight: widget.searchInnerWidgetHeight,
            // searchInnerWidget: widget.showSearch
            //     ? StatefulBuilder(
            //         builder: (context, setState) {
            //           return Column(
            //             key: ValueKey(counter),
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(
            //                     vertical: 10, horizontal: 10.0),
            //                 child: CustomInputText(
            //                   hintText: 'Title',
            //                   controller: searchContent,
            //                   currentNode: widget.focusNode,
            //                   contentPadding:
            //                       const EdgeInsets.fromLTRB(12, 16, 0, 16),
            //                   marginTop: 0,
            //                   clearText: () {
            //                     setState(() => matchSearch = true);
            //                   },
            //                   onChanged: (value) {
            //                     if (widget.showSearch) {
            //                       final List<Select<T>> newList = widget.data
            //                           .where((element) =>
            //                               element.title!.toLowerCase().contains(
            //                                     value.trim().toLowerCase(),
            //                                   ))
            //                           .toList();
            //                       if (newList.isEmpty) {
            //                         matchSearch = false;
            //                         setState(() {});
            //                       } else {
            //                         matchSearch = true;
            //                         setState(() {});
            //                       }
            //                     }
            //                   },
            //                 ),
            //               ),
            //               if (matchSearch == false)
            //                 Padding(
            //                   padding: const EdgeInsets.only(
            //                     left: 10,
            //                     right: 10,
            //                     bottom: 15,
            //                     top: 10,
            //                   ),
            //                   child: Text(
            //                     'データなし',
            //                     style: textStyle.bold(
            //                         size: 14.0, color: color.black),
            //                   ),
            //                 )
            //               else
            //                 const SizedBox(),
            //             ],
            //           );
            //         },
            //       )
            //     : const SizedBox(),
            // searchController: searchContent,
            // searchMatchFn: (DropdownMenuItem<dynamic> rtItem, searchValue) {
            //   return rtItem.value.title.toLowerCase().contains(
            //         searchValue.trim().toLowerCase(),
            //       );
            // },
          ),
        ),
        if (widget.isShowDivider)
          Divider(
            color: color.redColor,
            height: 1,
            thickness: 1,
          ),
      ],
    );
  }

  Widget _itemDropDown(Select<T> i) {
    return Text(
      i.title?.tr ?? '',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: widget.hintStyle ??
          textStyle.bold(
            size: 14.0,
            color: i == selectedValue ? color.white : color.black,
          ),
    );
  }
}
