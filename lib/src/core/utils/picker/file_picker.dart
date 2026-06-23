import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@singleton
class FilePickerService {
  Future<FilePickerResult?> pickFile({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    bool allowMultiple = false,
  }) async {
    try {
      return await FilePicker.platform.pickFiles(
        type: type,
        allowMultiple: allowMultiple,
        allowedExtensions: allowedExtensions,
      );
    } catch (e) {
      debugPrint('Error picking file: $e');
      return null;
    }
  }

  Future<List<PlatformFile>?> pickMultipleFiles({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: type,
        allowMultiple: true,
        allowedExtensions: allowedExtensions,
      );
      return result?.files;
    } catch (e) {
      debugPrint('Error picking multiple files: $e');
      return null;
    }
  }

  Future<FilePickerResult?> pickImage() async {
    return pickFile(
      type: FileType.image,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
    );
  }

  Future<FilePickerResult?> pickDocument() async {
    return pickFile(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );
  }

  Future<FilePickerResult?> pickVideo() async {
    return pickFile(
      type: FileType.video,
      allowedExtensions: ['mp4', 'mov', 'avi'],
    );
  }

  Future<FilePickerResult?> pickAudio() async {
    return pickFile(
      type: FileType.audio,
      allowedExtensions: ['mp3', 'wav', 'ogg'],
    );
  }
}