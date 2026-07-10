import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../../library/data/articles_repository.dart';
import '../../library/data/categories_repository.dart';
import '../../library/models/article.dart';
import '../../library/presentation/article_detail_screen.dart';
import '../../library/presentation/search_screen.dart';
import '../data/ask_vault_excerpt.dart';
import '../data/ask_vault_safety.dart';
import '../data/ask_vault_search.dart';

/// A single-turn, retrieval-only surface over the Vault: the user asks a
/// question, and the screen shows up to [AskVaultSearch.maxResults]
/// verbatim article summaries that answer it, each linking to its full
/// source article - or a plain message when nothing in the Vault
/// supports an answer. This is not a chatbot: there is no conversation
/// history, no follow-up suggestions, and no generated text - every
/// submission replaces the prior result outright.
class AskVaultScreen extends StatefulWidget {
  const AskVaultScreen({super.key});

  @override
  State<AskVaultScreen> createState() => _AskVaultScreenState();
}

class _AskVaultScreenState extends State<AskVaultScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Article>? _results;

  /// The exact query text that produced [_results] - kept separate from
  /// [_controller]'s live text so that editing the field after a
  /// submission (without resubmitting) can never desync the query used
  /// for excerpt/highlight term resolution from the results actually
  /// shown.
  String _submittedQuery = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final query = _controller.text;
    setState(() {
      _submittedQuery = query;
      _results = AskVaultSearch.search(
        ArticlesRepository().getAllArticles(),
        query,
      );
    });
  }

  Color _colorForCategory(String categoryName) {
    for (final category in CategoriesRepository().getCategories()) {
      if (category.name == categoryName) return category.color;
    }
    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;

    return Scaffold(
      appBar: AppBar(title: const Text('Ask the Vault')),
      body: BottomSafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Ask a question about the Vault',
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Ask'),
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: results == null
                    ? const _AskVaultIdleState()
                    : results.isEmpty
                    ? const _AskVaultNoResultState()
                    : ListView.separated(
                        itemCount: results.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(
                              height: AppSpacing.sm + AppSpacing.xs,
                            ),
                        itemBuilder: (context, index) {
                          final article = results[index];
                          return _AskVaultResultTile(
                            article: article,
                            color: _colorForCategory(article.category),
                            submittedQuery: _submittedQuery,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AskVaultIdleState extends StatelessWidget {
  const _AskVaultIdleState();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.help_outline, size: 48, color: colorScheme.outline),
            const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
            Text(
              'Ask a question to find exact matching passages already '
              'written in the Vault.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _AskVaultNoResultState extends StatelessWidget {
  const _AskVaultNoResultState();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 48, color: colorScheme.outline),
            const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
            Text(
              'I could not find a supported answer in this Vault.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: const Text('Search Knowledge instead'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AskVaultResultTile extends StatelessWidget {
  const _AskVaultResultTile({
    required this.article,
    required this.color,
    required this.submittedQuery,
  });

  final Article article;
  final Color color;
  final String submittedQuery;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isSafety = isSafetyClassified(article);
    final terms = resolveQueryTerms(article, submittedQuery);
    final excerpt = selectExcerpt(
      article,
      terms,
      isSafetyClassified: isSafety,
    );
    final isContentPassage =
        excerpt.source == AskVaultExcerptSource.contentParagraph;
    final bodyStyle = textTheme.bodyMedium;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color, width: 3)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title, style: textTheme.titleMedium),
              const SizedBox(height: 2),
              Text(
                article.category,
                style: textTheme.bodySmall
                    ?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text.rich(
                TextSpan(
                  children: buildHighlightedSpans(
                    text: excerpt.text,
                    terms: terms,
                    baseStyle: bodyStyle,
                    highlightStyle: bodyStyle?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Exact source text',
                style: textTheme.labelSmall
                    ?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              if (isContentPassage) ...[
                const SizedBox(height: 2),
                Text(
                  'Best-matching passage (not the full article)',
                  style: textTheme.labelSmall
                      ?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ],
              if (isSafety) ...[
                const SizedBox(height: 2),
                Text(
                  'Safety-related - read the full article before acting',
                  style: textTheme.labelSmall
                      ?.copyWith(color: AppColors.emergencyPrimary),
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetailScreen(article: article),
                      ),
                    );
                  },
                  child: const Text('Open source'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Splits [text] into [TextSpan]s so that every whole-word, case-
/// insensitive occurrence of a term in [terms] renders with
/// [highlightStyle] and everything else renders with [baseStyle] -
/// concatenating every span's text always reproduces [text] exactly, so
/// highlighting can never add, remove, reorder, or alter a character.
/// Word boundaries (`\b`) mean a term such as "art" never highlights
/// inside an unrelated word such as "start".
List<TextSpan> buildHighlightedSpans({
  required String text,
  required List<String> terms,
  required TextStyle? baseStyle,
  required TextStyle? highlightStyle,
}) {
  final cleanTerms = terms
      .map((term) => term.trim())
      .where((term) => term.isNotEmpty)
      .toSet()
      .toList();
  if (cleanTerms.isEmpty) {
    return [TextSpan(text: text, style: baseStyle)];
  }

  final pattern = RegExp(
    r'\b(' + cleanTerms.map(RegExp.escape).join('|') + r')\b',
    caseSensitive: false,
  );

  final spans = <TextSpan>[];
  var lastEnd = 0;
  for (final match in pattern.allMatches(text)) {
    if (match.start > lastEnd) {
      spans.add(
        TextSpan(text: text.substring(lastEnd, match.start), style: baseStyle),
      );
    }
    spans.add(
      TextSpan(text: text.substring(match.start, match.end), style: highlightStyle),
    );
    lastEnd = match.end;
  }
  if (lastEnd < text.length) {
    spans.add(TextSpan(text: text.substring(lastEnd), style: baseStyle));
  }

  return spans;
}
