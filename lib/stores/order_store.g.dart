// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStoreBase, Store {
  Computed<MessageOrderApi> _$messageOrderApiComputed;

  @override
  MessageOrderApi get messageOrderApi => (_$messageOrderApiComputed ??=
          Computed<MessageOrderApi>(() => super.messageOrderApi,
              name: '_OrderStoreBase.messageOrderApi'))
      .value;

  final _$_messageOrderApiAtom = Atom(name: '_OrderStoreBase._messageOrderApi');

  @override
  MessageOrderApi get _messageOrderApi {
    _$_messageOrderApiAtom.reportRead();
    return super._messageOrderApi;
  }

  @override
  set _messageOrderApi(MessageOrderApi value) {
    _$_messageOrderApiAtom.reportWrite(value, super._messageOrderApi, () {
      super._messageOrderApi = value;
    });
  }

  final _$loadingAtom = Atom(name: '_OrderStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_OrderStoreBaseActionController =
      ActionController(name: '_OrderStoreBase');

  @override
  dynamic requestPostOrder(String id) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.requestPostOrder');
    try {
      return super.requestPostOrder(id);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
messageOrderApi: ${messageOrderApi}
    ''';
  }
}
