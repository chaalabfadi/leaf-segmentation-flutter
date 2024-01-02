import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/repository/repository.dart';
import 'package:image_picker/image_picker.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  final Repository _repository = Repository();

  Future<void> selectImage(ImageSource source) async {
    try {
      emit(const GalleryImageLoading());
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(
        source: source,
      );

      if (pickedFile != null) {
        final segmentationResults =
            await _repository.fetchSegmentationResults(pickedFile);

        emit(
          GalleryImageSegmented(
            imagePath: pickedFile.path,
            segmentationResults: segmentationResults,
          ),
        );
      } else {
        emit(const GalleryImageUnselected());
      }
    } catch (e) {
      emit(GalleryImageError(e.toString()));
    }
  }

  Future<void> unselectImage() async {
    emit(const GalleryImageUnselected());
  }
}
