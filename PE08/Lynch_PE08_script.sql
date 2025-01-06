-- Lynch, Connor
-- ISTE230, Fall 2024
-- PE08

-- #1
SELECT name AS 'Recipe Name' FROM recipe
	WHERE source = 'Mom';

-- #2
SELECT recipe.name FROM recipe
	JOIN nutrition USING (recipeID)
	WHERE unit = 'calories'
	AND quantity <= 800;

-- #3
SELECT ingredients.name AS 'Ingredient Name', quantity FROM recipe
	JOIN ingredientlist USING (recipeID)
	JOIN ingredients USING (IngredientID)
	WHERE recipe.name LIKE 'Beef Parmesan%'
	ORDER BY ingredients.name DESC;

-- #4
SELECT DISTINCT recipe.name FROM recipe WHERE recipeID NOT IN
	(SELECT recipeID FROM ingredientlist JOIN recipe USING (recipeID)
	WHERE ingredientID NOT IN
		(SELECT ingredientID FROM ingredients JOIN ingredientlist USING (ingredientID)
		WHERE type NOT IN ('beef', 'pork', 'chicken', 'lamb')
		)
	)
	ORDER BY recipe.name DESC;
	
-- #5
SELECT DISTINCT recipe.name AS Recipe_Name, nutrition.quantity AS QTY, nutrition.name FROM recipe
	JOIN nutrition USING (recipeID)
	WHERE nutrition.name = 'calories'
	AND nutrition.quantity <= 1200
	AND recipe.recipeID IN
	(SELECT recipeID FROM ingredientlist JOIN recipe USING (recipeID)
	WHERE ingredientID NOT IN
		(SELECT ingredientID FROM ingredients JOIN ingredientlist USING (ingredientID)
		WHERE type NOT IN ('beef', 'chicken')
		)
	);
	
-- #6
SELECT DISTINCT recipe.name AS Recipe_Name, nutrition.quantity AS QTY, nutrition.name AS Nutrition_Name FROM recipe
	JOIN nutrition USING (recipeID)
	WHERE (recipe.name LIKE 'A%' OR recipe.name LIKE 'B%' OR recipe.name LIKE 'C%')
	AND nutrition.name = 'calories'
	ORDER BY recipe.name;