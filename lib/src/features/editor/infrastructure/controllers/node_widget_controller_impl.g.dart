// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_widget_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nodeWidgetControllerImplHash() =>
    r'5d44efe386661fe22d492c14f561b0272a90ae55';

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
    String? nodeId,
  ) : this._internal(
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
          nodeId: nodeId,
        );

  NodeWidgetControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nodeId,
  }) : super.internal();

  final String? nodeId;

  @override
  FutureOr<NodeWidgetState> runNotifierBuild(
    covariant NodeWidgetControllerImpl notifier,
  ) {
    return notifier.build(
      nodeId,
    );
  }

  @override
  Override overrideWith(NodeWidgetControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: NodeWidgetControllerImplProvider._internal(
        () => create()..nodeId = nodeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nodeId: nodeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NodeWidgetControllerImpl,
      NodeWidgetState> createElement() {
    return _NodeWidgetControllerImplProviderElement(this);
  }

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
}

mixin NodeWidgetControllerImplRef
    on AutoDisposeAsyncNotifierProviderRef<NodeWidgetState> {
  /// The parameter `nodeId` of this provider.
  String? get nodeId;
}

class _NodeWidgetControllerImplProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NodeWidgetControllerImpl,
        NodeWidgetState> with NodeWidgetControllerImplRef {
  _NodeWidgetControllerImplProviderElement(super.provider);

  @override
  String? get nodeId => (origin as NodeWidgetControllerImplProvider).nodeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
