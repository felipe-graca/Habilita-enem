import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CustomKeyboardActions extends StatelessWidget {
  final Widget child;
  final List<FocusNode> nodes;
  final bool nextFocus;

  const CustomKeyboardActions({
    Key? key,
    required this.child,
    required this.nodes,
    this.nextFocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actions = <KeyboardActionsItem>[];
    for (final node in nodes) {
      actions.add(
        KeyboardActionsItem(focusNode: node),
      );
    }

    return KeyboardActions(
      config: KeyboardActionsConfig(
        keyboardBarColor: const Color(0xFFE6E8EE),
        nextFocus: nextFocus,
        actions: actions,
      ),
      child: child,
    );
  }
}
