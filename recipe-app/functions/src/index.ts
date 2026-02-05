// functions/src/index.ts
import { onCallGenkit } from 'firebase-functions/https';
import { customRecipeFlow } from './flow/customRecipe';
import { retrieveRecipeFlow } from './flow/retrieveRecipe';

export const customRecipe = onCallGenkit(customRecipeFlow);
export const retrieveRecipes = onCallGenkit(retrieveRecipeFlow);