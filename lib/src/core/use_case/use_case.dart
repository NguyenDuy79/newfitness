import 'dart:async';

abstract class UseCase<R, P> {
  Future<R> call({required P params});

  Stream get status;
}

abstract class UserCaseNoParams<R> {
  Future<R> call();
}
