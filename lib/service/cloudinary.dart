import 'package:cloudinary_public/cloudinary_public.dart';

class Cloudinary {
  static late CloudinaryPublic _cloudinary;

  static Future<void> init() async {
    _cloudinary = CloudinaryPublic('tougra', 'p3vupfir', cache: true);
  }

  Future<CloudinaryResponse> uploadImage(String url) async {
    return await _cloudinary.uploadFile(CloudinaryFile.fromFile(url,
        folder: 'blog-image', resourceType: CloudinaryResourceType.Image));
  }
}
