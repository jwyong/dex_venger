import 'package:cached_network_image/cached_network_image.dart';
import 'package:dex_venger/base/base_stateless_widget.dart';
import 'package:dex_venger/const/const.dart';
import 'package:dex_venger/model/ui/holding.dart';
import 'package:dex_venger/view_models/holdings_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// Holdings: Tokens held by this wallet
class HoldingsPage extends BaseStatelessWidget {
  HoldingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("JAY_LOG: HoldingsPage, build, ");
    return Consumer(
      builder: (context, ref, child) {
        // Paging controller for listView
        final pagingController = ref.watch(holdingsPagingControllerProvider);

        // Stream of holdings list
        final holdingsList = ref.watch(holdingsListVmProvider);

        return RefreshIndicator(
          onRefresh: (() async {
            // TODO: JAY_LOG - make API call to get latest details (price)
            await Future.delayed(Duration(milliseconds: 1000));
          }),
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(child: Text("Price Header", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              Expanded(
                child: holdingsList.when(
                  data: (holdings) {
                    final isLastPage = holdings == null || holdings.isEmpty; // ✅ Check if no more data

                    if (isLastPage) {
                      pagingController.appendLastPage([]); // ✅ Stop pagination
                    } else {
                      pagingController.itemList = holdings; // ✅ Update list
                    }

                    return PagedListView<int, Holding>(
                      pagingController: pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Holding>(
                        itemBuilder: (context, item, index) => _HoldingListItem(holding: item)
                      ),
                    );
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text("Error: $err")),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HoldingListItem extends StatelessWidget {
  final Holding holding;

  const _HoldingListItem({super.key, required this.holding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Round Image with Placeholder
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: holding.imgUrl ?? '',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircleAvatar(radius: 25),
              errorWidget: (context, url, error) =>
              const CircleAvatar(
                radius: 25,
                child: Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Text Details (Title & Subtitle)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title & Price
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        holding.name ?? doubleDash,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      // TODO: JAY_LOG - handle abridged + decimal places + zeroes
                      holding.totalValue?.toString()?? doubleDash,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                // Subtitle & Avg Buy Price
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        // <Amount> <symbol>
                        // TODO: JAY_LOG - number formatting
                        '${holding.amount} ${holding.symbol}',

                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      // TODO: JAY_LOG - number formatting
                      holding.pnlUnrealised?.toString()?? doubleDash,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}