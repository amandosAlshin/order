// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyStore on _CompanyStoreBase, Store {
  Computed<CompanyApi> _$companyApiComputed;

  @override
  CompanyApi get companyApi =>
      (_$companyApiComputed ??= Computed<CompanyApi>(() => super.companyApi,
              name: '_CompanyStoreBase.companyApi'))
          .value;

  final _$_companyApiAtom = Atom(name: '_CompanyStoreBase._companyApi');

  @override
  CompanyApi get _companyApi {
    _$_companyApiAtom.reportRead();
    return super._companyApi;
  }

  @override
  set _companyApi(CompanyApi value) {
    _$_companyApiAtom.reportWrite(value, super._companyApi, () {
      super._companyApi = value;
    });
  }

  final _$_CompanyStoreBaseActionController =
      ActionController(name: '_CompanyStoreBase');

  @override
  dynamic fetchCompanyList() {
    final _$actionInfo = _$_CompanyStoreBaseActionController.startAction(
        name: '_CompanyStoreBase.fetchCompanyList');
    try {
      return super.fetchCompanyList();
    } finally {
      _$_CompanyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companyApi: ${companyApi}
    ''';
  }
}
