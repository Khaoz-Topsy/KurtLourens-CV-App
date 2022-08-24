import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';

import 'app_version_num.dart';

class EnvironmentSettings {
  bool isProduction;

  EnvironmentSettings({
    required this.isProduction,
  });

  AssistantAppsEnvironmentSettings toAssistantApps() =>
      AssistantAppsEnvironmentSettings(
        assistantAppsAppGuid: '',
        currentWhatIsNewGuid: '',
        isProduction: isProduction,
        patreonOAuthClientId: '',

        // Required for Android (because of how I set it up) and Windows
        appVersionBuildNumberOverride: appsBuildNum,
        appVersionBuildNameOverride: appsBuildName,
      );
}
