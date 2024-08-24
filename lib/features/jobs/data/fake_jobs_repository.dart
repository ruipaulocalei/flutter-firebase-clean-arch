import 'package:hello_flutter_mac_app/features/jobs/domain/job.dart';
import 'package:hello_flutter_mac_app/utils/constants/test_jobs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeJobsRepository {
  FakeJobsRepository._();
  static FakeJobsRepository instance = FakeJobsRepository._();
  Future<List<Job>> getJobs() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(kTestJobs);
  }
}

final jobsRepositoryProvider = Provider<FakeJobsRepository>((ref) {
  return FakeJobsRepository.instance;
});

final jobsListFutureProvider = FutureProvider<List<Job>>((ref) async {
  final jobsRepository = ref.watch(jobsRepositoryProvider);
  return jobsRepository.getJobs();
});
