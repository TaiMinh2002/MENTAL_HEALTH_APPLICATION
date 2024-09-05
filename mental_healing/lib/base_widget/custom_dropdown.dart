import 'package:flutter/material.dart';
import 'package:mental_healing/base/base_mixin.dart';

class CustomDropdown extends StatefulWidget with BaseMixin {
  final List<String> items;
  final String initialValue;
  final String title;
  final Function(String) onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.initialValue,
    required this.title,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  void _showCustomDropdown(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height,
        offset.dx + size.width,
        offset.dy + size.height + 200,
      ),
      items: widget.items.map((String value) {
        return PopupMenuItem<String>(
          value: value,
          child: Text(value,
              style: const TextStyle(overflow: TextOverflow.ellipsis)),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedValue = value;
          widget.onChanged(
              selectedValue); // Gọi hàm onChanged khi chọn giá trị mới
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.45;

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.title,
                    style: TextStyle(
                      color: widget.color.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _showCustomDropdown(context),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: widget.color.whiteColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: widget.color.color616161,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        selectedValue,
                        style: TextStyle(
                            color: widget.color.blackColor,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down,
                        color: widget.color.color616161),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
