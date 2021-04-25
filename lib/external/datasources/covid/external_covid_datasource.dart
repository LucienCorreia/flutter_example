import 'package:flutter_example/infra/models/covid/case_model.dart';

import '../../../core/http/http.dart';

import '../../../domain/entities/covid/case_entity.dart';
import '../../../infra/datasources/covid/external_covid_datasource.dart';

class ExternalCovidDatasource implements ExternalCovidDatasourceInterface {
  final Http _http;

  final String _baseUrl = 'https://covid-api.mmediagroup.fr/v1';

  ExternalCovidDatasource({
    required Http http,
  }) : _http = http {
    _http.options.baseUrl = _baseUrl;
  }

  @override
  Future<List<CaseEntity>> getCases({
    String search = '',
  }) async {
    final queryParameters = {
      'country': search,
    };

    final response = await _http.get(
      '/cases',
      queryParameters: queryParameters,
    );

    final cases = (response.data as Iterable)
        .map(
          (e) => CaseModel.fromJson(e),
        )
        .toList();

    return cases;
  }
}
