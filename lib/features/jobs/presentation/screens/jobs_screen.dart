import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter_mac_app/common_widgets/async_value_widget.dart';
import 'package:hello_flutter_mac_app/features/jobs/data/fake_jobs_repository.dart';
import 'package:hello_flutter_mac_app/features/jobs/domain/job.dart';

class JobScreen extends ConsumerWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final jobsListValue = ref.watch(jobsListFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jobs'.toUpperCase(),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: AsyncValueWidget<List<Job>>(
        value: jobsListValue,
        data: (jobs) => jobs.isEmpty
            ? const Center(
                child: Text('No Jobs'),
              )
            : ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  final job = jobs[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        job.title,
                      ),
                      subtitle: Text(
                        job.description,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        job.salary.toString(),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
