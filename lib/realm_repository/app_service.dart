import 'package:realm/realm.dart';

class AppService{
  final String id;
  final Uri baseUrl;
  final App app;

  AppService(this.id, this.baseUrl): app = App(AppConfiguration(id, baseUrl: baseUrl));

  Future<User> logInWithEmailPassword(String email, String password) async {
    Credentials credentials = Credentials.emailPassword(email, password);
    User user = await app.logIn(credentials);
    return user;
  }

  Future<User> createUserWithEmailPassword(String email, String password) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
    await authProvider.registerUser(email, password);
    Credentials credentials = Credentials.emailPassword(email, password);
    User user = await app.logIn(credentials);
    return user;
  }

  Future<void> logOut() async {
    await app.currentUser?.logOut();
  }
}