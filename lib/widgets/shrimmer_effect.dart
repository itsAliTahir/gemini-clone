import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContinuousShimmer extends StatefulWidget {
  final Duration delay;
  final Duration period;
  final Color baseColor;
  final Color highlightColor;
  final Widget child;

  const ContinuousShimmer({
    super.key,
    required this.delay,
    this.period = const Duration(milliseconds: 1200),
    required this.baseColor,
    required this.highlightColor,
    required this.child,
  });

  @override
  _ContinuousShimmerState createState() => _ContinuousShimmerState();
}

class _ContinuousShimmerState extends State<ContinuousShimmer> {
  bool _isShimmering = false;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  Future<void> _startDelay() async {
    await Future.delayed(widget.delay);
    if (mounted) {
      setState(() {
        _isShimmering = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isShimmering
        ? Shimmer.fromColors(
            loop: 100,
            baseColor: widget.baseColor,
            highlightColor: widget.highlightColor,
            period: widget.period,
            direction: ShimmerDirection.ltr,
            child: widget.child,
          )
        : widget.child;
  }
}
