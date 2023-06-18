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

typedef ParentFolderRef = AutoDisposeProviderRef<ChildDeleter>;

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
    this.nodeId,
  ) : super.internal(
          (ref) => parentFolder(
            ref,
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
        );

  final String? nodeId;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
