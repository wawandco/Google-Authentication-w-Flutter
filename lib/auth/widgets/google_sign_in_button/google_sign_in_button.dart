export "src/sign_in_button_stub.dart"
    if (dart.library.io) "src/sign_in_button_mp.dart"
    if (dart.library.html) "src/sign_in_button_web.dart";
