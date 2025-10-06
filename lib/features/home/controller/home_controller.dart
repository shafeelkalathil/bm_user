import 'package:bm_user/features/home/repository/home_repository.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';


final homeControllerProvider = StateNotifierProvider<HomeController, bool>((ref) {
  return HomeController(homeRepository: HomeRepository());
});

final checkUserIsLoggedInProvider = FutureProvider.autoDispose((ref) {
  return ref.watch(homeControllerProvider.notifier).checkUserIsLoggedIn();
});

class HomeController extends StateNotifier<bool> {
  final HomeRepository _homeRepository;
  HomeController({required HomeRepository homeRepository})
    : _homeRepository = homeRepository,
      super(false);

  Future<bool> checkUserIsLoggedIn() async {
    return await _homeRepository.checkUserIsLoggedIn();
  }
}
