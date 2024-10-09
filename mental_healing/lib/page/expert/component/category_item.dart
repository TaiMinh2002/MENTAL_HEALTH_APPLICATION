import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';

class CategoryItem extends StatelessWidget with BaseMixin {
  const CategoryItem(
      {super.key,
      required this.category,
      required this.categoryColor,
      required this.icon});

  final String category;
  final Color categoryColor;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                  color: color.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: color.color1AFFFFFF.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              height: 150,
              width: 140,
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    category,
                    style: textStyle.bold(size: 16, color: color.blackColor),
                  )
                ],
              ),
            ),
            Positioned(
              top: -14,
              right: -7,
              child: Container(
                  decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  height: 85,
                  width: 85,
                  child: Center(
                    child: Text(
                      icon,
                      style: textStyle.bold(size: 35),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
