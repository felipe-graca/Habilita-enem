// ignore_for_file: unused_field

import 'package:firebase_storage/firebase_storage.dart';
import 'package:habilita_enem/core/service/http/http_service_interface.dart';
import 'package:habilita_enem/core/service/storage/storage_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService implements IStorageService {
  final SharedPreferences _storage;
  final IHttpService _httpService;

  StorageService(this._storage, this._httpService);

  final _firebaseStorage = FirebaseStorage.instance.ref();
}
