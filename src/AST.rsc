module AST

import String;

data ARecipe(loc src = |tmp:///|)
	= recipe(str recipe_name,
			 AYield yield,
			 AServings servings,
			 list[AIngredient] ingredients,
			 list[AInstruction] instructions);

data AYield(loc src = |tmp:///|)
	= yield(ANumberOrRange val, str text)
	| yield_not_available()
	;

data AServings(loc src = |tmp:///|)
	= servings(ANumberOrRange val)
	| servings_not_available()
	;

data AIngredient(loc src = |tmp:///|)
	= ingredient(AQuantity quantity,
				 ADescription description,
				 APreparation preparation);

data AQuantity(loc src = |tmp:///|)
	= quantity(ANumberOrRange val, AUnit unit)
	| count(ANumberOrRange val)
	| quantity_not_available()
	;

data ANumberOrRange(loc src = |tmp:///|)
	= number(AExactValue val)
	| range(AExactValue lower, AExactValue upper)
	;

data AExactValue(loc src = |tmp:///|)
	= sole_integral(ANaturalNumber nat)
	| mixed(ANaturalNumber nat, AFraction frac)
	| sole_fraction(AFraction frac);
	
data AFraction(loc src = |tmp:///|)
	= fraction(ANaturalNumber \num, ANaturalNumber den);

data ANaturalNumber(loc src = |tmp:///|)
	= \int(int val);

data AUnit(loc src = |tmp:///|)
	= unit(str name);

data ADescription(loc src = |tmp:///|)
	= description(str pretext,
				  AIngredientDef ingredient_def,
				  str posttext);

data AIngredientDef(loc src = |tmp:///|)
	= ingredient_def(str name);

data APreparation(loc src = |tmp:///|)
	= preparation(list[APreparationWord] words)
	| preparation_not_available()
	;

data APreparationWord(loc src = |tmp:///|)
	= prep_proza(str text)
	| prep_temp(ATemperature temp)
	| prep_time(ATime time)
	;

data ATemperature(loc src = |tmp:///|)
	= temperature(ANumberOrRange val, str unit);

data ATime(loc src = |tmp:///|)
	= time(ANumberOrRange val, str unit);

// Instruction specification

data AInstruction(loc src = |tmp:///|)
	= instruction(list[AWord] words);

data AWord(loc src = |tmp:///|)
	= proza(str text)
	| ref(AIngredientRef ingredient_ref)
	| def(AIngredientDef ingredient_def)
	| temp(ATemperature temp)
	| time(ATime time)
	;

data AIngredientRef(loc src = |tmp:///|)
	= ingredient_ref(str name);


str pretty_print(ANumberOrRange n)
{
	if (n is number)
	{
		return pretty_print(n.val);
	}
	
	if (n is range)
	{
		return pretty_print(n.lower) + " - " + pretty_print(n.upper);
	}
}

str pretty_print(AExactValue e)
{
	if (e is mixed)
	{
		return pretty_print(e.nat) + " " + pretty_print(e.frac);
	}
	
	if (e is sole_integral)
	{
		return pretty_print(e.nat);
	}
	
	if (e is sole_fraction)
	{
		return pretty_print(e.frac);
	}
}

str pretty_print(ANaturalNumber n)
{
	return "<n.val>";
}

str pretty_print(AFraction f)
{
	return pretty_print(f.\num) + "/" + pretty_print(f.den);
}

str pretty_print(ADescription d)
{
	return "<d.pretext>" + "<d.ingredient_def.name>" + "<d.posttext>";
}
