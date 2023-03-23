import 'package:local_db/repository.dart';
import 'package:local_db/user.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveUser(User user) async {
    return await _repository!.insertData('user', user.toJson());
  }

  readUser() async {
    return await _repository!.readData('user');
  }

  updateUser(User user) async {
    return await _repository!.updateData('user', user.toJson());
  }

  deleteUser(dispatchId) async {
    return await _repository!.deleteData('user', dispatchId);
  }
}
