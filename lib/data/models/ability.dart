class AbilityModel {
  String displayIcon, slot, displayName, description;

  AbilityModel(
      {required this.displayIcon,
      required this.slot,
      required this.displayName,
      required this.description});

// factory AbilityModel.fromJson(Map<String, dynamic> json) {
//   return AbilityModel(
//     displayIcon: json["displayIcon"],
//     slot: json["slot"],
//     displayName: json["displayName"],
//     description: json["description"],
//   );
// }
//
// Map<String, dynamic> toJson() {
//   return {
//     "displayIcon": displayIcon,
//     "slot": slot,
//     "displayName": displayName,
//     "description": description,
//   };
// }
}
