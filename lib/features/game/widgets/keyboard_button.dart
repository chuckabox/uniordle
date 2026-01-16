import 'package:uniordle/shared/game_screen_exports.dart';
import 'package:uniordle/shared/widgets/pump_button_wrapper.dart';

/// A single key used on the keyboard
/// 
/// Provides press and tap animation with darkening
class KeyboardButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KeyBoardConstants.gapPadding),
      child: PumpButtonWrapper(
        onTap: onTap,
        pressScale: 0.95,
        enableDarken: true,
        baseColor: backgroundColor,
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: child ?? Text(
              letter ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'dm-sans',
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        )
      )
    );
  }
}
