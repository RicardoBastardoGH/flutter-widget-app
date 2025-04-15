import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InfiniteScroll extends StatefulWidget {

  static const String routeName = 'infinite_scroll_screen';
  
  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {

  final List<int> imagesIds = [1,2,3,4,5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent) {
        // loading new images
        LoadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    
    if (!isMounted) return;

    isLoading = true;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {

    if ( scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent ) return;
    scrollController.animateTo(
      // scrollController.position.maxScrollExtent,
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e) => lastId + e));
  }

  Future LoadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    // simulate a network request
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    // if the widget is not mounted, return
    if (!isMounted) return;
    setState(() {});

    moveScrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: () async {
            onRefresh();
          },
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300'),
                );
            }, 
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: 
          isLoading 
          ? FadeIn(
            duration: const Duration(milliseconds: 400),
            child: SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded), 
                ),
          )
          : FadeIn(
            duration: const Duration(milliseconds: 400),
            child: const Icon(Icons.arrow_back_ios_new_rounded))
        ),
    );}
}