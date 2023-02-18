import 'package:bloody/screens/bloodDonationEventRegister/address_blood_gr.dart';
import 'package:bloody/screens/bloodDonationEventRegister/qa.dart';
import 'package:bloody/screens/bloodDonationEventRegister/success.dart';
import 'package:bloody/screens/login.dart';
import 'package:bloody/screens/searchAdvance/search_advance.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_route_constants.dart';

class NyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.loginRouteName,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Login());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.donation1RouteName,
        path: '/AddressBloodGr',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddressBloodGr());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.donation2RouteName,
        path: '/QA',
        pageBuilder: (context, state) {
          return const MaterialPage(child: QA());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.donation3RouteName,
        path: '/SuccessRegister',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SuccessRegister());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.searchAdvancedRouteName,
        path: '/SearchAdvanced',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SearchAdvanced());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(
          child: Center(
        child: Text('ErrorPage'),
      ));
    },
  );
}
