// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SheduleStore on _SheduleStoreBase, Store {
  Computed<ShedulesApi> _$shedulesApiComputed;

  @override
  ShedulesApi get shedulesApi =>
      (_$shedulesApiComputed ??= Computed<ShedulesApi>(() => super.shedulesApi,
              name: '_SheduleStoreBase.shedulesApi'))
          .value;

  final _$_shedulesApiAtom = Atom(name: '_SheduleStoreBase._shedulesApi');

  @override
  ShedulesApi get _shedulesApi {
    _$_shedulesApiAtom.reportRead();
    return super._shedulesApi;
  }

  @override
  set _shedulesApi(ShedulesApi value) {
    _$_shedulesApiAtom.reportWrite(value, super._shedulesApi, () {
      super._shedulesApi = value;
    });
  }

  final _$_SheduleStoreBaseActionController =
      ActionController(name: '_SheduleStoreBase');

  @override
  dynamic fetchShedulesList(String id) {
    final _$actionInfo = _$_SheduleStoreBaseActionController.startAction(
        name: '_SheduleStoreBase.fetchShedulesList');
    try {
      return super.fetchShedulesList(id);
    } finally {
      _$_SheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shedulesApi: ${shedulesApi}
    ''';
  }
}
