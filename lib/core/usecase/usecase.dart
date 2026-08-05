import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

/// Contract every use case in `domain/usecases` must implement.
///
/// [ReturnType] is the value returned on success, [Params] is the input the
/// use case needs. Use [NoParams] when a use case takes no arguments.
abstract class UseCase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
