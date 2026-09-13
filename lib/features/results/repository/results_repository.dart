import 'package:lizziedow/features/results/model/results_model.dart';

class ResultsRepository {
  const ResultsRepository();

  List<String> get topFilters => const [
    'Test Results',
    'Notes',
  ];

  List<String> get noteFilters => const [
    'Notes',
    'Questions',
  ];

  List<String> get hormones => const [
    'AMH',
    'FSH',
    'LH',
    'Oestradiol',
    'TSH',
    'Prolactin',
    'Testosterones',
    'Vitamin D',
  ];

  int get totalReportCount => 22;

  int get totalNotesCount => 22;

  int get totalQuestionsCount => 22;

  List<ResultReportData> get reports => const [
    ResultReportData(
      fileName: 'Report name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
    ResultReportData(
      fileName: 'Report name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
    ResultReportData(
      fileName: 'Report name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
    ResultReportData(
      fileName: 'Report name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
    ResultReportData(
      fileName: 'Report name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
  ];

  List<ResultNoteData> get notes => const [
    ResultNoteData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
      tags: 'Stims, Ultrasound +3 more',
    ),
    ResultNoteData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
      tags: 'Stims, Ultrasound +3 more',
    ),
    ResultNoteData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
      tags: 'Stims, Ultrasound +3 more',
    ),
    ResultNoteData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
      tags: 'Stims, Ultrasound +3 more',
    ),
    ResultNoteData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
      tags: 'Stims, Ultrasound +3 more',
    ),
  ];

  List<ResultQuestionData> get questions => const [
    ResultQuestionData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
    ),
    ResultQuestionData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
    ),
    ResultQuestionData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
    ),
    ResultQuestionData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
    ),
    ResultQuestionData(
      title: 'What are my AMH Levels???',
      date: 'Dec 4, 2019 21:42',
    ),
  ];
}
