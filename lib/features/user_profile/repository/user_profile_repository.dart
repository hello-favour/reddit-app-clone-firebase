import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddit_app_clone/constants/firebase_constants.dart';
import 'package:reddit_app_clone/features/auth/provider/auth_provider.dart';
import 'package:reddit_app_clone/features/auth/provider/failure.dart';
import 'package:reddit_app_clone/features/auth/provider/type_def.dart';
import 'package:reddit_app_clone/models/user_model.dart';

final userProfileRepositoryProvider = Provider((ref) {
  return UserProfileRepository(firebaseFirestore: ref.read(firestoreProvider));
});

class UserProfileRepository {
  FirebaseFirestore _firestore;
  UserProfileRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  FutureVoid editProfile(UserModel user) async {
    try {
      return right(_users.doc(user.name).update(user.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
