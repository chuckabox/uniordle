import 'package:flutter/material.dart';
import 'package:uniordle/home/models/subject.dart';
import 'subject_tile.dart';

class SubjectGrid extends StatelessWidget {
  final List<Subject> subjects;
  final void Function(Subject) onSubjectTap;

  const SubjectGrid({super.key, required this.subjects, required this.onSubjectTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: subjects.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) {
        final sub = subjects[index];
        return SubjectTile(subject: sub, onTap: () => onSubjectTap(sub));
      },
    );
  }
}
