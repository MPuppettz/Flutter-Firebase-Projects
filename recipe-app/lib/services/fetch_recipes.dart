import 'package:cloud_functions/cloud_functions.dart';

// TODO: calling your retrieveRecipeFlow
/* Hints:
  You can check how recipe_page.dart calling retrieveRecipeFlow.
  Note that the type of return value is crucial.
*/
Future<List<Map<String, dynamic>>> retrieveRecipes(String ingredients) async {
  try {
    final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
      'retrieveRecipes',
    );

    final response = await callable.call(ingredients);
    final List<dynamic> data = response.data;
    return data.map((item) => Map<String, dynamic>.from(item)).toList();
  } catch (e) {
    print("Error fetching retrieved recipes: $e");
    throw Exception("Failed to fetch recipes");
  }
}
