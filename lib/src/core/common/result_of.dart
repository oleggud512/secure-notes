sealed class ResultOf<E extends Exception, T> { 
  factory ResultOf.error([E? exception]) = Failure;
  factory ResultOf.success(T data) = Success;
}

class Failure<E extends Exception> implements ResultOf<E, Never> {
  final E? exception;

  const Failure([this.exception]);
}

class Success<T> implements ResultOf<Never, T> {
  final T data;

  const Success(this.data);
}

class NotFoundFailure extends Failure { }