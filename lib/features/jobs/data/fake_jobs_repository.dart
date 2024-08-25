import 'package:hello_flutter_mac_app/features/jobs/domain/job.dart';
import 'package:hello_flutter_mac_app/utils/constants/test_jobs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'job_repository.dart';

class FakeJobsRepository implements JobRepository {
  FakeJobsRepository._();
  static FakeJobsRepository instance = FakeJobsRepository._();
  @override
  Future<List<Job>> getJobs() async {
    await Future.delayed(const Duration(seconds: 2));
    return kTestJobs;
  }

  @override
  Future<void> addJob(Job job) async {
    try {
      Future.delayed(const Duration(seconds: 2));
      kTestJobs.add(job);
    } catch (e) {
      throw Error();
    }
  }
}

final jobsRepositoryProvider = Provider<FakeJobsRepository>((ref) {
  return FakeJobsRepository.instance;
});

final jobsListFutureProvider = FutureProvider<List<Job>>((ref) async {
  final jobsRepository = ref.watch(jobsRepositoryProvider);
  return jobsRepository.getJobs();
});
