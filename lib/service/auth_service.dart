import 'package:al_lover_mer/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:al_lover_mer/service/database_service.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final DatabaseService _databaseService;

  AuthService({required DatabaseService dbService})
      : _databaseService = dbService;

  Future<User> createUser(
      {required photoURL,
      required email,
      required password,
      required name,
      required age,
      required tel}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (userCredential.user == null) {
      throw Exception('create user with email and password return null');
    }
    final firebaseUser = userCredential.user;
    final newUser = User(
        uid: firebaseUser!.uid,
        photoURL: photoURL,
        email: email,
        password: password,
        name: name,
        age: age,
        tel: tel);

    //TODO add new user to firestore, database
    await _databaseService.createUserFromModel(user: newUser);

    return newUser;
  }

  Future<User?> signInWithEmailAndPassword(
      {required email, required password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!, password: password!);

    final userUid = userCredential.user?.uid;
    final user = await _databaseService.getUserFromUid(uid: userUid);
    return user;
  }

  Future<User?> currentUser() async {
    return await _databaseService.getUserFromUid(
        uid: _firebaseAuth.currentUser?.uid);
  }

  Stream<User?>? get userStream {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      return await _databaseService.getUserFromUid(uid: firebaseUser?.uid);
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    return;
  }
}
