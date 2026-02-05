import { ai } from "../config";
import { z } from "genkit";
import { recipieRetriever } from "../retriever";
import { Recipe, RecipeSchema } from "../type";

export const retrieveRecipeFlow = ai.defineFlow({
  name: 'retrieveRecipeFlow',
  inputSchema: z.string(),
  outputSchema: z.array(RecipeSchema),
}, async (ingredients) => {
  const recipes = await ai.run(
    'Retrieve matching recipes',
    async () => {
      try {
        const docs = await ai.retrieve({
          retriever: recipieRetriever,
          query: ingredients,
          options: {
            limit: 5, // Return 5 recipes
          },
        });
        
        return docs.map((doc) => {
          const data = doc.toJSON();
          const recipe: Recipe = {
            title: '',
            directions: '',
            ingredients: '',
            ...data.metadata,
          };
          delete recipe.ingredient_embedding;
          recipe.ingredients = data.content[0].text!;
          return recipe;
        });
      } catch (error) {
        console.error(error);
        return [];
      }
    }
  );

  return recipes;
});