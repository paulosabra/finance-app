import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mono/src/constants/function.dart';
import 'package:mono/src/model/user_model.dart';
import 'package:mono/src/services/auth/auth_service.dart';

class AuthServiceFirebase implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  @override
  Future<UserModel> signUp({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    try {
      await _functions
          .httpsCallable(AppFunction.kRegisterUser)
          .call<Map<String, dynamic>>({
        'displayName': name,
        'email': email,
        'password': password,
      });

      final result = await _auth.signInWithEmailAndPassword(
        email: email ?? '',
        password: password ?? '',
      );

      if (result.user != null) {
        log(await _auth.currentUser?.getIdToken() ?? '');
        final user = _auth.currentUser!;
        await user.updateDisplayName(name);
        return UserModel(
          id: user.uid,
          name: user.displayName,
          email: user.email,
        );
      } else {
        throw Exception(result);
      }
    } on FirebaseAuthException catch (error) {
      throw error.message ?? '';
    } on FirebaseFunctionsException catch (error) {
      throw error.message ?? '';
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signIn({
    required String? email,
    required String? password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email ?? '',
        password: password ?? '',
      );

      if (result.user != null) {
        log(await _auth.currentUser?.getIdToken() ?? '');

        final user = _auth.currentUser!;
        return UserModel(
          id: user.uid,
          name: user.displayName,
          email: user.email,
        );
      } else {
        throw Exception(result);
      }
    } on FirebaseAuthException catch (error) {
      throw error.message ?? '';
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      rethrow;
    }
  }
}
