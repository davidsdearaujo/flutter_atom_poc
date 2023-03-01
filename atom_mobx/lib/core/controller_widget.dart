// import 'package:flutter/widgets.dart';

// import 'reaction.dart';

// abstract class ControllerMixin {
//   final Controller controller;
// }

// class ControllerWidget extends StatefulWidget {
//   final Widget child;
//   final Controller controller;
//   const ControllerWidget({
//     super.key,
//     required this.child,
//     required this.reactions,
//   });

//   @override
//   State<ControllerWidget> createState() => _ControllerWidgetState();
// }

// class _ControllerWidgetState extends State<ControllerWidget> {
//   @override
//   void dispose() {
//     for (var disposer in widget.reactions) {
//       disposer.call();
//     }
//     super.dispose();
//   }

//   @override
//   void didUpdateWidget(covariant ControllerWidget oldWidget) {
//     if (oldWidget.child != widget.child) setState(() {});
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }
