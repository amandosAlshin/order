// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branchs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BranchsStore on _BranchsStoreBase, Store {
  Computed<BranchsApi> _$branchsApiComputed;

  @override
  BranchsApi get branchsApi =>
      (_$branchsApiComputed ??= Computed<BranchsApi>(() => super.branchsApi,
              name: '_BranchsStoreBase.branchsApi'))
          .value;

  final _$_branchsApiAtom = Atom(name: '_BranchsStoreBase._branchsApi');

  @override
  BranchsApi get _branchsApi {
    _$_branchsApiAtom.reportRead();
    return super._branchsApi;
  }

  @override
  set _branchsApi(BranchsApi value) {
    _$_branchsApiAtom.reportWrite(value, super._branchsApi, () {
      super._branchsApi = value;
    });
  }

  final _$_BranchsStoreBaseActionController =
      ActionController(name: '_BranchsStoreBase');

  @override
  dynamic fetchBranchList(String id) {
    final _$actionInfo = _$_BranchsStoreBaseActionController.startAction(
        name: '_BranchsStoreBase.fetchBranchList');
    try {
      return super.fetchBranchList(id);
    } finally {
      _$_BranchsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
branchsApi: ${branchsApi}
    ''';
  }
}
