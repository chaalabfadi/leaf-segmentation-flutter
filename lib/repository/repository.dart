import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Repository {
  Future<Image> fetchSegmentationResults(XFile file) async {
    final request = http.MultipartRequest('POST', Uri.parse('$kUrl/segment'));
    request.files.add(await http.MultipartFile.fromPath('image', file.path));

    final response = await request.send();
    final responseData = await response.stream.toBytes();

    if (response.statusCode == 200) {
      try {
        final imageUrl =
            json.decode(utf8.decode(responseData))['segmented_mask_image_url'];
        log(imageUrl.toString());

        Image image = Image.network(
          imageUrl,
          fit: BoxFit.cover,
        );
        return image;
      } catch (e) {
        throw Exception('Failed to process segmented mask');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
