
import 'package:login_screen/src/core/models/user_abstract.dart';
import 'package:login_screen/src/core/models/user_client.dart';

class UserTrainer extends AbstractUser {
  List<int> clientIds;
  List<UserClient> listClients;
}
