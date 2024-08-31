import 'source.dart';

class SourcesRespones {
  final String? status;
  final List<Source>? sources;

  const SourcesRespones({this.status, this.sources});

  factory SourcesRespones.fromJson(Map<String, dynamic> json) {
    return SourcesRespones(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
