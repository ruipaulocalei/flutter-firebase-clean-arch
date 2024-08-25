import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter_mac_app/features/jobs/data/fake_jobs_repository.dart';
import 'package:hello_flutter_mac_app/utils/constants/test_jobs.dart';

void main() {
  group('FakeJobsRepository', () {
    test('get all jobs', () async {
      final jobsRepository = FakeJobsRepository.instance;
      expect(
        await jobsRepository.getJobs(),
        kTestJobs,
      );
    });
  });
}
