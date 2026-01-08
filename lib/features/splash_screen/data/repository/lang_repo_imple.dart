import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:quotes_app/features/splash_screen/data/datasource/lang_local_data_source.dart';
import 'package:quotes_app/features/splash_screen/domain/repositories/lang_repo.dart';

class LangRepeImple implements LnagRepo {
  final LnagLocalDataSource langLocalDataSource;

  LangRepeImple({required this.langLocalDataSource});

  @override
  Future<Either<Failure, bool>> changelang({required String langCode}) async {
    try {
      final result = await langLocalDataSource.changelang(langCode: langCode);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final result = await langLocalDataSource.getSavedLang();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
