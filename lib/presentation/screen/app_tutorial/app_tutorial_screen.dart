import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo({ required this.title, required this.caption, required this.imageUrl, });
}

final slides = <SlideInfo>[
  const SlideInfo(title: 'Busca la comida', caption: 'Velit fugiat Lorem non id sunt fugiat occaecat qui et.', imageUrl: 'assets/images/1.png'),
  const SlideInfo(title: 'Entrega rapida', caption: 'Ad aliqua laboris ad magna velit occaecat est aliquip.', imageUrl: 'assets/images/2.png'),
  const SlideInfo(title: 'Disfruta la comida', caption: 'Reprehenderit esse proident ipsum esse voluptate.', imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {

  static const String routeName = 'app_tutorial_screen';
  
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener( () {

      final page = pageViewController.page ?? 0;
      if ( !endReached && page >= slides.length - 1.5 ) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Introducción a la app'),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
             
            // scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: 
              slides.map(
                (slide) => _Slide(
                  title: slide.title, 
                  caption: slide.caption, 
                  imageUrl: slide.imageUrl
                )).toList(),
            
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),

          endReached ?
          Positioned(
            right: 20,
            bottom: 50,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 500),
              child: FilledButton(
                child: const Text('Comenzar'),
                onPressed: () => context.pop(),
              ),
            ),
          )
          : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({ required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final TitleStyle = Theme.of(context).textTheme.titleLarge;
    final CaptionStyle = Theme.of(context).textTheme.bodySmall;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: TitleStyle),
            const SizedBox(height: 10),
            Text(caption, style: CaptionStyle),
          ],
        ),
      )
      );
  }
}

