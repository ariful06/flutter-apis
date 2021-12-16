import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/home/chat/constatns/firebase_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../../home_screen.dart';
import '../firebase_chat_core.dart';
import '../rooms.dart';

class AuthController extends SuperController {
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // User is logged in
      Get.offAll(const RoomsPage());
    } else {
      // user is not available  or not logged in
      Get.offAll(const FlutterApiListScreen());
    }
  }

  Future<void> register(String email, String password) async {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseChatCore.instance.createUserInFirestore(
        types.User(
          firstName: 'Ariful',
          id: auth.currentUser!.uid, // UID from Firebase Authentication
          imageUrl: 'https://i.pravatar.cc/300',
          lastName: 'Haque',
        ),
      );

    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> login(String? email, String? password) async {
    try {
      auth.signInWithEmailAndPassword(email: email!, password: password!);

    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  void logout(){
    auth.signOut();
  }

  @override
  void onDetached() {
    debugPrint('onDetached called');
  }

  @override
  void onInactive() {
    debugPrint('onInactive called');
  }

  @override
  void onPaused() {
    debugPrint('onPaused called');
  }

  @override
  void onResumed() {
    debugPrint('onResumed called');
  }
}
