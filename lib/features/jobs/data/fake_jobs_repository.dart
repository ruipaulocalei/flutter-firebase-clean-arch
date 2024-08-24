import 'package:hello_flutter_mac_app/features/jobs/domain/job.dart';
import 'package:hello_flutter_mac_app/utils/constants/test_jobs.dart';

class FakeJobsRepository {
  List<Job> getJobs() {
    return kTestJobs;
  }
}
