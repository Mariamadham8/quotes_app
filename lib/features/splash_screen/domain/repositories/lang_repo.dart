import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/failure.dart';

abstract class LnagRepo {
  Future<Either<Failure, bool>> changelang({required String langCode});

  Future<Either<Failure, String>> getSavedLang();
}
