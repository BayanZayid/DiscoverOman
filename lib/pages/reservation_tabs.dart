
import 'package:flutter/material.dart';

import '../common/values/color.dart';
import '../screens/reservations.dart';
import '../screens/taxi_reservations.dart';


import 'package:flutter/material.dart';

class ReservationsTabs extends StatefulWidget {
  const ReservationsTabs({
    super.key,
  });

  @override
  State<ReservationsTabs> createState() => _ReservationsTabsState();
}

class _ReservationsTabsState extends State<ReservationsTabs>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight * 2),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryElementStatus,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              height: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Reservations',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Brand-Regular'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TabBar(
                    controller: tabController,
                    indicatorColor: AppColors.primaryElement,
                    unselectedLabelColor: Colors.white,
                    dividerColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: AppColors.primaryElement,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Brand-Regular'),
                    tabs: const [
                      Tab(
                        text: "Hotels/Trips",
                      ),
                      Tab(
                        text: "Taxi",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: Text(
          //     'User Reservations',
          //     style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          //         color: Colors.black45,
          //         fontSize: 29,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'Brand-Regular'),
          //   ),
          // ),
          body: TabBarView(
            controller: tabController,
            children: [Reservations(), TaxiReservationsTab()],
          )),
    );
  }
}
