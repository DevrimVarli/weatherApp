import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/common/theme_extension';

// Error ekranı bileşeni
class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[HexColor('#2E335A'), HexColor('#1C1B33')],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                color: context.colors.surface,
                size: 48,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.surface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.surface.withValues(
                    alpha: 0.12,
                  ),
                  foregroundColor: context.colors.surface,
                  elevation: 0,
                ),
                child: Text('ui_retry'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
