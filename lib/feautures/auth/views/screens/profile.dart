import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/core/widgets/custom_appbar.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/user_actions.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/user_details.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/user_image.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        final UserModel? user = userProvider.user;
        if (user != null) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              title: Text(
                '${user.fname ?? ""}'
                " "
                '${user.lname ?? ""}',
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        UserProfileWidget(
                          image: user.profilePhotoUrl ?? "",
                          joinDate: user.createdAt ?? DateTime.now(),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Personal Information',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                textAlign: TextAlign.start,
                              ),
                              //edit button
                              IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        UserDetailsWidget(
                          email: user.email,
                          dob: user.dob ?? DateTime.now(),
                          username: user.username,
                          gender: user.gender ?? "",
                          phone: user.phoneNumber,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Utilities',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        UserActionsWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
