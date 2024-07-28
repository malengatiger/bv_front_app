import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:badges/badges.dart' as bd;
import 'package:bv_front_app/ui/surveys/survey_template_selector.dart';
import 'package:bv_front_app/util/dialogs.dart';
import 'package:bv_front_app/util/styles.dart';
import 'package:bv_front_app/widgets/busy_indicator.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../data/models.dart';
import '../../services/auth_service.dart';
import '../../services/data_service.dart';
import '../../util.dart';
import '../../util/gaps.dart';
import '../../util/toasts.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  DataService dataService = GetIt.instance<DataService>();
  SurveyTemplate? surveyTemplate;
  List<SurveyTemplate> surveyTemplates = [];
  bool busy = false;
  static const mm = ' 🍎🍎 🍎🍎SurveyPage  🍎🍎';
  AuthService authService = GetIt.instance<AuthService>();

  @override
  void initState() {
    super.initState();
    _getTemplates();
  }

  Future _getTemplates() async {
    setState(() {
      busy = true;
    });
    await authService.signInTemporary();

    try {
      var resultList = await dataService.getAllDocuments('SurveyTemplates');
      pp('$mm  surveyTemplates found: ${resultList.length}');

      for (var survey in resultList) {
        survey['sections'].forEach((sec) {
          sec['rows'].forEach((r) {
            r['rating'] = 0;
          });
        });
        surveyTemplates.add(SurveyTemplate.fromJson(survey));
      }

      surveyTemplates.sort((a, b) => b.date!.compareTo(a.date!));
      // for (var value in surveyTemplates) {
      //   pp('$mm  ${value.toJson()}');
      // }
    } catch (e, s) {
      pp('$mm ... we fucked, Boss! - $e - $s');
      if (mounted) {
        showErrorDialog(context, '$e');
      }
    }
    setState(() {
      busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bidvest Supplier Programme'),
        actions: [
          IconButton(onPressed: (){
            _getTemplates();
          }, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ScreenTypeLayout.builder(
              mobile: (ctx) {
                return Container(color: Colors.red);
              },
              tablet: (ctx) {
                return OrientationLayoutBuilder(
                  portrait: (ctx) {
                    return MainRow(
                        isDropDown: false,
                        surveyTemplates: surveyTemplates,
                        onTemplateSelected: (template) {
                          pp('$mm template selected: ${template.name}');
                        },
                        widthLeft: (width / 2) - 48,
                        widthRight: (width / 2) - 20);
                  },
                  landscape: (ctx) {
                    return MainRow(
                        isDropDown: false,
                        surveyTemplates: surveyTemplates,
                        onTemplateSelected: (template) {
                          pp('$mm template selected: ${template.name}');
                        },
                        widthLeft: (width / 2) - 60,
                        widthRight: (width / 2) - 20);
                  },
                );
              },
              desktop: (ctx) {
                return Stack(
                  children: [
                    MainRow(
                        isDropDown: false,
                        surveyTemplates: surveyTemplates,
                        onTemplateSelected: (template) {
                          pp('$mm template selected: ${template.name}');
                        },
                        widthLeft: (width / 2) - 80,
                        widthRight: (width / 2) - 20),
                  ],
                );
              },
            ),
            busy
                ? const Positioned(
                    child: Center(
                    child: BusyIndicator(),
                  ))
                : gapH16,
          ],
        ),
      ),
    );
  }
}

class MainRow extends StatefulWidget {
  const MainRow(
      {super.key,
      required this.isDropDown,
      required this.surveyTemplates,
      required this.onTemplateSelected,
      required this.widthLeft,
      required this.widthRight});

  final bool isDropDown;
  final List<SurveyTemplate> surveyTemplates;
  final Function(SurveyTemplate) onTemplateSelected;
  final double widthLeft, widthRight;

  @override
  State<MainRow> createState() => _MainRowState();
}

class _MainRowState extends State<MainRow> {
  SurveyTemplate? surveyTemplate;
  bool busy = false;

  DataService dataService = GetIt.instance<DataService>();

  _onSubmit() async {
    pp('_onSubmit:  🍀 🍀 🍀 Submit filled survey ... ${surveyTemplate!.toJson()}');
    //todo - count response ratings NOT set
    int count = 0;
    for (var section in surveyTemplate!.sections) {
      for (var value in section.rows) {
        if (value.rating == 0) {
          count++;
        }
      }
    }
    pp('_onSubmit:  👿 👿 👿 Ratings not completed:  $count  👿');

    if (count > 0) {
      showToast(
          backgroundColor: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
          padding: 20.0,
          message:
              'Please respond to all texts; you are missing $count responses',
          context: context);
      return;
    }

    var surveyResponse = SurveyResponse(
        surveyTemplateId: surveyTemplate?.surveyTemplateId,
        name: surveyTemplate?.name,
        date: DateTime.now().toUtc().toIso8601String(),
        surveyId: '${DateTime.now().toUtc().millisecondsSinceEpoch}',
        surveyTemplate: surveyTemplate);

    setState(() {
      busy = true;
    });
    try {
      var res = await dataService.addDocument(
          'SurveyResponses', surveyResponse.toJson());
      pp('_onSubmit:  🍀 🍀 🍀dataService.addDocument: result: $res');
    } catch (e) {
      pp(e);
      if (mounted) {
        showErrorDialog(context, '$e');
      }
    }

    setState(() {
      busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: widget.widthLeft,
              child: SurveyTemplateSelector(widget.surveyTemplates, (t) {
                pp(' 🥐 🥐 🥐MainRow: template selected:  🥐 ${t.name}');

                setState(() {
                  surveyTemplate = t;
                });
                widget.onTemplateSelected(t);
              }, isDropDown: widget.isDropDown),
            ),
            gapW32,
            busy
                ? const BusyIndicator(
                    caption: '🍎🍎 submitting survey response ...',
                  )
                : surveyTemplate == null
                    ? gapH32
                    : SizedBox(
                        width: widget.widthRight,
                        child: SurveyForm(
                          surveyTemplate: surveyTemplate!,
                          onSubmit: () {
                            _onSubmit();
                          },
                        )),
          ],
        ),
      ),
    );
  }
}

