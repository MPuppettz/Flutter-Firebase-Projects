import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lab08/data/dummy_data.dart';
import 'package:lab08/models/category.dart';
import 'package:lab08/services/navigation.dart';
import 'package:lab08/widgets/category_grid_item.dart';

class HomeCategoriesTab extends StatefulWidget {
  const HomeCategoriesTab({Key? key}) : super(key: key);

  @override
  State<HomeCategoriesTab> createState() => _HomeCategoriesTabState();
}

class _HomeCategoriesTabState extends State<HomeCategoriesTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700,
      ), // Reduced duration for faster animation
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final nav = Provider.of<NavigationService>(context, listen: false);
    nav.goMealsOnCategory(categoryId: category.id);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        final category = dummyCategories.values.elementAt(index);
        final rowIndex = (index / 2).floor(); // Get row index
        final delay = Duration(
          milliseconds: 100 * rowIndex,
        ); // Staggered delay based on row index

        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 4.5), // Start further off-screen
                end: const Offset(0, 0), // Slide up to show
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    delay.inMilliseconds / 1000, // Convert delay to seconds
                    1.0,
                    curve: Curves.easeInOut,
                  ),
                ),
              ),
              child: CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              ),
            );
          },
        );
      },
    );
  }
}
