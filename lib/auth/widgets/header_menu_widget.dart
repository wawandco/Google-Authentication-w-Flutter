import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/auth/domain/auth_service.dart';
import 'package:my_app/auth/widgets/login_screen_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<StatefulWidget> createState() => _HeaderState();
}

class _HeaderState extends State<StatefulWidget> {
  User? currentUser = Supabase.instance.client.auth.currentUser;
  bool showModal = false;

  @override
  void initState() {
    Supabase.instance.client.auth.onAuthStateChange.listen((state) {
      if (state.event == AuthChangeEvent.signedIn) {
        setState(() {
          currentUser = state.session?.user;

          if (showModal) {
            showModal = false;

            Navigator.of(context).pop();
          }
        });
      }
    });

    if (kIsWeb) {
      authService.signInWeb();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 64,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Row(
            children: [
              Icon(
                Icons.square_rounded,
                size: 32,
              ),
              Text(
                "My App",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (currentUser == null)
                TextButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 8, horizontal: 18)),
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    shape: MaterialStatePropertyAll(
                      StadiumBorder(),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () async {
                    setState(() => showModal = true);

                    await showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SingleChildScrollView(
                            child: Container(
                              constraints:
                                  BoxConstraints.loose(const Size(440, 640)),
                              padding: const EdgeInsets.all(24),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.close_rounded,
                                        ),
                                        onPressed: Navigator.of(context).pop,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      child: LoginScreen(
                                        onPressed: () {
                                          authService.signIn().then((_) {
                                            setState(() {
                                              currentUser = Supabase.instance
                                                  .client.auth.currentUser;
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((_) => setState(() => showModal = false));
                  },
                ),
              if (currentUser != null)
                TextButton(
                  onPressed: () {
                    authService.signOut().then((_) {
                      setState(() => currentUser = null);
                    });
                  },
                  child: const Text("Sign out"),
                ),
              if (currentUser != null)
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage(currentUser!.userMetadata!['avatar_url']!),
                ),
            ],
          )
        ],
      ),
    );
  }
}
