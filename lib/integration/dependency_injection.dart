import 'package:assistantapps_flutter_common/assistantapps_flutter_common.dart';
import 'package:get_it/get_it.dart';

import '../env/environment_settings.dart';
import '../services/base/basewidget_service.dart';
import '../services/base/loadingwidget_service.dart';
import '../services/base/path_service.dart';
import '../services/base/theme_service.dart';

final getIt = GetIt.instance;

void initDependencyInjection(EnvironmentSettings env) {
  getIt.registerSingleton<EnvironmentSettings>(env);

  // AssistantApps
  initAssistantAppsDependencyInjection(
    env.toAssistantApps(),
    // analytics: AnalyticsService(),
    theme: ThemeService(),
    // notification: NotificationService(),
    path: PathService(),
    baseWidget: BaseWidgetService(),
    // dialog: DialogService(),
    loading: LoadingWidgetService(),
    // language: LanguageService(),
    // snackbar: SnackbarService(),
  );

  // getIt.registerSingleton<ContributorApiService>(ContributorApiService());
}

EnvironmentSettings getEnv() => getIt<EnvironmentSettings>();

// IDataJsonRepository getDataRepo() => getIt<IDataJsonRepository>();
