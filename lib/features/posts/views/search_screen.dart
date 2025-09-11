import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/posts/models/thread_model.dart';
import 'package:day15/features/posts/view_models/thread_search_view_model.dart';
import 'package:day15/features/posts/views/widgets/search_list_tile.dart';
import 'package:day15/features/posts/views/widgets/thread.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/search";
  static const routeName = "search";

  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<ThreadModel> _list = [];
  bool _isSearching = false;

  void _onSearchSubmitted(String value) async {
    _list = await ref.watch(threadSearchProvider.notifier).searchThreads(value);
    _isSearching = true;
    setState(() {});
  }

  void _onSuffixTap() {
    _isSearching = false;
    _searchController.text = "";
    setState(() {});
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Search",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: Sizes.size28,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                ),
                child: CupertinoSearchTextField(
                  controller: _searchController,
                  autocorrect: false,
                  onSubmitted: _onSearchSubmitted,
                  onSuffixTap: _onSuffixTap,
                ),
              ),
              Gaps.v10,
              Expanded(
                child: ListView.builder(
                  itemCount: _isSearching ? _list.length : 10,
                  itemBuilder: (BuildContext context, int index) => _isSearching
                      ? Column(
                          children: [
                            Thread(
                              threadData: _list[index],
                            ),
                            Gaps.v16,
                            Divider(
                              height: 0,
                              thickness: 1,
                            ),
                            Gaps.v16,
                          ],
                        )
                      : SearchListTile(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
