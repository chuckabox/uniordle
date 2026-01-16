import 'package:uniordle/shared/game_screen_exports.dart';

class GameHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSettings;

  const GameHeader({
    super.key,
    this.onBack,
    this.onSettings,
  });

  @override
  Size get preferredSize => const Size.fromHeight(GameHeaderConstants.preferredSizeHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainBackground,
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: GameHeaderConstants.borderSideAlpha),
            width: GameHeaderConstants.borderSideWidth,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GameHeaderConstants.iconEdgePadding),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: onBack ?? () => Navigator.maybePop(context),
                ),
              ),
              const Text(
                'Uniordle',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: GameHeaderConstants.titleFontSize,
                  fontFamily: 'clashdisplay',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: onSettings ?? () {},
                ),
              ),
            ]
          )
        )
      )
    );
  }
}