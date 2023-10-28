// import 'package:flutter/gestures.dart';
// import 'package:sangjishik/core_packages.dart';
// import 'package:sangjishik/controller/utils/string_utils.dart';
//
// class PostWidget extends StatefulWidget {
//   final String image;
//   final String title;
//   final DateTime date;
//   final VoidCallback onTap;
//
//   const PostWidget({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.date,
//     required this.onTap,
//   });
//
//   @override
//   State<PostWidget> createState() => _PostWidgetState();
// }
//
// //FIXME: Make special sizing for Galaxy Fold
// class _PostWidgetState extends State<PostWidget> {
//   bool isHover = false;
//   bool isBtnHover = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (PointerEnterEvent event) => setState(() {
//         isHover = true;
//       }),
//       onExit: (PointerExitEvent event) => setState(() {
//         isHover = false;
//       }),
//       child: GestureDetector(
//         onTap: widget.onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular($styles.insets.sm),
//             color: isHover ? Color.fromARGB(75, 192, 184, 171) : Colors.transparent,
//           ),
//           child: SizedBox(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.all($styles.insets.sm),
//                     child: SizedBox(
//                       height: 300,
//                       width: 500,
//                       child: Image.network(
//                         widget.image,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(widget.title, style: $styles.text.bodyBold),
//                           Text(StringUtils.formatDateTime(widget.date),
//                               style: $styles.text.body.copyWith(color: Colors.grey)),
//                         ],
//                       ),
//                       !isHover
//                           ? Container()
//                           : Flexible(
//                               child: MouseRegion(
//                                 onEnter: (PointerEnterEvent event) => setState(() {
//                                   isBtnHover = true;
//                                 }),
//                                 onExit: (PointerExitEvent event) => setState(() {
//                                   isBtnHover = false;
//                                 }),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular($styles.insets.xxs),
//                                     color: isBtnHover ? Colors.white : Color.fromARGB(255, 235, 235, 230),
//                                   ),
//                                   child: Padding(
//                                     padding: EdgeInsets.all($styles.insets.xs),
//                                     child: GestureDetector(
//                                       onTap: widget.onTap,
//                                       child: Text(
//                                         'View Post',
//                                         style: isBtnHover
//                                             ? $styles.text.bodyBold
//                                             : $styles.text.bodyBold.copyWith(color: Colors.grey[400]),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                     ],
//                   ),
//                 ),
//                 VSpace.sm,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
