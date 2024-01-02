part of 'gallery_cubit.dart';

class GalleryState extends Equatable {
  const GalleryState({
    this.imagePath,
    this.isImageSelected = false,
    this.segmentationResults,
  });

  final String? imagePath;
  final bool isImageSelected;
  final Image? segmentationResults;

  @override
  List<Object?> get props => [imagePath, isImageSelected, segmentationResults];

  GalleryState copyWith({
    String? imagePath,
    bool? isImageSelected,
    Image? segmentationResults,
  }) {
    return GalleryState(
      imagePath: imagePath ?? this.imagePath,
      isImageSelected: isImageSelected ?? this.isImageSelected,
      segmentationResults: segmentationResults ?? this.segmentationResults,
    );
  }
}

class GalleryInitial extends GalleryState {}

class GalleryImageSegmented extends GalleryState {
  const GalleryImageSegmented({
    required String imagePath,
    required Image segmentationResults,
  }) : super(
          imagePath: imagePath,
          segmentationResults: segmentationResults,
          isImageSelected: true,
        );
}

class GalleryImageUnselected extends GalleryState {
  const GalleryImageUnselected() : super();
}

class GalleryImageError extends GalleryState {
  final String message;
  const GalleryImageError(this.message) : super();
}

class GalleryImageLoading extends GalleryState {
  const GalleryImageLoading() : super();
}
