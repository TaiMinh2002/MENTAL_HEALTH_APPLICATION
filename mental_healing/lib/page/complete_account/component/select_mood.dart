import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/global/app_enum.dart';
import 'package:mental_healing/import.dart';
import 'package:mental_healing/page/complete_account/complete_account_controller.dart';

class SelectMood extends StatefulWidget with BaseMixin {
  final CompleteAccountController controller =
      Get.put(CompleteAccountController());
  SelectMood({super.key});

  @override
  State<SelectMood> createState() => _SelectMoodState();
}

class _SelectMoodState extends State<SelectMood> {
  double rotationAngle = 0;
  int currentSegment = 0;

  List<ui.Image> images = [];
  List<Color> imageColors = [];
  final List<ui.Image> loadedImages = [];
  int segments = 0;

  final List<Map<String, dynamic>> moodDescriptions = [
    {
      'icon': SvgPicture.asset(AssetIcons.greatIcon),
      'text': LocaleKeys.feel_great.tr,
      'mood': Mood.great,
    },
    {
      'icon': SvgPicture.asset(AssetIcons.goodIcon),
      'text': LocaleKeys.feel_good.tr,
      'mood': Mood.good,
    },
    {
      'icon': SvgPicture.asset(AssetIcons.neutralIcon),
      'text': LocaleKeys.feel_neutral.tr,
      'mood': Mood.neutral,
    },
    {
      'icon': SvgPicture.asset(AssetIcons.tiredIcon),
      'text': LocaleKeys.feel_tired.tr,
      'mood': Mood.tired,
    },
    {
      'icon': SvgPicture.asset(AssetIcons.sadIcon),
      'text': LocaleKeys.feel_sad.tr,
      'mood': Mood.sad,
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadImages();
    rotationAngle = -0.95;
    currentSegment = 0;
  }

  Future<void> _loadImages() async {
    final List<Map<String, dynamic>> imageProvidersWithColors = [
      {
        'image': const AssetImage(AssetImages.sadMood),
        'color': widget.color.colorED7E1C,
      },
      {
        'image': const AssetImage(AssetImages.tiredMood),
        'color': widget.color.colorA694F5,
      },
      {
        'image': const AssetImage(AssetImages.neutralMood),
        'color': widget.color.colorC0A091,
      },
      {
        'image': const AssetImage(AssetImages.goodMood),
        'color': widget.color.colorFFCE5C,
      },
      {
        'image': const AssetImage(AssetImages.greatMood),
        'color': widget.color.color9BB168,
      },
    ];

    segments = imageProvidersWithColors.length;

    for (final item in imageProvidersWithColors) {
      final image = await _loadImage(item['image'] as ImageProvider);
      loadedImages.add(image);
      imageColors.add(item['color'] as Color);
    }

    setState(() {
      images = loadedImages;
    });
  }

  Future<ui.Image> _loadImage(ImageProvider provider) async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ImageStream stream = provider.resolve(const ImageConfiguration());
    stream.addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);
      }),
    );
    return completer.future;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      rotationAngle += details.delta.dx * 0.01;

      final double segmentAngle = 2 * pi / segments;
      currentSegment =
          (((rotationAngle + segmentAngle) % (2 * pi)) / segmentAngle).floor();

      final dynamic selectedMood = moodDescriptions[currentSegment]['mood'];
      if (selectedMood is Mood) {
        widget.controller.setMood(selectedMood);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final moodIcon = moodDescriptions[currentSegment]['icon'] as SvgPicture;
    final moodText = moodDescriptions[currentSegment]['text'] as String;

    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  moodText,
                  style: widget.textStyle
                      .bold(size: 20, color: widget.color.color736B66),
                ),
              ),
              moodIcon,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SvgPicture.asset(AssetIcons.dropdownIcon),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  if (images.isNotEmpty && imageColors.isNotEmpty)
                    Transform.rotate(
                      angle: rotationAngle,
                      child: CustomPaint(
                        size: Size(width, width),
                        painter: SpinPainter(
                          holeRadius: 100,
                          images: images,
                          imageColors: imageColors,
                          segments: segments,
                          currentSegment: currentSegment,
                        ),
                      ),
                    ),
                  SvgPicture.asset(AssetIcons.centerPointerIcon)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpinPainter extends CustomPainter {
  SpinPainter({
    required this.segments,
    this.holeRadius = 120,
    required this.images,
    required this.imageColors,
    required this.currentSegment,
  });

  final int segments;
  final double holeRadius;
  final List<ui.Image> images;
  final List<Color> imageColors;
  final int currentSegment;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    final double radius = min(size.width / 2, size.height / 2);
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double angle = 2 * pi / segments;

    for (int i = 0; i < segments; i++) {
      final double startAngle = i * angle;
      final double sweepAngle = angle;

      paint.color = imageColors[i];

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      const double imageSize = 25;
      final double imageAngle = startAngle + angle / 2;
      final double imageRadius = radius - (radius - holeRadius) / 2;

      final Offset imageOffset = Offset(
        center.dx + imageRadius * cos(imageAngle),
        center.dy + imageRadius * sin(imageAngle),
      );

      canvas.save();
      canvas.translate(imageOffset.dx, imageOffset.dy);
      canvas.rotate(imageAngle + pi / 2);
      canvas.translate(-imageSize / 2, -imageSize / 2);
      paintImage(
        canvas: canvas,
        rect: const Rect.fromLTWH(0, 0, imageSize, imageSize),
        image: images[i],
        fit: BoxFit.contain,
      );
      canvas.restore();
    }

    paint.color = Colors.white;
    canvas.drawCircle(center, holeRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
