import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_app_clone/components/error.dart';
import 'package:reddit_app_clone/components/loader.dart';
import 'package:reddit_app_clone/features/community/controller/community_controller.dart';
import 'package:routemaster/routemaster.dart';

class SearchCommunityDelegates extends SearchDelegate {
  final Ref ref;
  SearchCommunityDelegates(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ref.watch(searchCommunityProvider(query)).when(
        data: (communities) => ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final community = communities[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(community.avatar),
                  ),
                  title: Text("r/${community.name}"),
                  onTap: () => nevigateToCommunity(context, community.name),
                );
              },
            ),
        error: (error, stackTrace) => ErrorText(
              error: error.toString(),
            ),
        loading: () => const Loader());
  }

  void nevigateToCommunity(BuildContext context, String communityName) {
    Routemaster.of(context).push("/r/$communityName");
  }
}
