


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class Usecase<Type,Param> {
  Future<Either<Failure,Type>> call(Param param);
}


class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
