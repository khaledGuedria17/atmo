import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCla0iOzXwDB-IfXllttrDxb6MZYrcxSnc",
            authDomain: "atmo-pw0qrq.firebaseapp.com",
            projectId: "atmo-pw0qrq",
            storageBucket: "atmo-pw0qrq.appspot.com",
            messagingSenderId: "796361003597",
            appId: "1:796361003597:web:84c8479237a8c6d93f0204"));
  } else {
    await Firebase.initializeApp();
  }
}
