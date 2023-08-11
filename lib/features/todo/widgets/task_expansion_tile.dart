import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';

import '../../../core/common/widgets/white_space.dart';

class TaskExpansionTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  final Color? colour;

  const TaskExpansionTile({
    super.key, 
    required this.title, 
    required this.subtitle,
    required this.children,
    this.colour
  });

  @override
  State<TaskExpansionTile> createState() => _TaskExpansionTileState();
}

class _TaskExpansionTileState extends State<TaskExpansionTile> {
  bool _customTileExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colours.lightBackground,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
                title: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 5.w,
                          decoration: BoxDecoration(
                              color: widget.colour,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        const WhiteSpace(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colours.light
                              ),
                            ),
                            Text(
                              widget.subtitle,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white54
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _customTileExpanded
                    ? const Icon(AntDesign.closecircleo)
                    : const Icon(AntDesign.circledown, color: Colors.white54),
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _customTileExpanded = expanded;
                  });
                },
                children: widget.children,
              ),
      ),
    );
  }
}