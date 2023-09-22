import 'package:fpdart/fpdart.dart';
import 'package:reddit_app_clone/features/auth/provider/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
