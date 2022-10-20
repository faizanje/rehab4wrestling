class Constants {
  static const MAP_REGEXP = '.* id="(.*)" title="(.*)" .* d="(.*)"';
  static const MAP_SIZE_REGEXP = '<svg.* height="(.*)" width="(.*)"';
  static const ASSETS_PATH = 'packages/human_body_selector/assets';
}

List<String> kAllowedBodyParts = [
  // "head",
  // "right eye",
  // "left eye",
  // "right ear",
  // "left ear",
  // "nose",
  // "lips",
  // "chest",
  // "stomach",
  // "waist",
  // "groin",
  "neck",
  "right shoulder",
  "left shoulder",
  "right arm",
  "left arm",
  "right elbow",
  "left elbow",
  "right forearm",
  "left forearm",
  "right wrist",
  "left wrist",
  "right hand",
  "left hand",
  "right knee",
  "left knee",
  "right ankle",
  "left ankle",
  "right foot",
  "left foot",
  // "right thigh",
  // "left thigh",
  // "right leg",
  // "left leg",
];

double kCornerRadius = 10;

Map<String, String> kBodyPathToDbPathMap = {
  "neck": "Neck",
  "right shoulder": "Shoulder",
  "left shoulder": "Shoulder",
  "right arm": "Elbow",
  "left arm": "Elbow",
  "right elbow": "Elbow",
  "left elbow": "Elbow",
  "right forearm": "Hand-Wrist-Fingers-Thumb",
  "left forearm": "Hand-Wrist-Fingers-Thumb",
  "right wrist": "Hand-Wrist-Fingers-Thumb",
  "left wrist": "Hand-Wrist-Fingers-Thumb",
  "right hand": "Hand-Wrist-Fingers-Thumb",
  "left hand": "Hand-Wrist-Fingers-Thumb",
  "right knee": "Knee",
  "left knee": "Knee",
  "right ankle": "Ankle-Foot-Big Toe",
  "left ankle": "Ankle-Foot-Big Toe",
  "right foot": "Ankle-Foot-Big Toe",
  "left foot": "Ankle-Foot-Big Toe",
};
