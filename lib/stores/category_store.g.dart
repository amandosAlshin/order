// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStoreBase, Store {
  Computed<CategoryApi> _$categoryApiComputed;

  @override
  CategoryApi get categoryApi =>
      (_$categoryApiComputed ??= Computed<CategoryApi>(() => super.categoryApi,
              name: '_CategoryStoreBase.categoryApi'))
          .value;

  final _$_categoryApiAtom = Atom(name: '_CategoryStoreBase._categoryApi');

  @override
  CategoryApi get _categoryApi {
    _$_categoryApiAtom.reportRead();
    return super._categoryApi;
  }

  @override
  set _categoryApi(CategoryApi value) {
    _$_categoryApiAtom.reportWrite(value, super._categoryApi, () {
      super._categoryApi = value;
    });
  }

  final _$_CategoryStoreBaseActionController =
      ActionController(name: '_CategoryStoreBase');

  @override
  dynamic fetchCategoryList() {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.fetchCategoryList');
    try {
      return super.fetchCategoryList();
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryApi: ${categoryApi}
    ''';
  }
}
