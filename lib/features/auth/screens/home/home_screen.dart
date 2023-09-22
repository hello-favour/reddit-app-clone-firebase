import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_app_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_app_clone/features/auth/screens/home/community_list_drawer.dart';
import 'package:reddit_app_clone/features/auth/screens/home/drawer/profile_drawer.dart';

import 'delegates/search_community_delegates.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => displayDrawer(context),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: SearchCommunityDelegates(ref));
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => displayEndDrawer(context),
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePic),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Text(
            "u/${user.name}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
        ],
      ),
      drawer: const CommunityListDrawer(),
      endDrawer: const ProfileDrawer(),
    );
  }
}
