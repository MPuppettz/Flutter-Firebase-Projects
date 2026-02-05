import 'package:cloud_functions/cloud_functions.dart';

// TODO: calling your customRecipeFlow
/* Hints:
  You can check how food_page.dart calling customRecipesFlow.
  Note that the type of return value is crucial.
*/

Future<Map<String, dynamic>> fetchCustomRecipe(
  String title,
  String originalIngredients,
  String directions,
  String userIngredients,
) async {
  try {
    final callable = FirebaseFunctions.instance.httpsCallable('customRecipe');

    final response = await callable.call({
      'suggestRecipe': {
        'title': title,
        'ingredients': originalIngredients,
        'directions': directions,
      },
      'ingredients': userIngredients,
    });

    // Directly cast the response data to Map
    final Map<String, dynamic> data = response.data as Map<String, dynamic>;

    // Validate required fields exist
    if (data['recipe'] == null ||
        data['customRecipeImage'] == null ||
        data['originRecipeImage'] == null) {
      throw Exception('Incomplete response from server');
    }

    // Extract the recipe data
    final recipe = data['recipe'] as Map<String, dynamic>;
    final customImage = data['customRecipeImage'] as Map<String, dynamic>;
    final originImage = data['originRecipeImage'] as Map<String, dynamic>;

    // Return structured data with null checks
    return {
      'recipe': {
        'title': recipe['title']?.toString() ?? title,
        'ingredients': recipe['ingredients']?.toString() ?? originalIngredients,
        'directions': recipe['directions']?.toString() ?? directions,
      },
      'customRecipeImage': {'url': customImage['url']?.toString() ?? ''},
      'originRecipeImage': {'url': originImage['url']?.toString() ?? ''},
    };
  } on FirebaseFunctionsException catch (e) {
    print('Cloud Function error: ${e.code} - ${e.message}');
    throw Exception('Server error: ${e.details ?? e.message}');
  } catch (e) {
    print('Error in fetchCustomRecipe: $e');
    throw Exception('Failed to process custom recipe: $e');
  }
}
