import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../../shared/models/location_search_result.dart';
import 'location_tile.dart';

class SearchResultsSection extends StatelessWidget {
  final bool isSearching;
  final List<LocationSearchResult> searchResults;
  final String searchQuery;
  final Function(LocationSearchResult) onLocationSelected;

  const SearchResultsSection({
    super.key,
    required this.isSearching,
    required this.searchResults,
    required this.searchQuery,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return _buildLoadingIndicator();
    }

    if (searchResults.isNotEmpty) {
      return _buildSearchResults();
    }

    if (searchQuery.isNotEmpty) {
      return _buildNoResultsMessage();
    }

    return const SizedBox.shrink();
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(),
        const SizedBox(height: 10),
        _buildResultsList(),
      ],
    );
  }

  Widget _buildSectionTitle() {
    return Text(
      'Search Results',
      style: textExtraBoldContent20.copyWith(
        color: primary.shade700 ?? Colors.blue.shade700,
      ) ?? TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primary.shade700 ?? Colors.blue.shade700,
      ),
    );
  }

  Widget _buildResultsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: searchResults.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final location = searchResults[index];
        return LocationTile(
          location: location,
          onTap: () => onLocationSelected(location),
        );
      },
    );
  }

  Widget _buildNoResultsMessage() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            size: 48,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 10),
          Text(
            'No locations found',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
          Text(
            'Try searching with a different term',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}