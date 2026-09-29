import 'package:flutter/material.dart';
import 'package:overtune/global/current_theme.dart';

class LargeIcon extends StatefulWidget {
  const LargeIcon({super.key, required this.icon});

  final IconData icon;

  @override
  State<LargeIcon> createState() => _LargeIconState();
}

class _LargeIconState extends State<LargeIcon> with TickerProviderStateMixin {
  double turns = 0.0;
  final double totalRevolutions = 2;
  final Duration animationDuration = .new(seconds: 3);

  late AnimationController _animController;
  late Animation _rotAnim;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: animationDuration
    );

    _rotAnim = Tween<double>(begin: 0, end: totalRevolutions * 2 * 3.14).animate( // fuh radians ~Absyllute
        CurvedAnimation(
            parent: _animController,
            curve: Curves.easeInOut
        )
    );

    _animController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
          shape: .circle,
          gradient: LinearGradient(
              colors: [
                CurrentTheme.theme.primary.withValues(alpha: .5),
                CurrentTheme.theme.primaryAlt.withValues(alpha: .5),
              ],

              begin: .topLeft,
              end: .bottomRight
          ),

          border: .all(
              color: CurrentTheme.theme.primaryAlt,
              width: 1.5
          )
      ),
      child: AnimatedBuilder(
        animation: _animController,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotAnim.value,
            child: Icon(
              widget.icon,
              size: 85,
              color: CurrentTheme.theme.defaultTypography,
            ),
          );
        }
      ),
    );
  }
}
