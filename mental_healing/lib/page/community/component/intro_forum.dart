import 'package:mental_healing/app_router.dart';
import 'package:mental_healing/base/base_mixin.dart';
import 'dart:async';

import 'package:mental_healing/import.dart';

class IntroForum extends StatefulWidget with BaseMixin {
  const IntroForum({super.key});

  @override
  State<IntroForum> createState() => _IntroForumState();
}

class _IntroForumState extends State<IntroForum>
    with SingleTickerProviderStateMixin {
  String fullText = LocaleKeys.welcome_forum_message.tr;
  String displayedText = '';
  int _currentWordIndex = 0;
  List<String> words = [];
  Timer? _timer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    words = fullText.split(' ');
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _startTextAnimation();
  }

  void _startTextAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (_currentWordIndex < words.length) {
        setState(() {
          displayedText += '${words[_currentWordIndex]} ';
          _currentWordIndex++;
        });
        _controller.forward(from: 0);
      } else {
        _timer?.cancel();
        Future.delayed(const Duration(seconds: 1), () {
          Get.offNamed(AppRouter.routerCreateForum);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(AssetImages.introForum, fit: BoxFit.fill)),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  displayedText,
                  style: widget.textStyle
                      .bold(size: 15, color: widget.color.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
