import 'package:flutter/widgets.dart';

import 'reaction.dart';

class ReactionWidget extends StatefulWidget {
  final Widget child;
  final Iterable<ReactionDisposer> reactions;
  const ReactionWidget({
    super.key,
    required this.child,
    required this.reactions,
  });

  @override
  State<ReactionWidget> createState() => _ReactionWidgetState();
}

class _ReactionWidgetState extends State<ReactionWidget> {
  @override
  void didUpdateWidget(covariant ReactionWidget oldWidget) {
    _cancelReactions(oldWidget.reactions);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _cancelReactions(widget.reactions);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _cancelReactions(Iterable<ReactionDisposer> disposers) {
    for (var disposer in disposers) {
      disposer.call();
    }
  }
}
