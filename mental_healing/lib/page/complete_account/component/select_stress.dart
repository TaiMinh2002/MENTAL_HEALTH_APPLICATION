import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';

class SelectStress extends StatefulWidget {
  const SelectStress({super.key});

  @override
  State<SelectStress> createState() => _SelectStressState();
}

class _SelectStressState extends State<SelectStress> {
  int selectedNumber = 1;

  Color getColorForNumber(int number) {
    switch (number) {
      case 1:
        return const Color(0xff9BB168);
      case 2:
        return const Color(0xffFFCE5C);
      case 3:
        return const Color(0xffC0A091);
      case 4:
        return const Color(0xffED7E1C);
      case 5:
        return const Color(0xffA694F5);
      default:
        return const Color(0xffACA9A5);
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
            style: TextStyle(
              fontSize: 150,
              fontWeight: FontWeight.bold,
              color: getColorForNumber(selectedNumber),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.brown,
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
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
