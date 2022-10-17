import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Context Menu Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const ContextMenu(),
    );
  }
}

class ContextMenu extends StatefulWidget {
  const ContextMenu({Key? key}) : super(key: key);

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  
  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  // This function will be called when you long press on the blue box or the image
  void _showContextMenu(BuildContext context) async {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
        context: context,

        // Show the context menu at the tap location
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),

        // set a list of choices for the context menu
        items: [
          const PopupMenuItem(
            value: 'favorites',
            child: Text('Add To Favorites'),
          ),
          const PopupMenuItem(
            value: 'comment',
            child: Text('Write Comment'),
          ),
          const PopupMenuItem(
            value: 'hide',
            child: Text('Hide'),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
        ]);

    // Implement the logic for each choice here
    switch (result) {
      case 'favorites':
        debugPrint('Add To Favorites');
        break;
      case 'comment':
        debugPrint('Write Comment');
        break;
      case 'hide':
        debugPrint('Hide');
        break;
        case 'delete':
        debugPrint('Delete');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Context Menu Example')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              // GestureDetector(
              //   // get tap location
              //   onTapDown: (details) => _getTapPosition(details),
              //   // show the context menu
              //   onLongPress: () => _showContextMenu(context),
              //   child: Container(
              //     width: double.infinity,
              //     height: 200,
              //     color: Color.fromARGB(255, 249, 213, 237),
              //     child: const Center(
              //       child: Text(
              //         'Hi There',
              //         style: TextStyle(fontSize: 30, color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              GestureDetector(
               
                onTapDown: (details) => _getTapPosition(details),
                
                onLongPress: () => _showContextMenu(context),
                child: Image.network(
                    'https://i.pinimg.com/originals/d4/c6/b5/d4c6b52579dc65ed2cc11e135f6e48b4.jpg',
                    
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
               
                onTapDown: (details) => _getTapPosition(details),
                
                onLongPress: () => _showContextMenu(context),
                child: Image.network(
                    
                    'https://media.istockphoto.com/photos/cabbage-manchurian-picture-id1334115358?k=20&m=1334115358&s=612x612&w=0&h=jCUv4N_meDLY4qLqb0sDBEfWPdZRq1Edw7accxsgABo=',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
               
                onTapDown: (details) => _getTapPosition(details),
                
                onLongPress: () => _showContextMenu(context),
                child: Image.network(
                    'https://im.whatshot.in/img/2019/Jan/shutterstock-1133301116-1547455586.jpg',
                    
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 15,
              ),
               GestureDetector(
               
                onTapDown: (details) => _getTapPosition(details),
                
                onLongPress: () => _showContextMenu(context),
                child: Image.network(
                    
                    'https://maryzkitchen.com/wp-content/uploads/2022/01/IMG-20220127-WA0105.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 15,
              ),
               GestureDetector(
               
                onTapDown: (details) => _getTapPosition(details),
                
                onLongPress: () => _showContextMenu(context),
                child: Image.network(
                    
                    'https://www.nehascookbook.com/wp-content/uploads/2020/05/Surti-locho-WS-500x500.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 15,
              ),
               GestureDetector(
               
                onTapDown: (details) => _getTapPosition(details),
                
                onLongPress: () => _showContextMenu(context),
                child: Image.network(
                    
                    'https://ministryofcurry.com/wp-content/uploads/2017/06/IMG_3071-scaled.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
