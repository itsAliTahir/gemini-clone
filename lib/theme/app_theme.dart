import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

String myapikey = "";

MarkdownStyleSheet mmstyle = MarkdownStyleSheet(
  // General text styles
  a: const TextStyle(color: Colors.blueAccent), // Link color
  strong: const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold), // Bold text
  p: const TextStyle(color: Colors.white), // Paragraph text
  em: const TextStyle(
      color: Colors.white70, fontStyle: FontStyle.italic), // Italic text

  // Heading styles
  h1: const TextStyle(
      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
  h2: const TextStyle(
      color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
  h3: const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  h4: const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  h5: const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
  h6: const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),

  // Blockquote styling
  blockquote: const TextStyle(color: Colors.white70),
  blockquoteAlign: WrapAlignment.start,
  blockquotePadding: const EdgeInsets.all(8.0),
  blockquoteDecoration: BoxDecoration(
    color: Colors.white10,
    borderRadius: BorderRadius.circular(8.0),
    border: const Border(left: BorderSide(color: Colors.blueAccent, width: 4)),
  ),

  // Code and codeblock styling
  code: const TextStyle(
      color: Colors.orangeAccent, backgroundColor: Colors.white10),
  codeblockPadding: const EdgeInsets.all(8.0),
  codeblockDecoration: BoxDecoration(
    color: Colors.black87,
    borderRadius: BorderRadius.circular(8.0),
  ),
  codeblockAlign: WrapAlignment.start,

  // List styling
  listBullet: const TextStyle(color: Colors.white),
  listBulletPadding: const EdgeInsets.only(right: 8.0),
  listIndent: 24.0,
  orderedListAlign: WrapAlignment.start,
  unorderedListAlign: WrapAlignment.start,

  // Horizontal rule (divider) decoration
  horizontalRuleDecoration: const BoxDecoration(
    border: Border(bottom: BorderSide(color: Colors.white24, width: 1)),
  ),

  // Table styling
  tableHead: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  tableBody: const TextStyle(color: Colors.white),
  tableHeadAlign: TextAlign.center,
  tableColumnWidth: const FlexColumnWidth(),
  tableCellsPadding: const EdgeInsets.all(8.0),
  tableCellsDecoration: BoxDecoration(
    color: Colors.black45,
    border: Border.all(color: Colors.white24),
  ),
  tableBorder: TableBorder.all(color: Colors.white30),
  tablePadding: const EdgeInsets.symmetric(vertical: 8.0),
  tableVerticalAlignment: TableCellVerticalAlignment.middle,

  // Checkbox styling
  checkbox: const TextStyle(
    color: Colors.blueAccent, // Color of the checkbox
    fontSize: 20, // Size of the checkbox
  ), // For display only; doesn't make checkboxes interactive
  textAlign: WrapAlignment.start,

  // Other padding/styling adjustments
  blockSpacing: 8.0,
  h1Align: WrapAlignment.start,
  h2Align: WrapAlignment.start,
  h3Align: WrapAlignment.start,
  h4Align: WrapAlignment.start,
  h5Align: WrapAlignment.start,
  h6Align: WrapAlignment.start,
  h1Padding: const EdgeInsets.only(bottom: 12.0),
  h2Padding: const EdgeInsets.only(bottom: 10.0),
  h3Padding: const EdgeInsets.only(bottom: 8.0),
  h4Padding: const EdgeInsets.only(bottom: 6.0),
  h5Padding: const EdgeInsets.only(bottom: 4.0),
  h6Padding: const EdgeInsets.only(bottom: 2.0),
  pPadding: const EdgeInsets.symmetric(vertical: 4.0),
);

String mmdata = """
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

This is a paragraph with **bold text**, *italic text*, and a [link](https://flutter.dev) for testing.

> This is a blockquote. It should have a background and border.

- This is a bullet point in an unordered list
  - Nested bullet point
- Another bullet point

1. This is an ordered list item
2. Another ordered list item
   1. Nested ordered list item

This is a code block:
```dart

void main() { print('Hello, Flutter!'); }

```

Inline code example: `print('Hello, world!');`

- [ ] This is an unchecked checkbox item
- [x] This is a checked checkbox item

| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Row 1    | Data     | Example  |
| Row 2    | More Data| More     |

---
""";
