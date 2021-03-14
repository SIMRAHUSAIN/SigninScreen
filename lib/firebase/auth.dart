import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
//   //creating an instance of FirebaseAuth and GoogleSignIn
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

//   //creating two methods for signin and out of google
//   //in signin method, we use google signin to authenticate firebase user and then return that user
//   Future<String> signInWithGoogle() async {
//     final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken
//     );
//     final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
//     final FirebaseUser user = authResult.user;

//     assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);

//   return 'signInWithGoogle succeeded: $user';
//   }
//   void signOutGoogle() async{
//   await _googleSignIn.signOut();

//   print("User Sign Out");
// }

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      User user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      await GoogleSignIn().signOut();
      print("Logged Out");
    } catch (e) {
      print("error logging out");
    }
  }

  Future<String> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null) return null;
      User user = (await _firebaseAuth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: (await account.authentication).idToken,
                  accessToken: (await account.authentication).accessToken)))
          .user;
      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);
        final User currentUser = _firebaseAuth.currentUser;
        assert(user.uid == currentUser.uid);
        print("signinwithGoogle succeeded: $user");
        return "$user";
      }
      return null;
    } catch (e) {
      print(e.message);
      print("error logging in with google");
      return null;
    }
  }
}
