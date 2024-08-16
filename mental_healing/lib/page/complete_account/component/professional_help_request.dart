import 'package:mental_healing/import.dart';

class ProfessionalHelpRequest extends StatefulWidget {
  const ProfessionalHelpRequest({super.key});

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
        backgroundColor: const Color(0xffF7F4F2),
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
          const Text(
            'Have you sought professional help before?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xff4F3422)),
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
            text: 'Yes',
            isSelected: isSelected,
            onTap: () {
              setState(() {
                isSelected = true;
              });
            },
          ),
          _optionContainer(
            text: 'No',
            isSelected: !isSelected,
            onTap: () {
              setState(() {
                isSelected = false;
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
          color: isSelected ? const Color(0xff9BB168) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xff9BB168),
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : const Color(0xff4F3422),
          ),
        ),
      ),
    );
  }
}
