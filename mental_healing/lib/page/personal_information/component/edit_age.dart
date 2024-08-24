import 'package:flutter/cupertino.dart';
import 'package:mental_healing/import.dart';

class EditAge extends StatefulWidget {
  const EditAge({super.key});

  @override
  State<EditAge> createState() => _EditAgeState();
}

class _EditAgeState extends State<EditAge> {
  int _selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.45;
    double height = 50.0;

    return GestureDetector(
      onTap: () {
        _showAgePicker(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Age',
                  style: TextStyle(
                    color: Color(0xff4F3422),
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' $_selectedAge',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAgePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: CupertinoPicker(
            itemExtent: 32.0,
            scrollController:
                FixedExtentScrollController(initialItem: _selectedAge),
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedAge = index;
              });
            },
            children: List<Widget>.generate(101, (int index) {
              return Center(child: Text('$index'));
            }),
          ),
        );
      },
    );
  }
}
