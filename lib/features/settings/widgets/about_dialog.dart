  import 'package:uniordle/shared/exports/end_game_exports.dart';
import 'package:uniordle/shared/exports/settings_exports.dart';

  class AboutGameDialog extends StatelessWidget {
    const AboutGameDialog({super.key});

    @override
    Widget build(BuildContext context) {
      return BaseDialog(
        child: Container(
          width: 400,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAppIcon(context),
              SizedBox(height: context.r(32)),
              context.autoText("Uniordle", style: AppFonts.displayLarge),
              SizedBox(height: context.r(16)),
              _buildAuthorText(),
              SizedBox(height: context.r(8)),
              context.autoText(
                "Software Engineering Student @ UQ", 
                style: AppFonts.labelMedium.copyWith(color: AppColors.accent)
              ),
              SizedBox(height: context.r(32)),
              PrimaryButton(
                onPressed: () => showLicensePage(context: context),
                label: "LICENSES",
                color: AppColors.accent,
              ),
              SizedBox(height: context.r(16)),
              PrimaryButton(
                onPressed: () => Navigator.pop(context),
                label: "CLOSE",
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildAppIcon(BuildContext context) => CircleAvatar(
      radius: context.r(60),
      backgroundColor: AppColors.surfaceVariant,
      child: Image.asset(
        'assets/images/white_on_blue/favicon.png',
        fit: BoxFit.contain,
      ),
    );

    Widget _buildAuthorText() => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppFonts.labelLarge,
        children: [
          const TextSpan(text: "A solo project by "),
          TextSpan(
            text: "Peter",
            style: AppFonts.labelLarge.copyWith(
              fontWeight: FontWeight.bold, 
              color: AppColors.inWordColor
            ),
          ),
        ],
      ),
    );
  }