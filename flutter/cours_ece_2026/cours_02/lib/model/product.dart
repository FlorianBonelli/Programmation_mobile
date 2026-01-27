// ignore_for_file: constant_identifier_names
class Product {
  final String barcode;
  final String? name;
  final String? altName;
  final String? picture;
  final String? quantity;
  final List<String>? brands;
  final List<String>? manufacturingCountries;
  final ProductNutriScore? nutriScore;
  final ProductNutriScoreLevels? nutriScoreLevels;
  final ProductNovaScore? novaScore;
  final ProductGreenScore? greenScore;
  final List<String>? ingredients;

  // Eg: "Sucre, <span class=\"allergen\">gluten de blé</span>"
  final String? ingredientsWithAllergens;
  final List<String>? traces;
  final List<String>? allergens;
  final Map<String, String>? additives;
  final NutrientLevels? nutrientLevels;
  final NutritionFacts? nutritionFacts;
  final bool? ingredientsFromPalmOil;
  final ProductAnalysis? containsPalmOil;
  final ProductAnalysis? isVegan;
  final ProductAnalysis? isVegetarian;

  Product({
    required this.barcode,
    this.name,
    this.altName,
    this.picture,
    this.quantity,
    this.brands,
    this.manufacturingCountries,
    this.nutriScore,
    this.nutriScoreLevels,
    this.novaScore,
    this.greenScore,
    this.ingredients,
    this.ingredientsWithAllergens,
    this.traces,
    this.allergens,
    this.additives,
    this.nutrientLevels,
    this.nutritionFacts,
    this.ingredientsFromPalmOil,
    this.containsPalmOil,
    this.isVegan,
    this.isVegetarian,
  });
}

class NutritionFacts {
  final String servingSize;
  final Nutriment? calories;
  final Nutriment? fat;
  final Nutriment? saturatedFat;
  final Nutriment? carbohydrate;
  final Nutriment? sugar;
  final Nutriment? fiber;
  final Nutriment? proteins;
  final Nutriment? sodium;
  final Nutriment? salt;
  final Nutriment? energy;

  NutritionFacts({
    required this.servingSize,
    this.calories,
    this.fat,
    this.saturatedFat,
    this.carbohydrate,
    this.sugar,
    this.fiber,
    this.proteins,
    this.sodium,
    this.salt,
    this.energy,
  });
}

class Nutriment {
  final String unit;
  final dynamic perServing;
  final dynamic per100g;

  Nutriment({required this.unit, this.perServing, this.per100g});
}

class NutrientLevels {
  final String? salt;
  final String? saturatedFat;
  final String? sugars;
  final String? fat;

  NutrientLevels({this.salt, this.saturatedFat, this.sugars, this.fat});
}

class ProductNutriScoreLevels {
  final ProductNutriScoreLevel? energy;
  final ProductNutriScoreLevel? fiber;
  final ProductNutriScoreLevel? fruitsVegetablesLegumes;
  final ProductNutriScoreLevel? proteins;
  final ProductNutriScoreLevel? salt;
  final ProductNutriScoreLevel? saturatedFat;
  final ProductNutriScoreLevel? sugars;

  ProductNutriScoreLevels({
    required this.energy,
    required this.fiber,
    required this.fruitsVegetablesLegumes,
    required this.proteins,
    required this.salt,
    required this.saturatedFat,
    required this.sugars,
  });
}

class ProductNutriScoreLevel {
  final double points;
  final double maxPoints;
  final String unit;
  final double value;
  final ProductNutriScoreLevelType type;

  ProductNutriScoreLevel({
    required this.points,
    required this.maxPoints,
    required this.unit,
    required this.value,
    required this.type,
  });
}

enum ProductNutriScoreLevelType { positive, negative, unknown }

enum ProductNutriScore { A, B, C, D, E, unknown }

enum ProductNovaScore { group1, group2, group3, group4, unknown }

enum ProductGreenScore { A, APlus, B, C, D, E, F, unknown }

enum ProductAnalysis {
  yes,
  no,
  maybe;

  static ProductAnalysis fromString(String? analysis) {
    return switch (analysis) {
      'yes' => ProductAnalysis.yes,
      'no' => ProductAnalysis.no,
      'maybe' => ProductAnalysis.maybe,
      _ => ProductAnalysis.maybe,
    };
  }
}

Product generateProduct() => Product(
  barcode: '3083680085304',
  name: 'Petits pois et carottes',
  altName: 'Petits pois et carottes à l\'étuvée avec garniture',
  picture:
      'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  quantity: '400g',
  brands: ['Cassegrain'],
  manufacturingCountries: ['France'],
  nutriScore: ProductNutriScore.A,
  novaScore: ProductNovaScore.group1,
  greenScore: ProductGreenScore.B,
  ingredients: [
    'Petits pois 41%',
    'carottes 22%',
    'Eau',
    'Sucre',
    'Garniture (2,5 %)',
    'Salade',
    'Oignon grelot',
    'Sel',
    'Arômes naturels',
  ],
  ingredientsWithAllergens:
      'Petits pois 41%, carottes 22%, Eau, Sucre, Garniture (2,5 %) : salade, oignon grelot, Sel, Arômes naturels.',
  traces: [],
  allergens: [],
  additives: {},
  nutriScoreLevels: ProductNutriScoreLevels(
    energy: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 10,
      unit: 'kJ',
      value: 293,
      type: ProductNutriScoreLevelType.positive,
    ),
    saturatedFat: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 10,
      unit: 'g',
      value: 0.1,
      type: ProductNutriScoreLevelType.positive,
    ),
    sugars: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 15,
      unit: 'g',
      value: 5.2,
      type: ProductNutriScoreLevelType.positive,
    ),
    proteins: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 7,
      unit: 'g',
      value: 4.2,
      type: ProductNutriScoreLevelType.positive,
    ),
    fiber: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 5,
      unit: 'g',
      value: 5.2,
      type: ProductNutriScoreLevelType.positive,
    ),
    salt: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 20,
      unit: 'g',
      value: 0.75,
      type: ProductNutriScoreLevelType.positive,
    ),
    fruitsVegetablesLegumes: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 5,
      unit: '%',
      value: 63,
      type: ProductNutriScoreLevelType.positive,
    ),
  ),
  nutrientLevels: NutrientLevels(
    salt: 'Low',
    saturatedFat: 'Low',
    sugars: 'Low',
    fat: 'Low',
  ),
  nutritionFacts: NutritionFacts(
    servingSize: '100g',
    calories: Nutriment(unit: 'kcal', perServing: 70, per100g: 70),
    fat: Nutriment(unit: 'g', perServing: 0.6, per100g: 0.6),
    saturatedFat: Nutriment(unit: 'g', perServing: 0.1, per100g: 0.1),
    carbohydrate: Nutriment(unit: 'g', perServing: 7.4, per100g: 7.4),
    sugar: Nutriment(unit: 'g', perServing: 5.2, per100g: 5.2),
    fiber: Nutriment(unit: 'g', perServing: 5.2, per100g: 5.2),
    proteins: Nutriment(unit: 'g', perServing: 4.2, per100g: 4.2),
    sodium: Nutriment(unit: 'mg', perServing: 300, per100g: 300),
    salt: Nutriment(unit: 'g', perServing: 0.75, per100g: 0.75),
  ),
);
