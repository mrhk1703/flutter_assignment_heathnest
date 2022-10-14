import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

List<Reaction<String>> userReactions = [
  Reaction<String>(
    value: 'l',
    previewIcon: _builuserdPreviewIcon(
        'assets/375-thumbs-up-1.png', 'like'),
    icon: _buildIcon('assets/375-thumbs-up-1.png'),
  ),
  Reaction<String>(
    value: 'h',
    previewIcon:
        _builuserdPreviewIcon('assets/001-grinning-face.png', 'happy'),
    icon: _buildIcon('assets/001-grinning-face.png'),
  ),
  Reaction<String>(
    value: 's',
    previewIcon:
        _builuserdPreviewIcon('assets/029-sad-but-relieved-face.png', 'sad'),
    icon: _buildIcon('assets/029-sad-but-relieved-face.png'),
  ),
  
];

final defaultInitialReaction = Reaction<String>(
  value: null,
  icon: Text('No raction'),
);

Padding _builuserdPreviewIcon(String path, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Image.asset(path, height: 30),
  );
}
Image _buildIcon(String path) {
  return Image.asset(
    path,
    height: 30,
    width: 30,
  );
}
