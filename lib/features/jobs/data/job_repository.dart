
import 'package:hello_flutter_mac_app/features/jobs/domain/job.dart';

abstract class JobRepository {
  Future<List<Job>> getJobs();
  Future<void> addJob(Job job);
}