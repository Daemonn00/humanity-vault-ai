import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../../terrain/data/terrain_registry.dart';
import '../data/emergency_repository.dart';
import 'emergency_category_screen.dart';

/// Displays the Emergency Mode topic grid for fast access to
/// life-saving knowledge.
///
/// A terrain may optionally be selected to reorder topics by relevance;
/// selection is session-only (in-memory) and resets when this screen is
/// closed or the app restarts. With no terrain selected, topic order is
/// unchanged from the baseline.
class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  String? _selectedTerrainId;

  @override
  Widget build(BuildContext context) {
    final baseTopics = EmergencyRepository().getTopics();
    final topics = TerrainRegistry.reorderTopicsForTerrain(
      baseTopics,
      _selectedTerrainId,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Mode')),
      body: BottomSafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenPadding,
                AppSpacing.sm,
                AppSpacing.screenPadding,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terrain — optional',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      for (final terrain in TerrainRegistry.terrains)
                        ChoiceChip(
                          label: Text(terrain.displayName),
                          selected: _selectedTerrainId == terrain.id,
                          selectedColor: AppColors.emergencyPrimary.withValues(
                            alpha: 0.28,
                          ),
                          checkmarkColor: AppColors.emergencyPrimary,
                          labelStyle: TextStyle(
                            color: _selectedTerrainId == terrain.id
                                ? AppColors.emergencyPrimary
                                : AppColors.textPrimary,
                            fontWeight: _selectedTerrainId == terrain.id
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                          side: BorderSide(
                            color: _selectedTerrainId == terrain.id
                                ? AppColors.emergencyPrimary
                                : AppColors.emergencySecondary,
                            width: _selectedTerrainId == terrain.id ? 1.5 : 1.0,
                          ),
                          onSelected: (isSelected) {
                            setState(() {
                              _selectedTerrainId = isSelected
                                  ? terrain.id
                                  : null;
                            });
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(AppSpacing.screenPadding),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSpacing.md,
                  crossAxisSpacing: AppSpacing.md,
                  childAspectRatio: 1.3,
                ),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  return Card(
                    color: AppColors.emergencySecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSpacing.cardRadius,
                      ),
                      side: const BorderSide(color: AppColors.emergencyPrimary),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                        AppSpacing.cardRadius,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                EmergencyCategoryScreen(topic: topic),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              topic.icon,
                              size: 44,
                              color: AppColors.emergencyPrimary,
                            ),
                            const SizedBox(
                              height: AppSpacing.sm + AppSpacing.xs,
                            ),
                            Flexible(
                              child: Text(
                                topic.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
