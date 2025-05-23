import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/rout/routes.dart';
import '../../data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryTitle = Text(
      category.title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );

    final categoryImage = ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: CachedNetworkImage(
        imageUrl: category.image,
        width: category.main ? 356 : 160,
        height: category.main ? 150 : 145,
        fit: BoxFit.cover,
      ),
    );

    return Center(
      child: GestureDetector(
        onTap: () => context.push(Routes.categoryDetail, extra: category),
        child: Column(
          spacing: category.main ? 3 : 6,
          children: [
            category.main ? categoryTitle : categoryImage,
            category.main ? categoryImage : categoryTitle,
          ],
        ),
      ),
    );
  }
}
