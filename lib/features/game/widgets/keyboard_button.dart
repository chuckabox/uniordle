import 'package:uniordle/shared/game_screen_exports.dart';

/// A single key used on the keyboard
/// 
/// Provides press and tap animation with darkening
class KeyboardButton extends StatefulWidget {
  const KeyboardButton({ 
    super.key,
    this.height = KeyBoardConstants.keyHeight,
    this.width = KeyBoardConstants.keyWidth,
    required this.onTap,
    required this.backgroundColor,
    this.letter,
    this.child,
    });

    final double height;
    final double width;
    final VoidCallback onTap;
    final Color backgroundColor;
    final String? letter;
    final Widget? child;

    /// Creates a delete key with icon and wider size
    factory KeyboardButton.delete({ 
      required VoidCallback onTap 
    }) =>
      KeyboardButton(
        width: KeyBoardConstants.specialKeyWidth,
        onTap: onTap,
        backgroundColor: KeyBoardConstants.keyBackground,
        child: Transform.translate(
          offset: const Offset(0, -2),
          child: const Icon(
            Icons.backspace, 
            color: Colors.white, 
            size: 22,
          ),
        ),
      );

    /// Creates an enter key with text label and wider size
    factory KeyboardButton.enter({ 
      required VoidCallback onTap,
    }) =>
      KeyboardButton(
        width: KeyBoardConstants.specialKeyWidth,
        onTap: onTap,
        backgroundColor: KeyBoardConstants.keyBackground,
        letter: 'ENTER',
        child: Transform.translate(
          offset: const Offset(0, -3),
          child: const Text(
            'ENTER',
            style: TextStyle(
              // smaller text for enter
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );

  @override
  State<KeyboardButton> createState() => _KeyboardButtonState();
}

class _KeyboardButtonState extends State<KeyboardButton> with SingleTickerProviderStateMixin{
  
  bool _isPressed = false;
  bool _isTapped = false;

  /// Handles tap animation and calls [widget.onTap]
  void _handleTap() {
    setState(() => _isTapped = true);
    Future.delayed(KeyBoardConstants.tapSpeed, () {
      if (mounted) setState(() => _isTapped = false);
    });

    widget.onTap();
  }

  /// Current scale based on press and tap state
  double get _currentScale {
    if (_isTapped) {
      return 0.95;
    }
    return _isPressed ? 0.95 : 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        KeyBoardConstants.gapPadding,
      ),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          _handleTap();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 1.0, end: _currentScale),
          duration: _isTapped
              ? KeyBoardConstants.tapSpeed
              : KeyBoardConstants.pressSpeed,
          curve: Curves.easeInOut,
          builder: (context, scale, child) => Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: KeyBoardConstants.darkenSpeed),
              height: widget.height,
              width: widget.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _isPressed || _isTapped
                    ? Color.alphaBlend(
                      Colors.black.withValues(alpha: KeyBoardConstants.darkenIntensity), 
                        widget.backgroundColor
                      )
                    : widget.backgroundColor,
                borderRadius: BorderRadius.circular(KeyBoardConstants.keyRounding),
              ),
              child: widget.child ?? Transform.translate(
                offset: const Offset(0, KeyBoardConstants.textOffset),
                child: widget.child ?? Text(
                  widget.letter ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'dm-sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}