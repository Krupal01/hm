import 'package:hotel_management/models/User.dart';
import 'package:hotel_management/network/NetworkService.dart';

class NetworkRepository {
  Future<String?> login(
      String role, String mobileNumber, String password) async {
    try {
      return await NetworkService.login(role, mobileNumber, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> registerUser(User user) async {
    try {
      return await NetworkService.registerUser(user);
    } catch (e) {
      rethrow;
    }
  }
}
