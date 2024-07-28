import 'package:bv_front_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart' as bd;
import '../../data/models.dart';
import '../../util/gaps.dart';

class SurveyTemplateSelector extends StatelessWidget {
  const SurveyTemplateSelector(this.surveyTemplates, this.onSelected,
      {super.key, required this.isDropDown});

  final List<SurveyTemplate> surveyTemplates;
  final Function(SurveyTemplate) onSelected;
  final bool isDropDown;

  @override
  Widget build(BuildContext context) {
    if (isDropDown) {
      List<DropdownMenuItem<SurveyTemplate>> items = [];
      for (var action in surveyTemplates) {
        items.add(
            DropdownMenuItem(value: action, child: Text('${action.name}')));
      }
      return DropdownButton<SurveyTemplate>(
          items: items,
          hint: const Text('Select Template'),
          onChanged: (m) {
            if (m != null) {
              onSelected(m);
            }
          });
    }

    var df = DateFormat('EEEE, dd MMMM yyyy HH:mm');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          gapH32,
          Text(
            'Select Template',
            style: myTextStyleMediumBoldGrey(context),
          ),
          gapH32,
          gapH32,
          Expanded(
            child: bd.Badge(
              badgeContent: Text('${surveyTemplates.length}', style: const TextStyle(color: Colors.white),),
              badgeStyle: const bd.BadgeStyle(
                padding: EdgeInsets.all(8.0), elevation: 16,
              ),
              child: ListView.builder(
                  itemCount: surveyTemplates.length,
                  itemBuilder: (_, index) {
                    var template = surveyTemplates[index];
                    int rows = 0;
                      for (var section in template.sections) {
                        rows += section.rows.length;
                      }
                    var date = df.format(DateTime.parse(template.date!).toLocal());

                    return GestureDetector(
                      onTap: () {
                        onSelected(template);
                      },
                      child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${template.name}',
                                  style:
                                      myTextStyleMediumLargeWithSize(context, 20),
                                ),
                                gapH4,
                                Text(date,
                                    style: myTextStyle(context, Colors.grey, 14,
                                        FontWeight.normal)),
                                gapH16,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text('Sections'),
                                    Text('${template.sections.length}',
                                        style: myTextStyleMediumLargeWithSize(
                                            context, 20)),
                                    gapW32,
                                    const Text('Text/Questions'),
                                    Text('$rows',
                                        style: myTextStyleMediumLargeWithSize(
                                            context, 20)),
                                  ],
                                ),
                                gapH16,
                              ],
                            ),
                          )),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
