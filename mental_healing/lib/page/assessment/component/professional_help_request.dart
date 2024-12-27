import 'package:mental_healing/import.dart';

class ProfessionalHelpRequest extends StatefulWidget with BaseMixin {
  ProfessionalHelpRequest({super.key, required this.onChange});
  final Function(int value) onChange;

  @override
  State<ProfessionalHelpRequest> createState() =>
      _ProfessionalHelpRequestState();
}

class _ProfessionalHelpRequestState extends State<ProfessionalHelpRequest> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.color.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [_bodyWidget(), _selectWidget()],
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 30),
      child: Column(
        children: [
          Text(
            LocaleKeys.sought_professional_help.tr,
            textAlign: TextAlign.center,
            style: widget.textStyle
                .extraBold(size: 28, color: widget.color.mainColor),
          ),
          _imageWidget()
        ],
      ),
    );
  }

  Widget _imageWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Image.asset(AssetImages.thinkingStress),
    );
  }

  Widget _selectWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _optionContainer(
            text: LocaleKeys.yes.tr,
            isSelected: isSelected,
            onTap: () {
              setState(() {
                isSelected = true;
                widget.onChange(1);
              });
            },
          ),
          _optionContainer(
            text: LocaleKeys.no.tr,
            isSelected: !isSelected,
            onTap: () {
              setState(() {
                isSelected = false;
                widget.onChange(2);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _optionContainer({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 50,
        decoration: BoxDecoration(
          color:
              isSelected ? widget.color.color9BB068 : widget.color.whiteColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: widget.color.color9BB068,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: widget.textStyle.bold(
            size: 18,
            color:
                isSelected ? widget.color.whiteColor : widget.color.mainColor,
          ),
        ),
      ),
    );
  }
}