class SurveyForm extends StatelessWidget {
  const SurveyForm(
      {super.key, required this.surveyTemplate, required this.onSubmit});

  static const mm = '🎽🎽🎽SurveyForm 🎽';
  final SurveyTemplate surveyTemplate;
  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    List<AccordionSection> list = [];
    for (var section in surveyTemplate.sections) {
      double mHeight = 64.0 * section.rows.length;
      list.add(AccordionSection(
          header: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${section.name}',
                  style: myTextStyleMediumLargeWithSize(context, 20),
                ),
                bd.Badge(
                  badgeStyle: const bd.BadgeStyle(elevation: 12.0),
                  badgeContent: Text(
                    '${section.rows.length}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w100),
                  ),
                ),
              ],
            ),
          ),
          content: SizedBox(
              height: mHeight,
              child: ListView.builder(
                  itemCount: section.rows.length,
                  itemBuilder: (_, index) {
                    var row = section.rows[index];
                    return SurveyRowForm(
                        surveyRow: row,
                        onRatingDone: (r) {
                          pp('$mm ... rating has been done: 🌺 $r  🌺 ... for row: ${row.toJson()}');
                        });
                  }))));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${surveyTemplate.name}',
          style: myTextStyleMediumBoldWithColor(
              context: context, color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          width: 300,
          child: ElevatedButton(
              style: const ButtonStyle(
                elevation: WidgetStatePropertyAll(8),
              ),
              onPressed: () {
                onSubmit();
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Submit Survey'),
              )),
        ),
        Expanded(
          child: Accordion(
            contentBorderWidth: 3,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: list,
          ),
        ),
      ],
    );
  }
}

class SurveyRowForm extends StatefulWidget {
  const SurveyRowForm(
      {super.key, required this.surveyRow, required this.onRatingDone});

  final SurveyRow surveyRow;
  final Function onRatingDone;

  @override
  State<SurveyRowForm> createState() => _SurveyRowFormState();
}

class _SurveyRowFormState extends State<SurveyRowForm> {
  int? rating;
  static const mm = '♻️♻️♻️SurveyRowForm';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text('${widget.surveyRow.text}')),
            // RatingDropdown(onSelected: (r){}),
            RatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              onRatingChanged: (value) {
                pp('.... onRating .... $value');
                widget.surveyRow.rating = value.toInt();
                setState(() {
                  rating = value.toInt();
                });
                widget.onRatingDone(rating);
              },
              initialRating: 0,
              maxRating: 5,
              isHalfAllowed: false,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class RatingDropdown extends StatelessWidget {
  const RatingDropdown({super.key, required this.onSelected});

  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> items = [];
    for (var i = 0; i < 10; i++) {
      items.add(DropdownMenuItem<int>(value: i + 1, child: Text('${i + 1}')));
    }
    return DropdownButton(
        items: items,
        onChanged: (m) {
          if (m != null) {
            onSelected(m);
          }
        });
  }
}

class YesNo extends StatefulWidget {
  const YesNo({super.key, required this.onSelected});

  final Function(int) onSelected;

  @override
  State<YesNo> createState() => _YesNoState();
}

class _YesNoState extends State<YesNo> {
  int? selectedOption; // Make selectedOption nullable

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RadioListTile(
            value: 1,
            title: const Text('Yes'),
            groupValue: selectedOption, // Use selectedOption here
            onChanged: (value) {
              setState(() {
                selectedOption = value; // Update selectedOption in setState
              });
              widget.onSelected(value!); // Pass the selected value
            }),
        RadioListTile(
            value: -1,
            groupValue: selectedOption, // Use selectedOption here
            title: const Text('No'),
            onChanged: (value) {
              setState(() {
                selectedOption = value; // Update selectedOption in setState
              });
              widget.onSelected(value!); // Pass the selected value
            }),
      ],
    );
  }
}

class PositiveNegative extends StatelessWidget {
  const PositiveNegative({super.key, required this.onSelected});

  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    int selectedOption = 0;
    return SizedBox(
      width: 160,
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Radio<int>(
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    if (value != null) {
                      selectedOption = value;
                      onSelected(selectedOption);
                    }
                  }),
              const Text('Positive')
            ],
          ),
          Row(
            children: [
              Radio<int>(
                  value: -1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    if (value != null) {
                      selectedOption = value;
                      onSelected(selectedOption);
                    }
                  }),
              const Text('Negative'),
            ],
          ),
        ],
      ),
    );
  }
}

class ResponseWidgetList extends StatelessWidget {
  const ResponseWidgetList(
      {super.key,
      required this.onRating,
      required this.onYesNo,
      required this.onPositiveNegative});

  final Function(int) onRating;
  final Function(int) onYesNo;
  final Function(int) onPositiveNegative;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 180,
      child: ListView(
        children: [
          gapH16,
          RatingBar(
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            onRatingChanged: (value) {
              pp('.... onRating .... $value');
            },
            initialRating: 0,
            maxRating: 5,
          ),
          gapH16,
          PositiveNegative(onSelected: (pos) {
            onPositiveNegative(pos);
          }),
          gapH16,
          YesNo(onSelected: (y) {
            onYesNo(y);
          }),
        ],
      ),
    );
  }
}
