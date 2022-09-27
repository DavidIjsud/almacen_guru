import 'package:tech_interview/features/checkout_show/data/repository/checkout_repository.dart';
import 'package:tech_interview/features/checkout_show/domain/entities/show_entity.dart';

class FetchShowCase {
  final CheckoutRepository showRepository;

  FetchShowCase({required this.showRepository});

  Future<List<ShowEntity>> fetchShows() async {
    return await showRepository.getShows();
  }
}
