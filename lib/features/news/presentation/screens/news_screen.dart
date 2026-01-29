import 'package:chainiq/features/news/presentation/widgets/custom_news_tile.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 10,
        children: [
          _buildTitle(textTheme),
          _buildNewsList(),
        ],
      ),
    );
  }

  Widget _buildTitle(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Latest News',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textTheme.headlineSmall?.fontSize,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            iconSize: 20,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.settings_input_component),
          onPressed: () {},
        ),
      ],
    );
  }

  _buildNewsList() {
    return Expanded(
      child: ListView.builder(
          itemCount: 9,
          itemBuilder: (index, context) {
            return CustomNewsTile();
          }),
    );
  }
}
