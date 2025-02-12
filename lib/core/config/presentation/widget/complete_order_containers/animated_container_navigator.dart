//? trying to separate the logic of the containers from the animation , that we used in the maps containers

// import 'package:flutter/material.dart';

// class AnimatedContainerNavigator extends StatefulWidget {
//   final Map<String, Widget Function(VoidCallback switchTo)> containers;
//   final String initialContainerKey;

//   const AnimatedContainerNavigator({
//     super.key,
//     required this.containers,
//     required this.initialContainerKey,
//   });

//   @override
//   State<AnimatedContainerNavigator> createState() =>
//       _AnimatedContainerNavigatorState();
// }

// class _AnimatedContainerNavigatorState extends State<AnimatedContainerNavigator>
//     with SingleTickerProviderStateMixin {
//   late final ValueNotifier<String> _currentContainerId;
//   late final AnimationController _animationController;
//   late final Animation<double> _fadeAnimation;
//   late final Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _currentContainerId = ValueNotifier(widget.initialContainerKey);

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );

//     _fadeAnimation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _currentContainerId.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _switchContainer(String containerId) async {
//     if (!widget.containers.containsKey(containerId)) return;

//     await _animationController.reverse();
//     _currentContainerId.value = containerId;
//     _animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<String>(
//       valueListenable: _currentContainerId,
//       builder: (context, currentId, child) {
//         return FadeTransition(
//           opacity: _fadeAnimation,
//           child: SlideTransition(
//             position: _slideAnimation,
//             child: widget.containers[currentId]?.call(
//                   () => _switchContainer(
//                     currentId,
//                   ),
//                 ) ??
//                 const SizedBox(),
//           ),
//         );
//       },
//     );
//   }
// }
