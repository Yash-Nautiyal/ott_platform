import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_platform/core/common/dialog/slide_dialog.dart';
import 'package:ott_platform/core/common/settings/settings_font_card.dart';
import 'package:ott_platform/core/theme/app_typography.dart';
import 'package:ott_platform/core/theme/bloc/theme_bloc.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fonts = AppTypography.fontMap;
    final currentFont = context.watch<ThemeBloc>().state.font;
    final scrollController = ScrollController();
    return SlideDialog(
      theme: theme,
      title: 'Settings',
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SettingsFontCard(
              theme: theme,
              fonts: fonts,
              currentFont: currentFont,
              onChange:
                  (fontKey) =>
                      context.read<ThemeBloc>().add(ChangeFontEvent(fontKey)),
            ),
          ],
        ),
      ),
    );
  }
}
