import 'package:daily_track/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {
      "title": "Work Floo",
      "description":
          "Mind map for data dictionarydictionary...feifnke fkefe fenfienfke fken bk nink4vr b  in bk nrgrgmrgmrl j k nfivheele vu  leveou lf oevuoe dld oe d d e b fdj bid kd kd ud oe  ui bd d  di d u ud  pibrnov  df iu ee ddvu e dib id k d dd k dib uh ed   d h ey k du d jd dy7 du d d8 d i    u udi fu fy f df i  u idf jfui du f u jf fuh dfk df yuf f f kik u idj dfu u vjyu dfj ru rj i f f uuh fj fu f ifh j o f f  hi vf  uj cfui"
    },
    {"title": "علاج الشعر", "description": "البداية يوم 19"},
    {
      "title": "إرسال ايميل موحد",
      "description":
          "شخص عن طريق كتابة كود في جوجل شيت... function sendEmails() {...}"
    },
    {"title": "UI Task", "description": "Fix UI alignment issue..."},
    {"title": "Basnass Nanles", "description": "Details for project..."},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: DayCard(tasks: tasks),
    );
  }
}

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
    required this.tasks,
  });

  final List<Map<String, String>> tasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MasonryGridView.count(
        crossAxisCount: 2, // Two columns like Google Keep
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task["title"] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    task["description"] ?? '',
                    style: const TextStyle(fontSize: 14),
                    maxLines: 11, // Adjust for content size
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: offwhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text("programing"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
