import 'package:amazonclone/LoggedPage.dart';
import 'package:amazonclone/LoginPhases/createAccount.dart';
import 'package:amazonclone/accountDetails.dart';
import 'package:amazonclone/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
    initialLocation: "/mainpage",
    routes: [
      GoRoute(path: '/mainpage',builder: (context, index) => AmazonHome(), ),
      GoRoute(
        path: "/createAccount",
        pageBuilder: (context,state) => CustomTransitionPage(
          key: state.pageKey,
          child: CreateAccount(),
          transitionsBuilder: (context,animation,secondaryAnimation,child){
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          }
        )
      ),

      GoRoute(
          path: "/accountDetails",
          pageBuilder: (context,state) => CustomTransitionPage(
              key: state.pageKey,
              child: AccountDetails(),
              transitionsBuilder: (context,animation,secondaryAnimation,child){
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              }
          )
      ),
      GoRoute(
          path: "/loggedPage",
          pageBuilder: (context,state) => CustomTransitionPage(
              key: state.pageKey,
              child: LoggedPage(),
              transitionsBuilder: (context,animation,secondaryAnimation,child){
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              }
          )
      ),

    ]);