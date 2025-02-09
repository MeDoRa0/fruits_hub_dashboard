import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub_dashboard/core/helper_function/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/firebase_options.dart';
import 'package:fruits_hub_dashboard/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();
  setupGetit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: AppTextStyle.fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoutes,
    );
  }
}
