import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:quotes_app/core/usecases/usecase.dart';
import 'package:quotes_app/features/splash_screen/domain/repositories/lang_repo.dart';

class GetSavedLangUsecase implements Usecase<String, NoParams> {
  final LnagRepo langRepo;

  GetSavedLangUsecase(this.langRepo);

  @override
  Future<Either<Failure, String>> call(NoParams param) async {
    return await langRepo.getSavedLang();
  }
}
