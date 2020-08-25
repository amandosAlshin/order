// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceStore on _ServiceStoreBase, Store {
  Computed<ServicesApi> _$servicesApiComputed;

  @override
  ServicesApi get servicesApi =>
      (_$servicesApiComputed ??= Computed<ServicesApi>(() => super.servicesApi,
              name: '_ServiceStoreBase.servicesApi'))
          .value;

  final _$_servicesApiAtom = Atom(name: '_ServiceStoreBase._servicesApi');

  @override
  ServicesApi get _servicesApi {
    _$_servicesApiAtom.reportRead();
    return super._servicesApi;
  }

  @override
  set _servicesApi(ServicesApi value) {
    _$_servicesApiAtom.reportWrite(value, super._servicesApi, () {
      super._servicesApi = value;
    });
  }

  final _$_ServiceStoreBaseActionController =
      ActionController(name: '_ServiceStoreBase');

  @override
  dynamic fetchServicesList(String id) {
    final _$actionInfo = _$_ServiceStoreBaseActionController.startAction(
        name: '_ServiceStoreBase.fetchServicesList');
    try {
      return super.fetchServicesList(id);
    } finally {
      _$_ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servicesApi: ${servicesApi}
    ''';
  }
}
