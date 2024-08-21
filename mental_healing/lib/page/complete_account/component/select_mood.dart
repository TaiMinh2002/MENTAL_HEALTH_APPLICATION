import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:mental_healing/generated/locales.g.dart';
import 'package:mental_healing/import.dart';

class SelectMood extends StatefulWidget {
  const SelectMood({super.key});

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
    },
    {
      'icon': SvgPicture.asset(AssetIcons.goodIcon),
      'text': LocaleKeys.feel_good.tr,
    },
    {
      'icon': SvgPicture.asset(AssetIcons.neutralIcon),
      'text': LocaleKeys.feel_neutral.tr,
    },
    {
      'icon': SvgPicture.asset(AssetIcons.tiredIcon),
      'text': LocaleKeys.feel_tired.tr,
    },
    {
      'icon': SvgPicture.asset(AssetIcons.sadIcon),
      'text': LocaleKeys.feel_sad.tr,
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
        'color': const Color(0xFFED7E1C),
      },
      {
        'image': const AssetImage(AssetImages.tiredMood),
        'color': const Color(0xFFA694F5),
      },
      {
        'image': const AssetImage(AssetImages.neutralMood),
        'color': const Color(0xFFC0A091),
      },
      {
        'image': const AssetImage(AssetImages.goodMood),
        'color': const Color(0xFFFFCE5C),
      },
      {
        'image': const AssetImage(AssetImages.greatMood),
        'color': const Color(0xFF9BB168),
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
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff736B66),
                      fontWeight: FontWeight.bold),
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
