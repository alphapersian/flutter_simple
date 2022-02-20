import 'package:flutter/material.dart';

class DeepLinkApp extends StatelessWidget {
  const DeepLinkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تک بوم',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: "/",
      // routes: {
      //   '/': (context) => Splash(),
      //   '/pay': (context) => PayResult(),
      //
      // }

      // home: Navigator(
      //   pages: const [
      //     MaterialPage(child: PayResult()),
      //     MaterialPage(child: Splash()),
      //
      //   ],
      //   onPopPage: (route, result) {
      //     return route.didPop(result);
      //   },
      // ),

      initialRoute: "/",

      onGenerateRoute: (setting) {
      //https://almokaab.com/p/dvMmw
      //https://almokaab.com/icategory/sVuMVv1ALx9240737722/%D8%B1%D9%8A%D8%A7%D8%B6%D8%A9
      //https://almokaab.com/iproduct/BVlMKDDceyHn4sTCd4alPf0PIwG5rP82pyB1h2ircBcLH6J40c9923497418/%D8%B2%D9%88%D8%AC-%D8%AF%D9%85%D8%A8%D9%84-%D8%AD%D8%AF%D9%8A%D8%AF--%D9%88%D8%B2%D9%86-%D8%A7%D9%84%D8%AB%D9%82%D9%84-%D8%A7%D9%84%D9%88%D8%A7%D8%AD%D8%AF-3-%D9%83%D8%BA%D9%85-%D9%84%D9%84%D9%8A%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%A8%D8%AF%D9%86%D9%8A%D8%A9-%D9%85%D9%86-LCNING

        if (setting.name == "/") {
          return MaterialPageRoute(
            builder: (_) => Splash("splash"),
          );
        } else if(setting.name == "/pay") {
          return MaterialPageRoute(
            builder: (_) => PayResult(),
          );
        }else{
          return MaterialPageRoute(
            builder: (_) => ElsePage(),
          );
        }
        // print(setting.name);
        // print(setting.arguments);
      },
    );
  }
}

class Splash extends StatelessWidget {
  String name = "lklklklklkl";

  //
  Splash(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(name)));
  }
}

class PayResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(" this  is pay result ")));
  }
}
class ElsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("else page ")));
  }
}

