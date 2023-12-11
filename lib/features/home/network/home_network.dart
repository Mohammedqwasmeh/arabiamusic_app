import 'package:arabiamusic_app/core/constant/endpoints.dart';
import 'package:arabiamusic_app/core/error/server_failure.dart';
import 'package:arabiamusic_app/core/error/success.dart';
import 'package:arabiamusic_app/core/network/base.dart';
import 'package:dartz/dartz.dart';

class HomeNetwork {
  static Future<Either<ServerFailure, Success>> getAllSongs() async {
    final result = await NetworkBase().get(
      api: AppEndpoints.allSongs,
    );
    return result.fold((ServerFailure failure) {
      return Left(failure);
    }, (Success success) {
      return Right(success);
    });
  }
}
