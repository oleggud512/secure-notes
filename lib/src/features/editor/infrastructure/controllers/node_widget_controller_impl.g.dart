// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_widget_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nodeWidgetControllerImplHash() =>
    r'5cbb9b3dc7639ddd0216b6494cd2d768eed357f3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NodeWidgetControllerImpl
    extends BuildlessAutoDisposeAsyncNotifier<NodeWidgetState> {
  late final String? nodeId;

  FutureOr<NodeWidgetState> build(
    String? nodeId,
  );
}

/// See also [NodeWidgetControllerImpl].
@ProviderFor(NodeWidgetControllerImpl)
const nodeWidgetControllerImplProvider = NodeWidgetControllerImplFamily();

/// See also [NodeWidgetControllerImpl].
class NodeWidgetControllerImplFamily
    extends Family<AsyncValue<NodeWidgetState>> {
  /// See also [NodeWidgetControllerImpl].
  const NodeWidgetControllerImplFamily();

  /// See also [NodeWidgetControllerImpl].
  NodeWidgetControllerImplProvider call(
    String? nodeId,
  ) {
    return NodeWidgetControllerImplProvider(
      nodeId,
    );
  }

  @override
  NodeWidgetControllerImplProvider getProviderOverride(
    covariant NodeWidgetControllerImplProvider provider,
  ) {
    return call(
      provider.nodeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'nodeWidgetControllerImplProvider';
}

/// See also [NodeWidgetControllerImpl].
class NodeWidgetControllerImplProvider
    extends AutoDisposeAsyncNotifierProviderImpl<NodeWidgetControllerImpl,
        NodeWidgetState> {
  /// See also [NodeWidgetControllerImpl].
  NodeWidgetControllerImplProvider(
    this.nodeId,
  ) : super.internal(
          () => NodeWidgetControllerImpl()..nodeId = nodeId,
          from: nodeWidgetControllerImplProvider,
          name: r'nodeWidgetControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nodeWidgetControllerImplHash,
          dependencies: NodeWidgetControllerImplFamily._dependencies,
          allTransitiveDependencies:
              NodeWidgetControllerImplFamily._allTransitiveDependencies,
        );

  final String? nodeId;

  @override
  bool operator ==(Object other) {
    return other is NodeWidgetControllerImplProvider && other.nodeId == nodeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<NodeWidgetState> runNotifierBuild(
    covariant NodeWidgetControllerImpl notifier,
  ) {
    return notifier.build(
      nodeId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
