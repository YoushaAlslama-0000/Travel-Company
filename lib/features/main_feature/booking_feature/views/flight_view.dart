// import 'package:flight_app/common/custom_utiles/colors.dart';
// import 'package:flight_app/common/custom_utiles/functions_utils.dart';
// import 'package:flight_app/common/custom_widgets/custom_button.dart';
// import 'package:flight_app/features/drawer_feature/views/scheduled_trips_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FlightBookingView extends StatefulWidget {
//   const FlightBookingView({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _FlightBookingViewState createState() => _FlightBookingViewState();
// }

// class _FlightBookingViewState extends State<FlightBookingView>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   // State for passengers
//   int adults = 1;
//   int children = 0;
//   int infants = 0;

//   // State for multi-city flights
//   final List<FlightSegment> _multiCityFlights = [
//     FlightSegment(
//       id: 1,
//       from: 'مطار علامة إقبال (LHE)',
//       to: 'مطار جدة (جدة)',
//       date: 'الاثنين، مارس 10، 2025',
//     ),
//     FlightSegment(
//       id: 2,
//       from: 'مطار علامة إقبال (LHE)',
//       to: 'مطار جدة (جدة)',
//       date: 'الاثنين، مارس 10، 2025',
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // The image shows 'Round Trip' as selected initially in one view,
//     // and 'Multi-city' in another. We'll start with 'Round Trip'.
//     _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void _addFlightSegment() {
//     setState(() {
//       _multiCityFlights.add(
//         FlightSegment(
//           id: DateTime.now().millisecondsSinceEpoch,
//           from: 'مطار علامة إقبال (LHE)',
//           to: 'مطار جدة (جدة)',
//           date: 'الاثنين، مارس 10، 2025',
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Using a MaterialApp for directionality and theme context.
//     // In a real app, this would be at the root.
//     return Scaffold(
//       body: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: CustomScrollView(
//                 slivers: [
//                   SliverAppBar(
//                     pinned: true,
//                     title: Text('أحجز رحلتك'),
//                     centerTitle: true,
//                     bottom: PreferredSize(
//                       preferredSize: Size.fromHeight(60.0),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0,
//                           vertical: 8.0,
//                         ),
//                         child: Container(
//                           padding: EdgeInsets.all(screenWidth(100)),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: TabBar(
//                             controller: _tabController,
//                             indicator: BoxDecoration(
//                               color: AppColors.mainColor,
//                               borderRadius: BorderRadius.circular(8),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 4,
//                                   offset: Offset(0, 2),
//                                 ),
//                               ],
//                             ),
//                             labelColor: Colors.white,
//                             unselectedLabelColor: Colors.black87,
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                             tabs: [
//                               Tab(text: 'مدينة متعددة'),
//                               Tab(text: 'رحلة دائرية'),
//                               Tab(text: 'طريق واحد'),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SliverFillRemaining(
//                     child: TabBarView(
//                       controller: _tabController,
//                       children: [
//                         _buildTabContent(_buildMultiCityForm()),
//                         _buildTabContent(_buildRoundTripForm()),
//                         _buildTabContent(_buildOneWayForm()),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabContent(Widget form) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(screenWidth(20)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           form,
//           const SizedBox(height: 24),
//           const Text(
//             'الراكب',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           _buildPassengerSection(),
//           SizedBox(height: screenHeight(20)),
//           CustomButton(
//             buttonText: 'بحث',
//             onTap: () {
//               Get.to(ScheduledTripsView());
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildOneWayForm() {
//     return Card(
//       elevation: 2,
//       shadowColor: Colors.black12,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: const [
//             _FormField(
//               label: 'من',
//               value: 'مطار علامة إقبال (LHE)',
//               icon: Icons.flight,
//             ),
//             SizedBox(height: 12),
//             _FormField(
//               label: 'إلى',
//               value: 'مطار جدة (جدة)',
//               icon: Icons.flight,
//               rotatedIcon: true,
//             ),
//             SizedBox(height: 12),
//             _FormField(
//               label: 'رحيل',
//               value: 'الاثنين، مارس 10، 2025',
//               icon: Icons.calendar_today,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRoundTripForm() {
//     return Column(
//       children: [
//         Card(
//           elevation: 2,
//           shadowColor: Colors.black12,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.center,
//               children: [
//                 Column(
//                   children: const [
//                     _FormField(
//                       label: 'من',
//                       value: 'مطار علامة إقبال (LHE)',
//                       icon: Icons.flight,
//                     ),
//                     SizedBox(height: 12),
//                     _FormField(
//                       label: 'إلى',
//                       value: 'مطار جدة (جدة)',
//                       icon: Icons.flight,
//                       rotatedIcon: true,
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   left: -8,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.grey[300]!),
//                     ),
//                     child: const Icon(Icons.swap_vert, color: Colors.black54),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         Card(
//           elevation: 2,
//           shadowColor: Colors.black12,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: const [
//                 _FormField(
//                   label: 'رحيل',
//                   value: 'الاثنين، مارس 10، 2025',
//                   icon: Icons.calendar_today,
//                 ),
//                 SizedBox(height: 12),
//                 _FormField(
//                   label: 'العودة',
//                   value: 'السبت، مارس 15، 2025',
//                   icon: Icons.calendar_today,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMultiCityForm() {
//     return Column(
//       children: [
//         ListView.separated(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: _multiCityFlights.length,
//           separatorBuilder: (context, index) => const SizedBox(height: 24),
//           itemBuilder: (context, index) {
//             final flight = _multiCityFlights[index];
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'رحلة ${index + 1}',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Card(
//                   elevation: 2,
//                   shadowColor: Colors.black12,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         _FormField(
//                           label: 'من',
//                           value: flight.from,
//                           icon: Icons.flight,
//                         ),
//                         const SizedBox(height: 12),
//                         _FormField(
//                           label: 'إلى',
//                           value: flight.to,
//                           icon: Icons.flight,
//                           rotatedIcon: true,
//                         ),
//                         const SizedBox(height: 12),
//                         _FormField(
//                           label: 'رحيل',
//                           value: flight.date,
//                           icon: Icons.calendar_today,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//         const SizedBox(height: 16),
//         OutlinedButton.icon(
//           onPressed: _addFlightSegment,
//           icon: const Icon(
//             Icons.add_circle_outline,
//             color: AppColors.mainColor,
//           ),
//           label: const Text(
//             'أضف رحلة',
//             style: TextStyle(
//               color: AppColors.mainColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           style: OutlinedButton.styleFrom(
//             minimumSize: const Size(double.infinity, 50),
//             side: const BorderSide(color: AppColors.mainColor, width: 1.5),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPassengerSection() {
//     return Card(
//       elevation: 2,
//       shadowColor: Colors.black12,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             _PassengerCounter(
//               label: 'بالغ',
//               description: 'الأعمار 12 سنة أو أكثر',
//               count: adults,
//               onIncrement: () => setState(() => adults++),
//               onDecrement: () => setState(() => adults > 1 ? adults-- : null),
//             ),
//             const Divider(height: 1),
//             _PassengerCounter(
//               label: 'أطفال',
//               description: 'من 2 - 11 سنة',
//               count: children,
//               onIncrement: () => setState(() => children++),
//               onDecrement: () =>
//                   setState(() => children > 0 ? children-- : null),
//             ),
//             const Divider(height: 1),
//             _PassengerCounter(
//               label: 'أطفال حديثي الولادة',
//               description: 'تحت السنتين',
//               count: infants,
//               onIncrement: () => setState(() => infants++),
//               onDecrement: () => setState(() => infants > 0 ? infants-- : null),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _FormField extends StatelessWidget {
//   final String label;
//   final String value;
//   final IconData icon;
//   final bool rotatedIcon;

//   const _FormField({
//     Key? key,
//     required this.label,
//     required this.value,
//     required this.icon,
//     this.rotatedIcon = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 12),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 value,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Transform.rotate(
//           angle: rotatedIcon ? 1.5708 : 0, // 90 degrees in radians
//           child: Icon(icon, color: AppColors.mainColor),
//         ),
//         const SizedBox(width: 8),
//         Icon(Icons.expand_more, color: Colors.grey[400]),
//       ],
//     );
//   }
// }

// class _PassengerCounter extends StatelessWidget {
//   final String label;
//   final String description;
//   final int count;
//   final VoidCallback onIncrement;
//   final VoidCallback onDecrement;

//   const _PassengerCounter({
//     Key? key,
//     required this.label,
//     required this.description,
//     required this.count,
//     required this.onIncrement,
//     required this.onDecrement,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   description,
//                   style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               _buildCounterButton(Icons.remove, onDecrement),
//               SizedBox(
//                 width: 40,
//                 child: Center(
//                   child: Text(
//                     '$count',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               _buildCounterButton(Icons.add, onIncrement),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
//     return InkWell(
//       onTap: onPressed,
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         width: 30,
//         height: 30,
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           shape: BoxShape.circle,
//         ),
//         child: Icon(icon, size: 18, color: Colors.black87),
//       ),
//     );
//   }
// }

// class FlightSegment {
//   final int id;
//   final String from;
//   final String to;
//   final String date;

//   FlightSegment({
//     required this.id,
//     required this.from,
//     required this.to,
//     required this.date,
//   });
// }
//! ****************
// import 'package:flight_app/common/custom_utiles/colors.dart';
// import 'package:flight_app/common/custom_utiles/functions_utils.dart';
// import 'package:flight_app/common/custom_widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // A placeholder for the destination view
// class ScheduledTripsView extends StatelessWidget {
//   const ScheduledTripsView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: const Text("Scheduled Trips")));
//   }
// }

// // --- Main Flight Booking View ---

// class FlightBookingView extends StatefulWidget {
//   const FlightBookingView({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _FlightBookingViewState createState() => _FlightBookingViewState();
// }

// class _FlightBookingViewState extends State<FlightBookingView>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   // State for passengers
//   int adults = 1;
//   int children = 0;
//   int infants = 0;

//   // State for multi-city flights
//   final List<FlightSegment> _multiCityFlights = [
//     FlightSegment(
//       id: 1,
//       from: 'مطار علامة إقبال (LHE)',
//       to: 'مطار جدة (جدة)',
//       date: 'الاثنين، مارس 10، 2025',
//     ),
//     FlightSegment(
//       id: 2,
//       from: 'مطار علامة إقبال (LHE)',
//       to: 'مطار جدة (جدة)',
//       date: 'الاثنين، مارس 10، 2025',
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void _addFlightSegment() {
//     setState(() {
//       _multiCityFlights.add(
//         FlightSegment(
//           id: DateTime.now().millisecondsSinceEpoch,
//           from: 'مطار علامة إقبال (LHE)',
//           to: 'مطار جدة (جدة)',
//           date: 'الاثنين، مارس 10، 2025',
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             title: const Text('أحجز رحلتك'),
//             centerTitle: true,
//             elevation: 2.0,
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(screenHeight(14)),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth(25),
//                   vertical: screenHeight(100),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.all(screenWidth(90)),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(screenWidth(30)),
//                   ),
//                   child: TabBar(
//                     controller: _tabController,
//                     indicator: BoxDecoration(
//                       color: AppColors.mainColor,
//                       borderRadius: BorderRadius.circular(screenWidth(40)),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 4,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     labelColor: Colors.white,
//                     unselectedLabelColor: Colors.black87,
//                     labelStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: screenWidth(28),
//                     ),
//                     labelPadding: EdgeInsets.symmetric(
//                       horizontal: screenWidth(50),
//                     ),
//                     tabs: const [
//                       Tab(text: 'طريق واحد'),
//                       Tab(text: 'رحلة دائرية'),
//                       Tab(text: 'مدينة متعددة'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 _buildTabContent(_buildOneWayForm()),
//                 _buildTabContent(_buildRoundTripForm()),
//                 _buildTabContent(_buildMultiCityForm()),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabContent(Widget form) {
//     return Padding(
//       padding: EdgeInsets.all(screenWidth(25)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           form,
//           SizedBox(height: screenHeight(35)),
//           Text(
//             'الراكب',
//             style: TextStyle(
//               fontSize: screenWidth(22),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: screenHeight(100)),
//           _buildPassengerSection(),
//           SizedBox(height: screenHeight(20)),
//           CustomButton(
//             buttonText: 'بحث',
//             onTap: () {
//               Get.to(() => const ScheduledTripsView());
//             },
//           ),
//           SizedBox(height: screenHeight(50)),
//         ],
//       ),
//     );
//   }

//   Widget _buildOneWayForm() {
//     return Card(
//       elevation: 2,
//       shadowColor: Colors.black12,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(screenWidth(30)),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(screenWidth(25)),
//         child: Column(
//           children: [
//             const _FormField(
//               label: 'من',
//               value: 'مطار علامة إقبال (LHE)',
//               icon: Icons.flight,
//             ),
//             SizedBox(height: screenHeight(70)),
//             const _FormField(
//               label: 'إلى',
//               value: 'مطار جدة (جدة)',
//               icon: Icons.flight,
//               rotatedIcon: true,
//             ),
//             SizedBox(height: screenHeight(70)),
//             const _FormField(
//               label: 'رحيل',
//               value: 'الاثنين، مارس 10، 2025',
//               icon: Icons.calendar_today,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRoundTripForm() {
//     return Column(
//       children: [
//         Card(
//           elevation: 2,
//           shadowColor: Colors.black12,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(screenWidth(30)),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(screenWidth(25)),
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.center,
//               children: [
//                 Column(
//                   children: [
//                     const _FormField(
//                       label: 'من',
//                       value: 'مطار علامة إقبال (LHE)',
//                       icon: Icons.flight,
//                     ),
//                     SizedBox(height: screenHeight(70)),
//                     const _FormField(
//                       label: 'إلى',
//                       value: 'مطار جدة (جدة)',
//                       icon: Icons.flight,
//                       rotatedIcon: true,
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   left: -screenWidth(50),
//                   child: Container(
//                     padding: const EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.grey[300]!),
//                     ),
//                     child: const Icon(Icons.swap_vert, color: Colors.black54),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: screenHeight(50)),
//         Card(
//           elevation: 2,
//           shadowColor: Colors.black12,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(screenWidth(30)),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(screenWidth(25)),
//             child: Column(
//               children: [
//                 const _FormField(
//                   label: 'رحيل',
//                   value: 'الاثنين، مارس 10، 2025',
//                   icon: Icons.calendar_today,
//                 ),
//                 SizedBox(height: screenHeight(70)),
//                 const _FormField(
//                   label: 'العودة',
//                   value: 'السبت، مارس 15، 2025',
//                   icon: Icons.calendar_today,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMultiCityForm() {
//     return Column(
//       children: [
//         ListView.separated(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: _multiCityFlights.length,
//           separatorBuilder: (context, index) =>
//               SizedBox(height: screenHeight(35)),
//           itemBuilder: (context, index) {
//             final flight = _multiCityFlights[index];
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'رحلة ${index + 1}',
//                   style: TextStyle(
//                     fontSize: screenWidth(22),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight(100)),
//                 Card(
//                   elevation: 2,
//                   shadowColor: Colors.black12,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(screenWidth(30)),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(screenWidth(25)),
//                     child: Column(
//                       children: [
//                         _FormField(
//                           label: 'من',
//                           value: flight.from,
//                           icon: Icons.flight,
//                         ),
//                         SizedBox(height: screenHeight(70)),
//                         _FormField(
//                           label: 'إلى',
//                           value: flight.to,
//                           icon: Icons.flight,
//                           rotatedIcon: true,
//                         ),
//                         SizedBox(height: screenHeight(70)),
//                         _FormField(
//                           label: 'رحيل',
//                           value: flight.date,
//                           icon: Icons.calendar_today,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//         SizedBox(height: screenHeight(50)),
//         OutlinedButton.icon(
//           onPressed: _addFlightSegment,
//           icon: const Icon(
//             Icons.add_circle_outline,
//             color: AppColors.mainColor,
//           ),
//           label: const Text(
//             'أضف رحلة',
//             style: TextStyle(
//               color: AppColors.mainColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           style: OutlinedButton.styleFrom(
//             minimumSize: Size(double.infinity, screenHeight(16)),
//             side: const BorderSide(color: AppColors.mainColor, width: 1.5),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(screenWidth(30)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPassengerSection() {
//     return Card(
//       elevation: 2,
//       shadowColor: Colors.black12,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(screenWidth(30)),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: screenWidth(25)),
//         child: Column(
//           children: [
//             _PassengerCounter(
//               label: 'بالغ',
//               description: 'الأعمار 12 سنة أو أكثر',
//               count: adults,
//               onIncrement: () => setState(() => adults++),
//               onDecrement: () => setState(() => adults > 1 ? adults-- : null),
//             ),
//             const Divider(height: 1),
//             _PassengerCounter(
//               label: 'أطفال',
//               description: 'من 2 - 11 سنة',
//               count: children,
//               onIncrement: () => setState(() => children++),
//               onDecrement: () =>
//                   setState(() => children > 0 ? children-- : null),
//             ),
//             const Divider(height: 1),
//             _PassengerCounter(
//               label: 'أطفال حديثي الولادة',
//               description: 'تحت السنتين',
//               count: infants,
//               onIncrement: () => setState(() => infants++),
//               onDecrement: () => setState(() => infants > 0 ? infants-- : null),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _FormField extends StatelessWidget {
//   final String label;
//   final String value;
//   final IconData icon;
//   final bool rotatedIcon;

//   const _FormField({
//     Key? key,
//     required this.label,
//     required this.value,
//     required this.icon,
//     this.rotatedIcon = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(
//                   color: Colors.grey[600],
//                   fontSize: screenWidth(32),
//                 ),
//               ),
//               SizedBox(height: screenHeight(400)),
//               Text(
//                 value,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: screenWidth(24),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Transform.rotate(
//           angle: rotatedIcon ? 1.5708 : 0, // 90 degrees in radians
//           child: Icon(icon, color: AppColors.mainColor),
//         ),
//         SizedBox(width: screenWidth(50)),
//         Icon(Icons.expand_more, color: Colors.grey[400]),
//       ],
//     );
//   }
// }

// class _PassengerCounter extends StatelessWidget {
//   final String label;
//   final String description;
//   final int count;
//   final VoidCallback onIncrement;
//   final VoidCallback onDecrement;

//   const _PassengerCounter({
//     Key? key,
//     required this.label,
//     required this.description,
//     required this.count,
//     required this.onIncrement,
//     required this.onDecrement,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: screenHeight(70)),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   label,
//                   style: TextStyle(
//                     fontSize: screenWidth(24),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   description,
//                   style: TextStyle(
//                     fontSize: screenWidth(32),
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               _buildCounterButton(Icons.remove, onDecrement),
//               SizedBox(
//                 width: screenWidth(10),
//                 child: Center(
//                   child: Text(
//                     '$count',
//                     style: TextStyle(
//                       fontSize: screenWidth(22),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               _buildCounterButton(Icons.add, onIncrement),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
//     return InkWell(
//       onTap: onPressed,
//       borderRadius: BorderRadius.circular(screenWidth(26)),
//       child: Container(
//         width: screenWidth(13),
//         height: screenWidth(13),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           shape: BoxShape.circle,
//         ),
//         child: Icon(icon, size: screenWidth(22), color: Colors.black87),
//       ),
//     );
//   }
// }

// class FlightSegment {
//   final int id;
//   final String from;
//   final String to;
//   final String date;

//   FlightSegment({
//     required this.id,
//     required this.from,
//     required this.to,
//     required this.date,
//   });
// }
//! **************************************
import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/booking_feature/views/departure_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// --------- Screen Utils -------------
double screenWidth(double value) {
  return Get.size.width * (value / 100); // value = percentage
}

double screenHeight(double value) {
  return Get.size.height * (value / 100); // value = percentage
}

// --------- Flight Booking View -------------
class FlightBookingView extends StatefulWidget {
  const FlightBookingView({super.key});

  @override
  _FlightBookingViewState createState() => _FlightBookingViewState();
}

class _FlightBookingViewState extends State<FlightBookingView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int adults = 1;
  int children = 0;
  int infants = 0;

  final List<FlightSegment> _multiCityFlights = [
    FlightSegment(
      id: 1,
      from: 'مطار علامة إقبال (LHE)',
      to: 'مطار جدة (جدة)',
      date: 'الاثنين، مارس 10، 2025',
    ),
    FlightSegment(
      id: 2,
      from: 'مطار علامة إقبال (LHE)',
      to: 'مطار جدة (جدة)',
      date: 'الاثنين، مارس 10، 2025',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addFlightSegment() {
    setState(() {
      _multiCityFlights.add(
        FlightSegment(
          id: DateTime.now().millisecondsSinceEpoch,
          from: 'مطار علامة إقبال (LHE)',
          to: 'مطار جدة (جدة)',
          date: 'الاثنين، مارس 10، 2025',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Padding(
              padding: EdgeInsets.only(top: screenHeight(2)),
              child: Text(
                'أحجز رحلتك',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            centerTitle: true,
            elevation: 2,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight(12)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(5),
                  vertical: screenHeight(2),
                ),
                child: Container(
                  padding: EdgeInsets.all(screenWidth(3)),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(screenWidth(5)),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(screenWidth(5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black87,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth(4),
                    ),
                    tabs: [
                      Container(width: 120, child: Tab(text: 'طريق واحد')),
                      Container(width: 120, child: Tab(text: 'رحلة دائرية')),
                      Container(width: 120, child: Tab(text: 'مدينة متعددة')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent(_buildOneWayForm()),
                _buildTabContent(_buildRoundTripForm()),
                _buildTabContent(_buildMultiCityForm()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(Widget form) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(screenWidth(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            form,
            SizedBox(height: screenHeight(2)),
            Text(
              'الراكب',
              style: TextStyle(
                fontSize: screenWidth(4),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight(2)),
            _buildPassengerSection(),
            SizedBox(height: screenHeight(2)),
            CustomButton(
              buttonText: 'بحث',
              onTap: () {
                Get.to(() => DepartureView());
              },
            ),
            SizedBox(height: screenHeight(2)),
          ],
        ),
      ),
    );
  }

  Widget _buildOneWayForm() {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth(5)),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth(3)),
        child: Column(
          children: const [
            _FormField(
              label: 'من',
              value: 'مطار علامة إقبال (LHE)',
              icon: Icons.flight,
            ),
            _FormField(
              label: 'إلى',
              value: 'مطار جدة (جدة)',
              icon: Icons.flight,
              rotatedIcon: true,
            ),
            _FormField(
              label: 'رحيل',
              value: 'الاثنين، مارس 10، 2025',
              icon: Icons.calendar_today,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundTripForm() {
    return Column(
      children: [
        Card(
          elevation: 2,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth(5)),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth(3)),
            child: Column(
              children: const [
                _FormField(
                  label: 'من',
                  value: 'مطار علامة إقبال (LHE)',
                  icon: Icons.flight,
                ),
                _FormField(
                  label: 'إلى',
                  value: 'مطار جدة (جدة)',
                  icon: Icons.flight,
                  rotatedIcon: true,
                ),
                _FormField(
                  label: 'رحيل',
                  value: 'الاثنين، مارس 10، 2025',
                  icon: Icons.calendar_today,
                ),
                _FormField(
                  label: 'العودة',
                  value: 'السبت، مارس 15، 2025',
                  icon: Icons.calendar_today,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMultiCityForm() {
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _multiCityFlights.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: screenHeight(2)),
          itemBuilder: (context, index) {
            final flight = _multiCityFlights[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'رحلة ${index + 1}',
                  style: TextStyle(
                    fontSize: screenWidth(4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  elevation: 2,
                  shadowColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth(3)),
                    child: Column(
                      children: [
                        _FormField(
                          label: 'من',
                          value: flight.from,
                          icon: Icons.flight,
                        ),
                        _FormField(
                          label: 'إلى',
                          value: flight.to,
                          icon: Icons.flight,
                          rotatedIcon: true,
                        ),
                        _FormField(
                          label: 'رحيل',
                          value: flight.date,
                          icon: Icons.calendar_today,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: screenHeight(2)),
        OutlinedButton.icon(
          onPressed: _addFlightSegment,
          icon: const Icon(
            Icons.add_circle_outline,
            color: AppColors.mainColor,
          ),
          label: const Text(
            'أضف رحلة',
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, screenHeight(5)),
            side: const BorderSide(color: AppColors.mainColor, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth(5)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPassengerSection() {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth(5)),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth(3)),
        child: Column(
          children: [
            _PassengerCounter(
              label: 'بالغ',
              description: 'الأعمار 12 سنة أو أكثر',
              count: adults,
              onIncrement: () => setState(() => adults++),
              onDecrement: () => setState(() => adults > 1 ? adults-- : null),
            ),
            const Divider(height: 1),
            _PassengerCounter(
              label: 'أطفال',
              description: 'من 2 - 11 سنة',
              count: children,
              onIncrement: () => setState(() => children++),
              onDecrement: () =>
                  setState(() => children > 0 ? children-- : null),
            ),
            const Divider(height: 1),
            _PassengerCounter(
              label: 'أطفال حديثي الولادة',
              description: 'تحت السنتين',
              count: infants,
              onIncrement: () => setState(() => infants++),
              onDecrement: () => setState(() => infants > 0 ? infants-- : null),
            ),
          ],
        ),
      ),
    );
  }
}

// --------- Form Field Widget -------------
class _FormField extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool rotatedIcon;

  const _FormField({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    this.rotatedIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight(1)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: screenWidth(3.5),
                  ),
                ),
                SizedBox(height: screenHeight(1)),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth(3.5),
                  ),
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: rotatedIcon ? 1.5708 : 0,
            child: Icon(icon, color: AppColors.mainColor),
          ),
          SizedBox(width: screenWidth(3)),
          Icon(Icons.expand_more, color: Colors.grey[400]),
        ],
      ),
    );
  }
}

// --------- Passenger Counter Widget -------------
class _PassengerCounter extends StatelessWidget {
  final String label;
  final String description;
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _PassengerCounter({
    Key? key,
    required this.label,
    required this.description,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight(1)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: screenWidth(3.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: screenWidth(3.5),
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildCounterButton(Icons.remove, onDecrement),
              SizedBox(
                width: screenWidth(2),
                child: Center(
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: screenWidth(3.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _buildCounterButton(Icons.add, onIncrement),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(screenWidth(5)),
      child: Container(
        width: screenWidth(8),
        height: screenWidth(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: screenWidth(4), color: Colors.black87),
      ),
    );
  }
}

// --------- Flight Segment Model -------------
class FlightSegment {
  final int id;
  final String from;
  final String to;
  final String date;

  FlightSegment({
    required this.id,
    required this.from,
    required this.to,
    required this.date,
  });
}
