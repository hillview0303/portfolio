import 'package:flutter/material.dart';
import 'dart:async';

class TypingAnimationText extends StatefulWidget {
  final List<String> texts;
  final TextStyle style;
  final Duration typingSpeed;
  final Duration deletingSpeed;
  final Duration pauseDuration;
  final Duration cursorBlinkSpeed;
  final Color cursorColor;
  final Duration startDelay;

  const TypingAnimationText({
    super.key,
    required this.texts,
    required this.style,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.deletingSpeed = const Duration(milliseconds: 50),
    this.pauseDuration = const Duration(milliseconds: 2000),
    this.cursorBlinkSpeed = const Duration(milliseconds: 500),
    Color? cursorColor,
    this.startDelay = const Duration(milliseconds: 500),
  }) : cursorColor = cursorColor ?? const Color(0xFF89FF69);

  @override
  State<TypingAnimationText> createState() => _TypingAnimationTextState();
}

class _TypingAnimationTextState extends State<TypingAnimationText> {
  String _displayedText = '';
  bool _showCursor = true;
  Timer? _animationTimer;
  Timer? _cursorTimer;
  int _currentIndex = 0;
  int _currentTextIndex = 0;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(widget.startDelay, () {
      if (!mounted) return;
      _startTypingCycle();
      _startCursorBlink();
    });
  }

  void _startTypingCycle() {
    _animationTimer = Timer.periodic(
      _isDeleting ? widget.deletingSpeed : widget.typingSpeed,
          (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        setState(() {
          String currentText = widget.texts[_currentTextIndex];

          if (!_isDeleting) {
            if (_currentIndex < currentText.length) {
              _currentIndex++;
              _displayedText = currentText.substring(0, _currentIndex);
            } else {
              timer.cancel();
              Future.delayed(widget.pauseDuration, () {
                if (!mounted) return;
                _isDeleting = true;
                _startTypingCycle();
              });
            }
          } else {
            if (_currentIndex > 0) {
              _currentIndex--;
              _displayedText = currentText.substring(0, _currentIndex);
            } else {
              timer.cancel();
              _isDeleting = false;
              _currentTextIndex = (_currentTextIndex + 1) % widget.texts.length;
              Future.delayed(Duration(milliseconds: 500), () {
                if (!mounted) return;
                _startTypingCycle();
              });
            }
          }
        });
      },
    );
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(widget.cursorBlinkSpeed, (timer) {
      if (mounted) {
        setState(() {
          _showCursor = !_showCursor;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          _displayedText,
          style: widget.style,
        ),
        AnimatedOpacity(
          opacity: _showCursor ? 1.0 : 0.0,
          duration: Duration(milliseconds: 100),
          child: Container(
            width: 2,
            height: 18,
            margin: EdgeInsets.only(left: 2, bottom: 3),
            decoration: BoxDecoration(
              color: widget.cursorColor,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ],
    );
  }
}