import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/data_bloc.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String avatarImage;

  const MyAppBar({
    super.key,
    required this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        return AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: state.isDrawerOpen
              ? const DelayedDisplay(
                  slidingBeginOffset: Offset(0, 0),
                  child: Text(
                    "Chats",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : const SizedBox(),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.read<DataBloc>().add(OpenDrawer());
            },
            icon: Icon(
              state.isDrawerOpen
                  ? Icons.chevron_left_outlined
                  : Icons.messenger_outline_sharp,
              size: state.isDrawerOpen ? 32 : 22,
              color: Colors.white,
            ),
          ),
          actions: [
            Container(
              width: 35,
              height: 35,
              margin:
                  const EdgeInsets.only(left: 12, right: 8, top: 8, bottom: 8),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(avatarImage),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
