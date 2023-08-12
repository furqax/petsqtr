import '../api-handler/api-extention.dart';
import '../constant/api_constants.dart';

import 'api-handler-api.dart';
import 'api-handler.dart';

class ApiRepository {
  final ApiBaseHelper _apiHelper;
  final ApiBaseHelperApi _apiHelperapi;

  ApiRepository(this._apiHelper, this._apiHelperapi);

  // get images list
  Future getImagesList(paramMap) async {
    return _apiHelper
        .getWithParam(ApiConstant.IMAGES_LIST, paramMap)
        .execute((response) => response);
  }

  // get video list
  Future getVideoList(paramMap) async {
    return _apiHelper
        .getWithParam(ApiConstant.VIDEOS_LIST, paramMap)
        .execute((response) => response);
  }

  // get video details
  Future getVideoDetails(id) async {
    return _apiHelper
        .getWithoutParams(ApiConstant.VIDEO_DETAILS + id)
        .execute((response) => response);
  }

  // get video details
  Future getImagesDetails(id) async {
    return _apiHelper
        .getWithoutParams(ApiConstant.PHOTOS_DETAILS + id)
        .execute((response) => response);
  }

  Future getalldata() async {
    return _apiHelperapi
        .getWithoutParamswithoutshopifyapi(
          ApiConstant.categorydetail,
        )
        .execute((response) => response);
  }

  Future getbrandsproducts(String id) async {
    return _apiHelper
        .getWithoutParams(
          "collections/${id}/${ApiConstant.brandproducts}",
        )
        .execute((response) => response);
  }

  Future getmasterdata() async {
    return _apiHelperapi
        .getWithoutParams(
          "${ApiConstant.masterdata}",
        )
        .execute((response) => response);
  }

  Future singleproductdetail(String id) async {
    return _apiHelper
        .getWithoutParams(
          "products/${id}.json",
        )
        .execute((response) => response);
  }
}
