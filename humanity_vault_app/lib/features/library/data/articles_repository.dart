import '../models/article.dart';

/// Provides the list of articles for each knowledge category.
///
/// This mirrors the sample articles under the repository's `knowledge/`
/// directory. No database or network access is used - the data is local
/// and static for the MVP.
class ArticlesRepository {
  static const Map<String, List<Article>> articlesByCategoryFolder = {
    'islam': [
      Article(
        title: 'Daily Morning and Evening Dua',
        category: 'Islam',
        summary:
            'A collection of short duas recommended to be recited in the '
            'morning and evening for protection, gratitude, and remembrance '
            'of Allah.',
        content:
            'Reciting morning and evening duas is a Sunnah practice that '
            'helps maintain a connection with Allah throughout the day. '
            'These duas typically include seeking protection from harm, '
            'expressing gratitude, and asking for guidance and well-being '
            'for oneself and one\'s family.',
        benefits: [
          'Provides spiritual protection throughout the day',
          'Builds a daily habit of remembrance (dhikr)',
          'Brings peace of mind and gratitude',
        ],
        sources: ['Islamic Primary Source'],
      ),
    ],
    'survival': [
      Article(
        title: 'Water Purification Using Boiling',
        category: 'Survival',
        summary:
            'Boiling is one of the most reliable methods to make water safe '
            'to drink by killing disease-causing organisms such as '
            'bacteria, viruses, and parasites.',
        content:
            'To purify water by boiling, bring water to a rolling boil for '
            'at least one minute (three minutes at higher altitudes). Allow '
            'the water to cool before drinking. Boiling does not remove '
            'chemical contaminants or sediment, so water should be filtered '
            'or allowed to settle before boiling when possible.',
        benefits: [
          'Kills bacteria, viruses, and parasites',
          'Requires no special equipment beyond a heat source and container',
          'One of the most reliable emergency purification methods',
        ],
        sources: ['WHO', 'Government Disaster Guide'],
      ),
    ],
    'medicine': [
      Article(
        title: 'Basic CPR',
        category: 'Medicine',
        summary:
            'Cardiopulmonary resuscitation (CPR) is an emergency procedure '
            'used to manually preserve brain function until further '
            'measures restore spontaneous blood circulation and breathing '
            'in a person who is in cardiac arrest.',
        content:
            'To perform basic CPR, place the heel of one hand on the center '
            'of the chest, place the other hand on top, and push hard and '
            'fast at a rate of 100 to 120 compressions per minute, allowing '
            'the chest to fully recoil between compressions. Continue until '
            'emergency help arrives or the person shows signs of life.',
        benefits: [
          'Can double or triple a cardiac arrest victim\'s chance of survival',
          'Helps maintain blood flow to vital organs until help arrives',
          'Can be performed without specialized equipment',
        ],
        sources: ['Medical Source'],
      ),
    ],
  };

  List<Article> getArticles(String categoryFolder) {
    return articlesByCategoryFolder[categoryFolder] ?? const [];
  }
}
