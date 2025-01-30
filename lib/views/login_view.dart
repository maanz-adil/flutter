import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Sign In')),
      body: Center(
        child: Consumer<AuthViewModel>(
          builder: (context, authVM, _) {
            if (authVM.isLoading) {
              return CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (authVM.user == null)
                  ElevatedButton(
                    onPressed: () => authVM.signInWithGoogle(),
                    child: Text('Sign in with Google'),
                  )
                else
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(authVM.user!.photoUrl),
                        radius: 30,
                      ),
                      SizedBox(height: 16),
                      Text('Welcome ${authVM.user!.displayName}'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => authVM.signOut(),
                        child: Text('Sign Out'),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}