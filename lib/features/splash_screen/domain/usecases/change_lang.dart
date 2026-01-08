import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:quotes_app/core/usecases/usecase.dart';
import 'package:quotes_app/features/splash_screen/domain/repositories/lang_repo.dart';

class ChangeLangUsecase implements Usecase<bool, String> {
  final LnagRepo langRepo;

  ChangeLangUsecase(this.langRepo);

  @override
  Future<Either<Failure, bool>> call(String langCode) async {
    return await langRepo.changelang(langCode: langCode);
  }
}
