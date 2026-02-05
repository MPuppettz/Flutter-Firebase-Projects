import 'package:flutter/material.dart';

import 'package:test_dart/widgets/new_expense.dart';
import 'package:test_dart/widgets/expenses_list/expenses_list.dart';
import 'package:test_dart/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  Map<Category, double> calculateCategoryExpenses() {
    final Map<Category, double> categoryExpenses = {
      Category.food: 0,
      Category.travel: 0,
      Category.leisure: 0,
      Category.work: 0,
    };

    for (final expense in _registeredExpenses) {
      categoryExpenses.update(
          expense.category, (value) => value + expense.amount);
    }

    return categoryExpenses;
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = Column(
        children: [
          SizedBox(
            height: 200, // Adjust height as needed
            child: BarGraph(
              values: calculateCategoryExpenses().values.toList(),
              icons: Category.values.map((e) => categoryIcons[e]!).toList(),
            ),
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: mainContent,
    );
  }
}

class BarGraph extends StatelessWidget {
  final List<double> values;
  final List<IconData> icons;

  const BarGraph({
    required this.values,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;

    final maxValue =
        values.reduce((value, element) => value > element ? value : element);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        decoration: BoxDecoration(
          color: primaryColor
              .withOpacity(0.1), // Use primary color with some opacity
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), // Rounded top-left corner
            topRight: Radius.circular(10), // Rounded top-right corner
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
            (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0), // Add horizontal padding here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150, // Adjust width as needed
                      height: 120, // Adjust height as needed
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  10.0), // Adjust the radius as needed
                              topRight: Radius.circular(
                                  10.0), // Adjust the radius as needed
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 70, // Fixed height for the bar container
                              color: Colors
                                  .transparent, // Transparent color for the container
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  10.0), // Adjust the radius as needed
                              topRight: Radius.circular(
                                  10.0), // Adjust the radius as needed
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 100 * (values[index] / maxValue),
                              color: primaryColor, // Use primary color
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(),
                    Icon(
                      icons[index],
                      size: 40, // Adjust icon size as needed
                      color: primaryColor, // Use primary color for icon
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
