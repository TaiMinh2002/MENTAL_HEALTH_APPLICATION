import 'package:mental_healing/import.dart';
import 'tween/delay_tween.dart';

class CircleLoading extends StatefulWidget {
  const CircleLoading({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1000),
    this.controller,
  }) : super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<CircleLoading> createState() => _CircleLoadingState();
}

class _CircleLoadingState extends State<CircleLoading>
    with SingleTickerProviderStateMixin, BaseMixin {
  static const _itemCount = 12;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(_itemCount, (index) {
            final position = widget.size * .5;
            return Positioned.fill(
              left: position,
              top: position,
              child: Transform(
                transform: Matrix4.rotationZ(30.0 * index * 0.0174533),
                child: Align(
                  alignment: Alignment.center,
                  child: ScaleTransition(
                    scale: DelayTween(
                            begin: 0.0, end: 1.0, delay: index / _itemCount)
                        .animate(_controller),
                    child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(index)),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
              color: widget.color ?? color.mainColor, shape: BoxShape.circle));
}
