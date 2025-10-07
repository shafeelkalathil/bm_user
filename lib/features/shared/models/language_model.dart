class LanguageModel {
  final String nativeLan;
  final String translatedLan;

  //<editor-fold desc="Data Methods">
  const LanguageModel({
    required this.nativeLan,
    required this.translatedLan,
  });


  LanguageModel copyWith({
    String? nativeLan,
    String? translatedLan,
  }) {
    return LanguageModel(
      nativeLan: nativeLan ?? this.nativeLan,
      translatedLan: translatedLan ?? this.translatedLan,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'nativeLan': this.nativeLan,
      'translatedLan': this.translatedLan,
    };
  }

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      nativeLan: map['nativeLan'] as String,
      translatedLan: map['translatedLan'] as String,
    );
  }


//</editor-fold>
}