import 'package:flutter/material.dart';

import '../data/categories_repository.dart';

/// Displays the list of knowledge categories available in the vault.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesRepository().getCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Categories'),
      ),
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            leading: Icon(category.icon),
            title: Text(category.name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          );
        },
      ),
    );
  }
}
