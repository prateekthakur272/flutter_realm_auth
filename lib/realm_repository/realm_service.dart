import 'package:realm/realm.dart';

class RealmService{
  User user;
  late Realm _realm;
  
  RealmService(this.user){
    _realm = Realm(Configuration.flexibleSync(user, []));
    _realm.subscriptions.update((mutableSubscriptions) {});
  }

  Realm get realm => _realm;
}