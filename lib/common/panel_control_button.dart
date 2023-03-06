import 'package:flutter/material.dart';

class PanelControlButton extends StatefulWidget {
  
  final void Function()? onTap;
  final Widget? child;

  const PanelControlButton({
    Key? key, 
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  State<PanelControlButton> createState() => _PanelControlButtonState();
}

class _PanelControlButtonState extends State<PanelControlButton> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _scaleAnimation;
  late Animation _dimAnimation;
  static const Duration duration = const Duration(milliseconds: 50);
  bool _isHovered = false;
  bool _isRunning = false;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.995).animate(_controller);
    _dimAnimation = Tween<double>(begin: 1, end: 0.995).animate(_controller);
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    forward(_) => _controller.forward();
    backward(_) => _controller.reverse();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.scale(
          filterQuality: FilterQuality.high,
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: forward,
            onExit: backward,
            child: GestureDetector(
              onTapDown: forward,
              onTapUp: backward,
              onTap: widget.onTap,
              child: InkWell(
                hoverColor: const Color.fromARGB(80, 0, 0, 0),
                onHover: (_) => setState(() => _isHovered = _),
                child: AnimatedContainer(
                  duration: duration,
                  decoration: BoxDecoration(
                    color: _isHovered ? Color.fromARGB(255, 255, 0, 0) : Colors.transparent,
                    backgroundBlendMode: BlendMode.darken,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: widget.child
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
