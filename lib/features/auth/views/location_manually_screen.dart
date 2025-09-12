import 'package:bm_user/features/auth/views/widgets/current_location_tile.dart';
import 'package:bm_user/features/auth/views/widgets/search_results_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_string_constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../../core/providers/location_provider.dart';
import '../../../core/utils/helpers/toast_helper.dart';
import '../../../core/services/location_search_service.dart';
import '../../shared/models/location_search_result.dart';
import '../../shared/widgets/custom_search_bar.dart';
import '../../nav_bar/views/bottom_nav_bar.dart';

class LocationManuallyScreen extends StatefulWidget {
  const LocationManuallyScreen({super.key});

  @override
  State<LocationManuallyScreen> createState() => _LocationManuallyScreenState();
}

class _LocationManuallyScreenState extends State<LocationManuallyScreen> {
  final TextEditingController _searchController = TextEditingController();
  final LocationSearchService _locationSearchService = LocationSearchService();

  List<LocationSearchResult> _searchResults = [];
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _handleSearchChanged(String query) async {
    if (query.isEmpty) {
      _clearSearchResults();
      return;
    }

    if (query.length < 3) return;

    await _performSearch(query);
  }

  Future<void> _performSearch(String query) async {
    if (!mounted) return;

    setState(() => _isSearching = true);

    try {
      final results = await _locationSearchService.searchLocations(query);

      if (mounted) {
        setState(() {
          _searchResults = results;
          _isSearching = false;
        });
      }
    } catch (error) {
      if (mounted) {
        setState(() => _isSearching = false);
        _showErrorMessage('Error searching locations: $error');
      }
    }
  }

  void _clearSearchResults() {
    setState(() => _searchResults = []);
  }

  void _clearSearchInput() {
    _searchController.clear();
    _clearSearchResults();
  }

  Future<void> _handleCurrentLocationTap() async {
    final locationProvider = context.read<LocationProvider>();

    try {
      final success = await locationProvider.getCurrentLocation();

      if (!mounted) return;

      if (success) {
        _showSuccessMessage('Current location set successfully!');
        await Future.delayed(const Duration(milliseconds: 500));
        _navigateToHome();
      } else {
        _showErrorMessage(
            locationProvider.errorMessage ?? 'Unable to get current location'
        );
      }
    } catch (error) {
      if (mounted) {
        _showErrorMessage('Error getting current location: $error');
      }
    }
  }

  Future<void> _handleLocationSelection(LocationSearchResult location) async {
    try {
      final locationProvider = context.read<LocationProvider>();
      locationProvider.setManualLocation(
        location.latitude,
        location.longitude,
        location.address,
      );

      if (mounted) {
        _showSuccessMessage('Location selected successfully!');
        await Future.delayed(const Duration(milliseconds: 500));
        _navigateToHome();
      }
    } catch (error) {
      if (mounted) {
        _showErrorMessage('Error setting location: $error');
      }
    }
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const BottomNavBar()),
            (route) => false,
      );
    }
  }

  void _showSuccessMessage(String message) {
    CustomToast.showSuccess(context, message);
  }

  void _showErrorMessage(String message) {
    CustomToast.showError(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LocationProvider>(
          builder: (context, locationProvider, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  CurrentLocationTile(
                    isLoading: locationProvider.isLoading,
                    onTap: _handleCurrentLocationTap,
                  ),
                  const SizedBox(height: 20),
                  _buildDivider(),
                  const SizedBox(height: 20),
                  SearchResultsSection(
                    isSearching: _isSearching,
                    searchResults: _searchResults,
                    searchQuery: _searchController.text,
                    onLocationSelected: _handleLocationSelection,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _buildSearchBar() {
    return CustomSearchBar(
      controller: _searchController,
      hintText: 'Search for a location...',
      prefixIcon: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(AssetConstants.search),
      ),
      suffixIcon: _searchController.text.isNotEmpty
          ? IconButton(
        icon: Icon(
          Icons.close,
          color: primary?.shade600 ?? Colors.blue.shade600,
        ),
        onPressed: _clearSearchInput,
      )
          : null,
      onChanged: _handleSearchChanged,
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: primary?.shade600 ?? Colors.blue.shade600,
    );
  }
}