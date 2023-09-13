import 'package:fpdart/fpdart.dart';
import 'package:reddit_app_clone/provider/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
