import 'package:flutter/material.dart';

class VoiceButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String tooltip;
  final bool isPlaying;
  final double size;

  const VoiceButton({
    Key? key,
    required this.onPressed,
    this.tooltip = 'Play Voice',
    this.isPlaying = false,
    this.size = 48.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isPlaying ? Icons.stop : Icons.record_voice_over,
        size: size,
        color: isPlaying ? Colors.red : Theme.of(context).primaryColor,
      ),
      tooltip: tooltip,
    );
  }
} 