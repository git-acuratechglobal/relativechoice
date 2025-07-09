import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/features/home_feature/pages/explore_tab/widgets/explorepopup.dart';
import 'package:relative_choice/features/home_feature/pages/Like_tab/like.dart';
import 'package:relative_choice/features/home_feature/pages/profile_tab/profile_screen.dart';
import 'package:relative_choice/features/home_feature/providers/chat_provider/chat_provider.dart';

import 'activity_tab/active_feed.dart';
import 'explore_tab/explore.dart';
import 'messages_tab/messgaes.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 3;
  bool hasShownPopup = false;
  late final AppLifecycleListener _listener;
  late AppLifecycleState? _state;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatNotifier = ref.read(chatNotifierProvider.notifier);
      _state = SchedulerBinding.instance.lifecycleState;
      _listener = AppLifecycleListener(
        onStateChange: (state){
          if(state==AppLifecycleState.resumed){
            chatNotifier.updateUserStatus(isOnline: 1);
          }else{
            chatNotifier.updateUserStatus(isOnline: 0);
          }
        }
      );
    });
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: IndexedStack(
          key: ValueKey(selectedIndex),
          index: selectedIndex,
          children: const [
            Explore(),
            Like(),
            Messages(),
            ActiveFeed(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
                label: 'Explore',
                index: 0,
                unSelectedAsset: 'asset/images/global.png',
                selectedAsset: 'asset/images/global-search.png'),
            _buildNavItem(
                label: 'Likes',
                index: 1,
                unSelectedAsset: 'asset/images/heart.png',
                selectedAsset: 'asset/images/heart2.png'),
            _buildNavItem(
                label: 'Messages',
                index: 2,
                unSelectedAsset: 'asset/images/message.png',
                selectedAsset: 'asset/images/messages.png'),
            _buildNavItem(
                label: 'Activity',
                index: 3,
                unSelectedAsset: 'asset/images/menuboard.png',
                selectedAsset: 'asset/images/menu-board.png'),
            _buildNavItem(
                label: 'Profile',
                index: 4,
                unSelectedAsset: 'asset/images/profile-circle.png',
                selectedAsset: 'asset/images/profile-circle-2.png'),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0 && !hasShownPopup) {
      _showExplorePopup();
      hasShownPopup = true;
    }
  }

  Widget _buildNavItem({
    required String label,
    required int index,
    required final String unSelectedAsset,
    required final String selectedAsset,
  }) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            key: ValueKey(isSelected),
            children: [
              Image.asset(
                isSelected ? selectedAsset : unSelectedAsset,
                width: 27,
                height: 27,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
              if (isSelected)
                const Icon(Icons.circle, color: Color(0xFF005FF2), size: 6),
            ],
          ),
        ),
      ),
    );
  }

  void _showExplorePopup() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                color: Colors.black.withAlpha(128),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Explorepopup(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
