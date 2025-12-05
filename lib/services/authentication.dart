import 'package:hive/hive.dart';
import 'package:todo_hive_bloc/models/user.dart';

class Authentication {
  late Box<User> _users;

  Future<void> Init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');
  }

  Future<String?> authenticateUser(
    final String username,
    final String password,
  ) async {
    final success = await _users.values.any(
      (element) => element.username == username && element.password == password,
    );
    if (success) {
      return username;
    } else {
      return null;
    }
  }
}
