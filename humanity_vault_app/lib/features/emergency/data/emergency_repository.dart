import 'package:flutter/material.dart';

import '../models/emergency_topic.dart';

/// Provides the list of emergency preparedness topics.
///
/// Content is local placeholder guidance for the MVP - no database or
/// network access is used.
class EmergencyRepository {
  static const List<EmergencyTopic> topics = [
    EmergencyTopic(
      name: 'Water',
      icon: Icons.water_drop,
      steps: [
        'Locate the nearest available water source.',
        'Filter out visible debris using cloth or a fine sieve.',
        'Boil water for at least one minute before drinking.',
        'Store purified water in clean, covered containers.',
      ],
      reminders: [
        'Never drink untreated water if a safer source is available.',
        'Boiling does not remove chemical contaminants.',
        'Ration stored water until a reliable supply is confirmed.',
      ],
    ),
    EmergencyTopic(
      name: 'Fire',
      icon: Icons.local_fire_department,
      steps: [
        'Choose a clear, sheltered spot away from flammable material.',
        'Gather dry tinder, kindling, and fuel wood in advance.',
        'Build a small, controlled flame before adding larger fuel.',
        'Keep water or sand nearby to extinguish if needed.',
      ],
      reminders: [
        'Never leave a fire unattended.',
        'Fully extinguish before leaving the area or sleeping.',
        'Use fire for warmth, cooking, water purification, and signaling.',
      ],
    ),
    EmergencyTopic(
      name: 'Medical',
      icon: Icons.medical_services,
      steps: [
        'Check the area and the person for immediate danger.',
        'Check responsiveness, breathing, and visible injuries.',
        'Apply direct pressure to control any bleeding.',
        'Keep the person warm, calm, and still while help is sought.',
      ],
      reminders: [
        'Prioritize life-threatening issues first (airway, breathing, bleeding).',
        'Do not move someone with a suspected spinal injury unless necessary.',
        'Keep a basic first aid kit accessible at all times.',
      ],
    ),
    EmergencyTopic(
      name: 'Shelter',
      icon: Icons.cabin,
      steps: [
        'Identify a location protected from wind, rain, and hazards.',
        'Use available materials (tarps, branches, debris) for cover.',
        'Insulate the ground to reduce heat loss.',
        'Keep the shelter entrance small to retain warmth.',
      ],
      reminders: [
        'Protection from the elements is often more urgent than food.',
        'Avoid low ground prone to flooding or cold air pooling.',
        'Reinforce shelter before nightfall or worsening weather.',
      ],
    ),
    EmergencyTopic(
      name: 'Communication',
      icon: Icons.campaign,
      steps: [
        'Identify all available communication tools (radio, phone, signals).',
        'Conserve device battery by limiting use to essential messages.',
        'Establish a check-in plan and schedule with your group.',
        'Use visual or audio signals if electronic communication fails.',
      ],
      reminders: [
        'Three of anything (whistles, flashes, fires) is a recognized distress signal.',
        'Share your location and plans before separating from a group.',
        'Keep a written list of important contacts and frequencies.',
      ],
    ),
    EmergencyTopic(
      name: 'Food & Foraging',
      icon: Icons.grass,
      steps: [
        'Inventory existing food supplies and ration accordingly.',
        'Identify safe, known food sources before foraging widely.',
        'Cook foraged food thoroughly when possible.',
        'Store food securely away from pests and moisture.',
      ],
      reminders: [
        'Never eat unidentified plants, fungi, or berries.',
        'When in doubt, do without - misidentification can be fatal.',
        'Prioritize calorie-dense, easy-to-store foods.',
      ],
    ),
    EmergencyTopic(
      name: 'Security & Defense',
      icon: Icons.shield,
      steps: [
        'Assess surroundings for immediate threats before acting.',
        'Secure shelter entrances and valuables.',
        'Stay together as a group and avoid unnecessary risks.',
        'De-escalate conflicts and avoid confrontation when possible.',
      ],
      reminders: [
        'Awareness and avoidance are the best forms of defense.',
        'Maintain a low profile to avoid attracting unwanted attention.',
        'Establish a watch rotation if traveling or sheltering in a group.',
      ],
    ),
  ];

  List<EmergencyTopic> getTopics() => topics;
}
