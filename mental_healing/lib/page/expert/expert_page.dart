import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/base_widget/back_button_widget.dart';
import 'package:mental_healing/import.dart';

class ExpertPage extends StatelessWidget with BaseMixin {
  final TextEditingController searchController = TextEditingController();
  ExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: Column(
          children: [
            Stack(
              children: [
                _headerWidget(),
                Positioned(bottom: -10, child: _search())
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        gradient: LinearGradient(
          colors: [
            color.color81C784,
            color.colorC8E6C9,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonWidget(
            iconColor: color.whiteColor,
            paddingSize: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_welcomeWidget(), _avatarWidget()],
          ),
        ],
      ),
    );
  }

  Widget _welcomeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hi ....!',
          style: textStyle.regular(size: 16, color: color.whiteColor),
        ),
        Text(
          LocaleKeys.find_expert.tr,
          style: textStyle.extraBold(size: 20, color: color.whiteColor),
        ),
      ],
    );
  }

  Widget _avatarWidget() {
    return const CircleAvatar(
      backgroundImage: AssetImage(AssetImages.noPerson),
      radius: 50,
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow effect
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey, // Search icon color
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search.....",
                border: InputBorder.none, // Removes the default border
              ),
              onChanged: (value) {
                // Add logic to handle the search input
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              searchController.clear(); // Clear the search input
            },
            child: Icon(
              Icons.close,
              color: Colors.grey, // Clear icon color
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
