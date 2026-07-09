import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';

/// The one shared bottom-safe-area convention for every screen body in
/// the app: wraps [child] so its content can never render behind the
/// Android system navigation bar / gesture inset, with a small
/// intentional breathing margin above it.
///
/// `SafeArea(top: false)` alone guarantees content is never literally
/// obscured by the system inset (the AppBar already handles the top
/// inset, so `top` stays `false` here). The extra [AppSpacing.sm]
/// margin on top of that gives the last item comfortable clearance
/// rather than sitting flush against the boundary. Do not also add
/// `MediaQuery.viewPadding.bottom` manually anywhere this widget is
/// used - that would double-count the same inset.
///
/// Use this as the direct `Scaffold.body` (or wrap the scrollable
/// content within it) on any screen whose content can scroll or could
/// grow to the bottom edge - lists, grids, or a Column with an
/// `Expanded` scrollable.
class BottomSafeArea extends StatelessWidget {
  const BottomSafeArea({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
        child: child,
      ),
    );
  }
}
