// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_refresher_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nodeRefresherHash() => r'1614126ff5a34e3d1b7092be434e8a6f27a444ae';

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

typedef NodeRefresherRef = AutoDisposeProviderRef<NodeRefresher>;

/// See also [nodeRefresher].
@ProviderFor(nodeRefresher)
const nodeRefresherProvider = NodeRefresherFamily();

/// See also [nodeRefresher].
class NodeRefresherFamily extends Family<NodeRefresher> {
  /// See also [nodeRefresher].
  const NodeRefresherFamily();

  /// See also [nodeRefresher].
  NodeRefresherProvider call(
    String? folderId,
  ) {
    return NodeRefresherProvider(
      folderId,
    );
  }

  @override
  NodeRefresherProvider getProviderOverride(
    covariant NodeRefresherProvider provider,
  ) {
    return call(
      provider.folderId,
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
  String? get name => r'nodeRefresherProvider';
}

/// See also [nodeRefresher].
class NodeRefresherProvider extends AutoDisposeProvider<NodeRefresher> {
  /// See also [nodeRefresher].
  NodeRefresherProvider(
    this.folderId,
  ) : super.internal(
          (ref) => nodeRefresher(
            ref,
            folderId,
          ),
          from: nodeRefresherProvider,
          name: r'nodeRefresherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nodeRefresherHash,
          dependencies: NodeRefresherFamily._dependencies,
          allTransitiveDependencies:
              NodeRefresherFamily._allTransitiveDependencies,
        );

  final String? folderId;

  @override
  bool operator ==(Object other) {
    return other is NodeRefresherProvider && other.folderId == folderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
