// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_folder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$parentFolderHash() => r'7304aa2dc49383dfd719c481961cb6e61f25844f';

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

/// See also [parentFolder].
@ProviderFor(parentFolder)
const parentFolderProvider = ParentFolderFamily();

/// See also [parentFolder].
class ParentFolderFamily extends Family<ChildDeleter> {
  /// See also [parentFolder].
  const ParentFolderFamily();

  /// See also [parentFolder].
  ParentFolderProvider call(
    String? nodeId,
  ) {
    return ParentFolderProvider(
      nodeId,
    );
  }

  @override
  ParentFolderProvider getProviderOverride(
    covariant ParentFolderProvider provider,
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
  String? get name => r'parentFolderProvider';
}

/// See also [parentFolder].
class ParentFolderProvider extends AutoDisposeProvider<ChildDeleter> {
  /// See also [parentFolder].
  ParentFolderProvider(
    String? nodeId,
  ) : this._internal(
          (ref) => parentFolder(
            ref as ParentFolderRef,
            nodeId,
          ),
          from: parentFolderProvider,
          name: r'parentFolderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$parentFolderHash,
          dependencies: ParentFolderFamily._dependencies,
          allTransitiveDependencies:
              ParentFolderFamily._allTransitiveDependencies,
          nodeId: nodeId,
        );

  ParentFolderProvider._internal(
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
  Override overrideWith(
    ChildDeleter Function(ParentFolderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParentFolderProvider._internal(
        (ref) => create(ref as ParentFolderRef),
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
  AutoDisposeProviderElement<ChildDeleter> createElement() {
    return _ParentFolderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParentFolderProvider && other.nodeId == nodeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ParentFolderRef on AutoDisposeProviderRef<ChildDeleter> {
  /// The parameter `nodeId` of this provider.
  String? get nodeId;
}

class _ParentFolderProviderElement
    extends AutoDisposeProviderElement<ChildDeleter> with ParentFolderRef {
  _ParentFolderProviderElement(super.provider);

  @override
  String? get nodeId => (origin as ParentFolderProvider).nodeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
