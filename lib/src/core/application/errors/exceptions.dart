import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception { 
  final String? message;

  const AppException([this.message]);

  @override
  String toString() {
    return 'AppException("${message ?? 'undefined'}")';
  }

  @override
  List<Object?> get props => [];
}

class NotFoundException extends AppException { }

class ConnectivityException extends AppException { }

class DatabaseNotInitializedException extends AppException { }

/// throws when parent id is not refering to a folder node in NotesRepository.createFolder/createNote([String? parent])
class ParentFolderException extends AppException { }
