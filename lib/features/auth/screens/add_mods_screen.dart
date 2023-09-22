import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_app_clone/components/error.dart';
import 'package:reddit_app_clone/components/loader.dart';
import 'package:reddit_app_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_app_clone/features/community/controller/community_controller.dart';

class AllModsScreen extends ConsumerStatefulWidget {
  final String name;
  const AllModsScreen({super.key, required this.name});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllModsScreenState();
}

class _AllModsScreenState extends ConsumerState<AllModsScreen> {
  Set<String> uids = {};
  int ctr = 0;

  void addUids(String uid) {
    setState(() {
      uids.add(uid);
    });
  }

  void removeUids(String uid) {
    setState(() {
      uids.remove(uid);
    });
  }

  void savedMods() {
    ref.read(communityControllerProvider.notifier).addMods(
          widget.name,
          uids.toList(),
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: savedMods,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: ref.watch(getCommunityByNameProvider(widget.name)).when(
            data: (community) => ListView.builder(
              itemCount: community.members.length,
              itemBuilder: (BuildContext context, int index) {
                final member = community.members[index];
                return ref.watch(getUserDataProvider(member)).when(
                    data: (user) {
                      if (community.mods.contains(member) && ctr == 0) {
                        uids.add(member);
                      }
                      ctr++;
                      return CheckboxListTile(
                        value: uids.contains(user.uid),
                        onChanged: (val) {
                          if (val!) {
                            addUids(user.uid);
                          } else {
                            removeUids(user.uid);
                          }
                        },
                        title: Text(user.name),
                      );
                    },
                    error: (error, stackTrace) =>
                        ErrorText(error: error.toString()),
                    loading: () => const Loader());
              },
            ),
            error: (error, stackTrace) => ErrorText(
              error: error.toString(),
            ),
            loading: () => const Loader(),
          ),
    );
  }
}
