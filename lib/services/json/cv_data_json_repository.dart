import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

import '../../contracts/cv_data.dart';

class CvDataJsonRepository extends BaseJsonService {
  //
  Future<ResultWithValue<CvData>> getCVData(context) async {
    //await Future.delayed(Duration(milliseconds: 10000));
    try {
      var responseJson = await getJsonFromAssets(context, 'json/project.json');
      CvData data = CvData.fromRawJson(responseJson);
      return ResultWithValue<CvData>(true, data, '');
    } catch (exception) {
      getLog().e("cvDataJsonRepository Exception: ${exception.toString()}");
      return ResultWithValue<CvData>(
          false, CvData.fromRawJson('{}'), exception.toString());
    }
  }
}
