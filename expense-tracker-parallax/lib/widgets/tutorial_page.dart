import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Tutorial')),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 2,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double page = 0.0;
              try {
                page = _pageController.page ??
                    _pageController.initialPage.toDouble();
              } catch (_) {}

              final pageOffset = (index - page);

              return _buildTutorialPage(
                context,
                index: index,
                textOffset: pageOffset * screenWidth * 1.5,
                buttonOffset: pageOffset * screenWidth * 2.5,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTutorialPage(
    BuildContext context, {
    required int index,
    required double textOffset,
    required double buttonOffset,
  }) {
    final isFirstPage = index == 0;
    final icon = isFirstPage ? Icons.add : Icons.swipe;
    final title = isFirstPage ? "Welcome to Expense Tracker" : "How to Delete";
    final description = isFirstPage
        ? "Please click the '+' to add a new expense."
        : "Swipe the tracked expense right or left to delete it.";
    final buttonText = isFirstPage ? "Next" : "Done";
    final onPressed = isFirstPage
        ? () => _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            )
        : () => Navigator.pop(context);

    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 30),
          Transform.translate(
            offset: Offset(textOffset, 0),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Transform.translate(
            offset: Offset(buttonOffset, 0),
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
