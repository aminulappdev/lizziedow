import 'package:bloc_crud/features/home/widgets/custom_button.dart';
import 'package:bloc_crud/features/home/widgets/custom_field.dart';
import 'package:bloc_crud/features/home/widgets/custom_task_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Update Task',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              CustomTextField(focusNode: FocusNode(), label: 'Update Task'),
              SizedBox(height: 16),
              CustomButton(text: 'Update', onPressed: () {}),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              Text(
                'My Task',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Organized your tasks and notes',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              SizedBox(height: height * 0.01),
              CustomTextField(focusNode: FocusNode(), label: 'Add Task'),
              SizedBox(height: height * 0.01),
              CustomButton(text: 'Add Task', onPressed: () {}),
              SizedBox(height: height * 0.01),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(0),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: height * 0.01),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      title: 'Task $index',
                      description: 'Description $index',
                      onEdit: () {
                        openBottomSheet();
                      },
                      onDelete: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
