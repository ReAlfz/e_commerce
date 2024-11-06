import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/transaction_screen/views/components/transaction_appbar_widget.dart';
import 'package:e_commerce/features/transaction_screen/views/ui/history_widget.dart';
import 'package:e_commerce/features/transaction_screen/views/ui/on_going_widget.dart';
import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: MainColor.grey,
          appBar: TransactionAppbarWidget(),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              OnGoingWidget(),
              HistoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}