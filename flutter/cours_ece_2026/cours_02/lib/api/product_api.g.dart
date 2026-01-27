// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAPIEntity _$ProductAPIEntityFromJson(Map<String, dynamic> json) =>
    ProductAPIEntity(
      json['response'] == null
          ? null
          : ProductAPIResponseEntity.fromJson(
              json['response'] as Map<String, dynamic>,
            ),
      json['error'],
    );

Map<String, dynamic> _$ProductAPIEntityToJson(ProductAPIEntity instance) =>
    <String, dynamic>{'response': instance.response, 'error': instance.error};

ProductAPIResponseEntity _$ProductAPIResponseEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseEntity(
  json['name'] as String?,
  json['altName'] as String?,
  json['barcode'] as String,
  json['pictures'] == null
      ? null
      : ProductAPIResponsePicturesEntity.fromJson(
          json['pictures'] as Map<String, dynamic>,
        ),
  json['quantity'] as String?,
  (json['brands'] as List<dynamic>?)?.map((e) => e as String).toList(),
  (json['stores'] as List<dynamic>?)?.map((e) => e as String).toList(),
  (json['countries'] as List<dynamic>?)?.map((e) => e as String).toList(),
  (json['manufacturingCountries'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  json['nutriScore'] as String?,
  (json['novaScore'] as num?)?.toInt(),
  (json['ecoScore'] as num?)?.toInt(),
  json['ecoScoreGrade'] as String?,
  (json['nutritionScore'] as num?)?.toInt(),
  json['ingredients'] == null
      ? null
      : ProductAPIResponseIngredientsEntity.fromJson(
          json['ingredients'] as Map<String, dynamic>,
        ),
  json['nutrientLevels'] == null
      ? null
      : ProductAPIResponseNutrientLevelsEntity.fromJson(
          json['nutrientLevels'] as Map<String, dynamic>,
        ),
  json['nutritionFacts'] == null
      ? null
      : ProductAPIResponseNutritionFacts.fromJson(
          json['nutritionFacts'] as Map<String, dynamic>,
        ),
  json['traces'] == null
      ? null
      : ProductAPIResponseTracesEntity.fromJson(
          json['traces'] as Map<String, dynamic>,
        ),
  (json['additives'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  json['allergens'] == null
      ? null
      : ProductAPIResponseAllergensEntity.fromJson(
          json['allergens'] as Map<String, dynamic>,
        ),
  (json['packaging'] as List<dynamic>?)?.map((e) => e as String).toList(),
  json['analysis'] == null
      ? null
      : ProductAPIResponseAnalysisEntity.fromJson(
          json['analysis'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProductAPIResponseEntityToJson(
  ProductAPIResponseEntity instance,
) => <String, dynamic>{
  'name': instance.name,
  'altName': instance.altName,
  'barcode': instance.barcode,
  'pictures': instance.pictures,
  'quantity': instance.quantity,
  'brands': instance.brands,
  'stores': instance.stores,
  'countries': instance.countries,
  'manufacturingCountries': instance.manufacturingCountries,
  'nutriScore': instance.nutriScore,
  'novaScore': instance.novaScore,
  'ecoScore': instance.ecoScore,
  'ecoScoreGrade': instance.ecoScoreGrade,
  'nutritionScore': instance.nutritionScore,
  'ingredients': instance.ingredients,
  'nutrientLevels': instance.nutrientLevels,
  'nutritionFacts': instance.nutritionFacts,
  'traces': instance.traces,
  'additives': instance.additives,
  'allergens': instance.allergens,
  'packaging': instance.packaging,
  'analysis': instance.analysis,
};

ProductAPIResponsePicturesEntity _$ProductAPIResponsePicturesEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponsePicturesEntity(
  json['product'] as String,
  json['front'] as String,
  json['ingredients'] as String,
  json['nutrition'] as String,
);

Map<String, dynamic> _$ProductAPIResponsePicturesEntityToJson(
  ProductAPIResponsePicturesEntity instance,
) => <String, dynamic>{
  'product': instance.product,
  'front': instance.front,
  'ingredients': instance.ingredients,
  'nutrition': instance.nutrition,
};

ProductAPIResponseIngredientsEntity
_$ProductAPIResponseIngredientsEntityFromJson(Map<String, dynamic> json) =>
    ProductAPIResponseIngredientsEntity(
      json['containsPalmOil'] as bool,
      (json['list'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['details'] as List<dynamic>?)
          ?.map(
            (e) => ProductAPIResponseIngredientsDetailsEntity.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$ProductAPIResponseIngredientsEntityToJson(
  ProductAPIResponseIngredientsEntity instance,
) => <String, dynamic>{
  'containsPalmOil': instance.containsPalmOil,
  'list': instance.list,
  'details': instance.details,
};

ProductAPIResponseIngredientsDetailsEntity
_$ProductAPIResponseIngredientsDetailsEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseIngredientsDetailsEntity(
  json['vegan'] as bool,
  json['vegetarian'] as bool,
  json['containsPalmOil'] as bool,
  json['percent'] as String,
  json['value'] as String,
);

Map<String, dynamic> _$ProductAPIResponseIngredientsDetailsEntityToJson(
  ProductAPIResponseIngredientsDetailsEntity instance,
) => <String, dynamic>{
  'vegan': instance.vegan,
  'vegetarian': instance.vegetarian,
  'containsPalmOil': instance.containsPalmOil,
  'percent': instance.percent,
  'value': instance.value,
};

ProductAPIResponseNutrientLevelsEntity
_$ProductAPIResponseNutrientLevelsEntityFromJson(Map<String, dynamic> json) =>
    ProductAPIResponseNutrientLevelsEntity(
      json['fat'] == null
          ? null
          : ProductAPIResponseNutrientLevelsFatEntity.fromJson(
              json['fat'] as Map<String, dynamic>,
            ),
      json['salt'] == null
          ? null
          : ProductAPIResponseNutrientLevelsSaltEntity.fromJson(
              json['salt'] as Map<String, dynamic>,
            ),
      json['saturatedFat'] == null
          ? null
          : ProductAPIResponseNutrientLevelsSaturatedFatEntity.fromJson(
              json['saturatedFat'] as Map<String, dynamic>,
            ),
      json['sugars'] == null
          ? null
          : ProductAPIResponseNutrientLevelsSugarsEntity.fromJson(
              json['sugars'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProductAPIResponseNutrientLevelsEntityToJson(
  ProductAPIResponseNutrientLevelsEntity instance,
) => <String, dynamic>{
  'fat': instance.fat,
  'salt': instance.salt,
  'saturatedFat': instance.saturatedFat,
  'sugars': instance.sugars,
};

ProductAPIResponseNutrientLevelsFatEntity
_$ProductAPIResponseNutrientLevelsFatEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseNutrientLevelsFatEntity(
  json['level'] as String,
  (json['per100g'] as num).toInt(),
);

Map<String, dynamic> _$ProductAPIResponseNutrientLevelsFatEntityToJson(
  ProductAPIResponseNutrientLevelsFatEntity instance,
) => <String, dynamic>{'level': instance.level, 'per100g': instance.per100g};

ProductAPIResponseNutrientLevelsSaltEntity
_$ProductAPIResponseNutrientLevelsSaltEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseNutrientLevelsSaltEntity(
  json['level'] as String,
  (json['per100g'] as num).toDouble(),
);

Map<String, dynamic> _$ProductAPIResponseNutrientLevelsSaltEntityToJson(
  ProductAPIResponseNutrientLevelsSaltEntity instance,
) => <String, dynamic>{'level': instance.level, 'per100g': instance.per100g};

ProductAPIResponseNutrientLevelsSaturatedFatEntity
_$ProductAPIResponseNutrientLevelsSaturatedFatEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseNutrientLevelsSaturatedFatEntity(
  json['level'] as String,
  (json['per100g'] as num).toDouble(),
);

Map<String, dynamic> _$ProductAPIResponseNutrientLevelsSaturatedFatEntityToJson(
  ProductAPIResponseNutrientLevelsSaturatedFatEntity instance,
) => <String, dynamic>{'level': instance.level, 'per100g': instance.per100g};

ProductAPIResponseNutrientLevelsSugarsEntity
_$ProductAPIResponseNutrientLevelsSugarsEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseNutrientLevelsSugarsEntity(
  json['level'] as String,
  (json['per100g'] as num).toInt(),
);

Map<String, dynamic> _$ProductAPIResponseNutrientLevelsSugarsEntityToJson(
  ProductAPIResponseNutrientLevelsSugarsEntity instance,
) => <String, dynamic>{'level': instance.level, 'per100g': instance.per100g};

ProductAPIResponseNutritionFacts _$ProductAPIResponseNutritionFactsFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseNutritionFacts(
  json['servingSize'] as String?,
  json['calories'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['calories'] as Map<String, dynamic>,
        ),
  json['fat'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['fat'] as Map<String, dynamic>,
        ),
  json['saturatedFat'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['saturatedFat'] as Map<String, dynamic>,
        ),
  json['carbohydrate'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['carbohydrate'] as Map<String, dynamic>,
        ),
  json['sugar'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['sugar'] as Map<String, dynamic>,
        ),
  json['fiber'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['fiber'] as Map<String, dynamic>,
        ),
  json['proteins'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['proteins'] as Map<String, dynamic>,
        ),
  json['sodium'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['sodium'] as Map<String, dynamic>,
        ),
  json['salt'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['salt'] as Map<String, dynamic>,
        ),
  json['energy'] == null
      ? null
      : ProductAPIResponseNutritionFactsEntity.fromJson(
          json['energy'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProductAPIResponseNutritionFactsToJson(
  ProductAPIResponseNutritionFacts instance,
) => <String, dynamic>{
  'servingSize': instance.servingSize,
  'calories': instance.calories,
  'fat': instance.fat,
  'saturatedFat': instance.saturatedFat,
  'carbohydrate': instance.carbohydrate,
  'sugar': instance.sugar,
  'fiber': instance.fiber,
  'proteins': instance.proteins,
  'sodium': instance.sodium,
  'salt': instance.salt,
  'energy': instance.energy,
};

ProductAPIResponseNutritionFactsEntity
_$ProductAPIResponseNutritionFactsEntityFromJson(Map<String, dynamic> json) =>
    ProductAPIResponseNutritionFactsEntity(
      json['unit'] as String,
      json['perServing'] as String,
      json['per100g'] as String,
    );

Map<String, dynamic> _$ProductAPIResponseNutritionFactsEntityToJson(
  ProductAPIResponseNutritionFactsEntity instance,
) => <String, dynamic>{
  'unit': instance.unit,
  'perServing': instance.perServing,
  'per100g': instance.per100g,
};

ProductAPIResponseTracesEntity _$ProductAPIResponseTracesEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseTracesEntity(
  (json['list'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProductAPIResponseTracesEntityToJson(
  ProductAPIResponseTracesEntity instance,
) => <String, dynamic>{'list': instance.list};

ProductAPIResponseAllergensEntity _$ProductAPIResponseAllergensEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseAllergensEntity(
  (json['list'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProductAPIResponseAllergensEntityToJson(
  ProductAPIResponseAllergensEntity instance,
) => <String, dynamic>{'list': instance.list};

ProductAPIResponseAnalysisEntity _$ProductAPIResponseAnalysisEntityFromJson(
  Map<String, dynamic> json,
) => ProductAPIResponseAnalysisEntity(
  json['palmOil'] as String,
  json['vegan'] as String,
  json['vegetarian'] as String,
);

Map<String, dynamic> _$ProductAPIResponseAnalysisEntityToJson(
  ProductAPIResponseAnalysisEntity instance,
) => <String, dynamic>{
  'palmOil': instance.palmOil,
  'vegan': instance.vegan,
  'vegetarian': instance.vegetarian,
};

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _ProductRestClient implements ProductRestClient {
  _ProductRestClient(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://api.formation-flutter.fr/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ProductAPIEntity> getProduct(String barcode) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'barcode': barcode};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ProductAPIEntity>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'getProduct',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ProductAPIEntity _value;
    try {
      _value = ProductAPIEntity.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
