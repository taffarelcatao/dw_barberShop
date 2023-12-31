import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:dw_barbershop/src/core/ui/barbershop_nav_globalkey.dart';
import 'package:dw_barbershop/src/core/ui/barbershop_theme.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw_barbershop/src/futures/auth/login/login_page.dart';
import 'package:dw_barbershop/src/futures/auth/register/barbershop/barbershop_register_page.dart';
import 'package:dw_barbershop/src/futures/employee/register/employee_register_page.dart';
import 'package:dw_barbershop/src/futures/employee/schedule/employee_schedule_page.dart';
import 'package:dw_barbershop/src/futures/schedule/schedule_page.dart';
import 'package:dw_barbershop/src/futures/home/adm/home_adm_page.dart';
import 'package:dw_barbershop/src/futures/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'futures/auth/register/user/user_register_page.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          title: 'DW Barbershop',
          theme: BarbershopTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          navigatorKey: BarbershopNavGlobalkey.instance.navKey,
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/auth/register/user': (_) => const UserRegisterPage(),
            '/auth/register/barbershop': (_) => const BarbershopRegisterPage(),
            '/home/adm': (_) => const HomeAdmPage(),
            '/home/employee': (_) => const Text('Employee'),
            '/employee/register': (_) => const EmployeeRegisterPage(),
            '/employee/schedule': (_) => const EmployeeSchedulePage(),
            '/schedule': (_) => const SchedulePage(),
          },
        );
      },
    );
  }
}
