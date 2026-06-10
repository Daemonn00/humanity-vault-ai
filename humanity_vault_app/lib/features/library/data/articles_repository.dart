import '../models/article.dart';

/// Provides the list of articles for each knowledge category.
///
/// This mirrors the sample articles under the repository's `knowledge/`
/// directory. No database or network access is used - the data is local
/// and static for the MVP.
class ArticlesRepository {
  static const Map<String, List<Article>> articlesByCategoryFolder = {
    'islam': [
      Article(title: 'Daily Morning and Evening Dua', category: 'Islam'),
    ],
    'survival': [
      Article(
        title: 'Water Purification Using Boiling',
        category: 'Survival',
      ),
    ],
    'medicine': [
      Article(title: 'Basic CPR', category: 'Medicine'),
    ],
  };

  List<Article> getArticles(String categoryFolder) {
    return articlesByCategoryFolder[categoryFolder] ?? const [];
  }
}
