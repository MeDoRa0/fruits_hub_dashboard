import 'dart:io';

import 'package:fruits_hub_dashboard/core/constants.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBucket(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExist = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (!isBucketExist) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseURL,
      anonKey: kSupabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extentionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from(kSupabaseBucket)
        .upload('$path/$fileName$extentionName', file);

    final String publicUrl = _supabase.client.storage
        .from(kSupabaseBucket)
        .getPublicUrl('$path/$fileName$extentionName');

    return result;
  }
}
