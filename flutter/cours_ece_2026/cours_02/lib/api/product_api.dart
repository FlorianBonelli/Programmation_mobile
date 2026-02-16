import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:formation_flutter/model/product.dart';

part 'product_api.g.dart';

@RestApi(baseUrl: 'https://api.formation-flutter.fr/v2/')
abstract class ProductRestClient {
  factory ProductRestClient(Dio dio, {String baseUrl}) = _ProductRestClient;

  @GET('getProduct')
  Future<ProductAPIEntity> getProduct(@Query('barcode') String barcode);
}


@JsonSerializable()
class ProductAPIEntity {
  ProductAPIEntity(this.response, this.error);

  factory ProductAPIEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductAPIEntityFromJson(json);
  ProductAPIResponseEntity? response;
  dynamic error;

  Map<String, dynamic> toJson() => _$ProductAPIEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseEntity {
  ProductAPIResponseEntity(
    this.name,
    this.altName,
    this.barcode,
    this.pictures,
    this.quantity,
    this.brands,
    this.stores,
    this.countries,
    this.manufacturingCountries,
    this.nutriScore,
    this.novaScore,
    this.ecoScore,
    this.ecoScoreGrade,
    this.nutritionScore,
    this.ingredients,
    this.nutrientLevels,
    this.nutritionFacts,
    this.traces,
    this.additives,
    this.allergens,
    this.packaging,
    this.analysis,
  );

  factory ProductAPIResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductAPIResponseEntityFromJson(json);
  String? name;
  String? altName;
  String barcode;
  ProductAPIResponsePicturesEntity? pictures;
  String? quantity;
  List<String>? brands;
  List<String>? stores;
  List<String>? countries;
  List<String>? manufacturingCountries;
  String? nutriScore;
  int? novaScore;
  int? ecoScore;
  String? ecoScoreGrade;
  int? nutritionScore;
  ProductAPIResponseIngredientsEntity? ingredients;
  ProductAPIResponseNutrientLevelsEntity? nutrientLevels;
  ProductAPIResponseNutritionFacts? nutritionFacts;
  ProductAPIResponseTracesEntity? traces;
  Map<String, String>? additives;
  ProductAPIResponseAllergensEntity? allergens;
  List<String>? packaging;
  ProductAPIResponseAnalysisEntity? analysis;

  Map<String, dynamic> toJson() => _$ProductAPIResponseEntityToJson(this);

  Product toProduct() => Product(
    barcode: barcode,
    name: name,
    altName: altName,
    picture: pictures?.front,
    quantity: quantity,
    brands: brands,
    manufacturingCountries: manufacturingCountries,
    nutriScore: switch (nutriScore) {
      'A' => ProductNutriScore.A,
      'B' => ProductNutriScore.B,
      'C' => ProductNutriScore.C,
      'D' => ProductNutriScore.D,
      'E' => ProductNutriScore.E,
      _ => ProductNutriScore.unknown,
    },
    novaScore: switch (novaScore) {
      1 => ProductNovaScore.group1,
      2 => ProductNovaScore.group2,
      3 => ProductNovaScore.group3,
      4 => ProductNovaScore.group4,
      _ => ProductNovaScore.unknown,
    },
    greenScore: switch (ecoScoreGrade) {
      'A' => ProductGreenScore.A,
      'A+' => ProductGreenScore.APlus,
      'B' => ProductGreenScore.B,
      'C' => ProductGreenScore.C,
      'D' => ProductGreenScore.D,
      'E' => ProductGreenScore.E,
      'F' => ProductGreenScore.F,
      _ => ProductGreenScore.unknown,
    },
    ingredients: ingredients?.list,
    traces: traces?.list,
    allergens: allergens?.list,
    additives: additives,
    nutrientLevels: NutrientLevels(
      salt: nutrientLevels?.salt?.level,
      saturatedFat: nutrientLevels?.saturatedFat?.level,
      sugars: nutrientLevels?.sugars?.level,
      fat: nutrientLevels?.fat?.level,
    ),
    ingredientsFromPalmOil:
        ProductAnalysis.fromString(analysis?.palmOil) == ProductAnalysis.yes,
    isVegan: ProductAnalysis.fromString(analysis?.vegan),
    isVegetarian: ProductAnalysis.fromString(analysis?.vegetarian),
    nutritionFacts: nutritionFacts?.servingSize != null
        ? NutritionFacts(
            servingSize: nutritionFacts!.servingSize!,
            calories: nutritionFacts?.calories?.toNutriment(),
            fat: nutritionFacts?.fat?.toNutriment(),
            saturatedFat: nutritionFacts?.saturatedFat?.toNutriment(),
            carbohydrate: nutritionFacts?.carbohydrate?.toNutriment(),
            sugar: nutritionFacts?.sugar?.toNutriment(),
            fiber: nutritionFacts?.fiber?.toNutriment(),
            proteins: nutritionFacts?.proteins?.toNutriment(),
            sodium: nutritionFacts?.sodium?.toNutriment(),
            salt: nutritionFacts?.salt?.toNutriment(),
            energy: nutritionFacts?.energy?.toNutriment(),
          )
        : null,
  );
}

@JsonSerializable()
class ProductAPIResponsePicturesEntity {
  ProductAPIResponsePicturesEntity(
    this.product,
    this.front,
    this.ingredients,
    this.nutrition,
  );

  factory ProductAPIResponsePicturesEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponsePicturesEntityFromJson(json);
  String product;
  String front;
  String ingredients;
  String nutrition;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponsePicturesEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseIngredientsEntity {
  ProductAPIResponseIngredientsEntity(
    this.containsPalmOil,
    this.list,
    this.details,
  );

  factory ProductAPIResponseIngredientsEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseIngredientsEntityFromJson(json);
  bool containsPalmOil;
  List<String>? list;
  List<ProductAPIResponseIngredientsDetailsEntity>? details;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseIngredientsEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseIngredientsDetailsEntity {
  ProductAPIResponseIngredientsDetailsEntity(
    this.vegan,
    this.vegetarian,
    this.containsPalmOil,
    this.percent,
    this.value,
  );

  factory ProductAPIResponseIngredientsDetailsEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseIngredientsDetailsEntityFromJson(json);
  bool vegan;
  bool vegetarian;
  bool containsPalmOil;
  String percent;
  String value;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseIngredientsDetailsEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseNutrientLevelsEntity {
  ProductAPIResponseNutrientLevelsEntity(
    this.fat,
    this.salt,
    this.saturatedFat,
    this.sugars,
  );

  factory ProductAPIResponseNutrientLevelsEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseNutrientLevelsEntityFromJson(json);
  ProductAPIResponseNutrientLevelsFatEntity? fat;
  ProductAPIResponseNutrientLevelsSaltEntity? salt;
  ProductAPIResponseNutrientLevelsSaturatedFatEntity? saturatedFat;
  ProductAPIResponseNutrientLevelsSugarsEntity? sugars;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseNutrientLevelsEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseNutrientLevelsFatEntity {
  ProductAPIResponseNutrientLevelsFatEntity(this.level, this.per100g);

  factory ProductAPIResponseNutrientLevelsFatEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseNutrientLevelsFatEntityFromJson(json);
  String level;
  int per100g;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseNutrientLevelsFatEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseNutrientLevelsSaltEntity {
  ProductAPIResponseNutrientLevelsSaltEntity(this.level, this.per100g);

  factory ProductAPIResponseNutrientLevelsSaltEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseNutrientLevelsSaltEntityFromJson(json);
  String level;
  double per100g;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseNutrientLevelsSaltEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseNutrientLevelsSaturatedFatEntity {
  ProductAPIResponseNutrientLevelsSaturatedFatEntity(this.level, this.per100g);

  factory ProductAPIResponseNutrientLevelsSaturatedFatEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseNutrientLevelsSaturatedFatEntityFromJson(json);
  String level;
  double per100g;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseNutrientLevelsSaturatedFatEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseNutrientLevelsSugarsEntity {
  ProductAPIResponseNutrientLevelsSugarsEntity(this.level, this.per100g);

  factory ProductAPIResponseNutrientLevelsSugarsEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseNutrientLevelsSugarsEntityFromJson(json);
  String level;
  int per100g;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseNutrientLevelsSugarsEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseNutritionFacts {
  ProductAPIResponseNutritionFacts(
    this.servingSize,
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
  );

  factory ProductAPIResponseNutritionFacts.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseNutritionFactsFromJson(json);
  String? servingSize;
  ProductAPIResponseNutritionFactsEntity? calories;
  ProductAPIResponseNutritionFactsEntity? fat;
  ProductAPIResponseNutritionFactsEntity? saturatedFat;
  ProductAPIResponseNutritionFactsEntity? carbohydrate;
  ProductAPIResponseNutritionFactsEntity? sugar;
  ProductAPIResponseNutritionFactsEntity? fiber;
  ProductAPIResponseNutritionFactsEntity? proteins;
  ProductAPIResponseNutritionFactsEntity? sodium;
  ProductAPIResponseNutritionFactsEntity? salt;
  ProductAPIResponseNutritionFactsEntity? energy;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseNutritionFactsToJson(this);
}

@JsonSerializable()
class ProductAPIResponseNutritionFactsEntity {
  ProductAPIResponseNutritionFactsEntity(
    this.unit,
    this.perServing,
    this.per100g,
  );

  factory ProductAPIResponseNutritionFactsEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseNutritionFactsEntityFromJson(json);
  String unit;
  String perServing;
  String per100g;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseNutritionFactsEntityToJson(this);

  Nutriment? toNutriment() {
    return Nutriment(unit: unit, perServing: perServing, per100g: per100g);
  }
}

@JsonSerializable()
class ProductAPIResponseTracesEntity {
  ProductAPIResponseTracesEntity(this.list);

  factory ProductAPIResponseTracesEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductAPIResponseTracesEntityFromJson(json);
  List<String> list;

  Map<String, dynamic> toJson() => _$ProductAPIResponseTracesEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseAllergensEntity {
  ProductAPIResponseAllergensEntity(this.list);

  factory ProductAPIResponseAllergensEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseAllergensEntityFromJson(json);
  List<String> list;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseAllergensEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseAnalysisEntity {
  ProductAPIResponseAnalysisEntity(this.palmOil, this.vegan, this.vegetarian);

  factory ProductAPIResponseAnalysisEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponseAnalysisEntityFromJson(json);
  String palmOil;
  String vegan;
  String vegetarian;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponseAnalysisEntityToJson(this);
}
