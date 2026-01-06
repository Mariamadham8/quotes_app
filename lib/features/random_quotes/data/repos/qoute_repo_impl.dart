import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:quotes_app/features/random_quotes/domain/entities/quote.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repos/get_random_quote.dart';
import '../data_sources/random_quote_local_datasource.dart';
import '../data_sources/random_quote_remote_datasource.dart';


 class QouteRepoImpl  implements QuoteRepo{
   final NetworkInfo networkInfo;
   final RandomQuoteLocalDatasource   randomQuoteLocalDatasource;
   final RandomQuoteRemoteDatasource  randomQuoteRemoteDatasource;
  QouteRepoImpl(this.networkInfo,this.randomQuoteLocalDatasource,this.randomQuoteRemoteDatasource);
  @override

  //if there is a connection we will get api serves else get the cached quote
  Future<Either<Failure, Quotes>> getRandomQuote() async {

           if (await networkInfo.isConnected()) {
             try{
               final remoteQuote = await randomQuoteRemoteDatasource.getRandomQuote();
               randomQuoteLocalDatasource.cacheQuote(remoteQuote);
               return right(remoteQuote);
             }
             on ServerException catch (e)  {
               return left(ServerFailure(e.toString()));
             }

           }
           else{
             try{
               final localQuote =await randomQuoteLocalDatasource.getLastRandomQuote();
               return right(localQuote);
             }
             on CacheException catch(e){
               return left(CacheFailure(e.toString()));
             }

           }


    }
}