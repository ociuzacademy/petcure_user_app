import 'package:flutter/material.dart';

class FormattedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  const FormattedText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle =
        style ??
        const TextStyle(fontSize: 16, color: Colors.black, height: 1.4);

    return _buildFormattedContent(text, defaultStyle);
  }

  Widget _buildFormattedContent(String text, TextStyle baseStyle) {
    final lines = text.split('\n');
    final widgets = <Widget>[];
    bool inList = false;

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];

      if (line.trim().isEmpty) {
        widgets.add(const SizedBox(height: 8));
        continue;
      }

      // Check for bullet points
      if (line.trim().startsWith('* ') || line.trim().startsWith('- ')) {
        if (!inList) {
          inList = true;
        }

        final bulletContent = line.trim().substring(2);
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: _parseInlineFormatting(bulletContent, baseStyle),
                ),
              ],
            ),
          ),
        );
      }
      // Check for numbered lists
      else if (RegExp(r'^\d+\.\s').hasMatch(line.trim())) {
        if (!inList) {
          inList = true;
        }

        final match = RegExp(r'^(\d+)\.\s(.*)').firstMatch(line.trim())!;
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${match.group(1)}. ',
                  style: baseStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: _parseInlineFormatting(match.group(2)!, baseStyle),
                ),
              ],
            ),
          ),
        );
      }
      // Check for bold text
      else if (line.contains('**')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _parseInlineFormatting(line, baseStyle),
          ),
        );
        inList = false;
      }
      // Regular text
      else {
        if (inList && (line.startsWith('    ') || line.startsWith('\t'))) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 4.0),
              child: _parseInlineFormatting(line.trim(), baseStyle),
            ),
          );
        } else {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _parseInlineFormatting(line, baseStyle),
            ),
          );
          inList = false;
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Widget _parseInlineFormatting(String text, TextStyle baseStyle) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'\*\*(.*?)\*\*');
    var currentIndex = 0;

    while (true) {
      final match = regex.firstMatch(text.substring(currentIndex));
      if (match == null) break;

      final start = currentIndex + match.start;
      final end = currentIndex + match.end;

      // Add text before bold
      if (start > currentIndex) {
        spans.add(
          TextSpan(text: text.substring(currentIndex, start), style: baseStyle),
        );
      }

      // Add bold text
      spans.add(
        TextSpan(
          text: match.group(1),
          style: baseStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      );

      currentIndex = end;
    }

    // Add remaining text
    if (currentIndex < text.length) {
      spans.add(TextSpan(text: text.substring(currentIndex), style: baseStyle));
    }

    return RichText(
      text: TextSpan(children: spans, style: baseStyle),
      textAlign: textAlign,
    );
  }
}
