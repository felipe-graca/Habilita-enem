// ignore_for_file: unused_field

import 'package:firebase_storage/firebase_storage.dart';
import 'package:habilita_enem/core/service/storage/storage_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService implements IStorageService {
  final SharedPreferences _storage;

  StorageService(this._storage);

  final _firebaseStorage = FirebaseStorage.instance.ref();
}
