typedef JobID = String;

class Job {
  final JobID id;
  final String title;
  final String description;
  final double salary;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.salary,
  });

  @override
  String toString() => 'Product(id: $id, title: $title, description: $description, salary: $salary)';
}
