import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobOpportunities = [
      'Director looking for a cameraman in Chennai.',
      'Producer hiring scriptwriters in Mumbai.',
      'Editor needed for post-production work in Hyderabad.',
      'Assistant Director wanted for a short film in Bengaluru.',
      'Casting call for lead roles in a feature film in Kolkata.',
      'Makeup artist required for an ad shoot in Delhi.',
      'Sound engineer needed for music video production in Pune.',
      'Animator required for a VFX-heavy project in Kochi.',
      'Production assistant job available for a web series in Goa.',
      'Lighting technician needed for an indie film in Chennai.',
      'Costume designer hiring for a historical drama in Jaipur.',
      'Graphic designer wanted for promotional material in Bengaluru.',
      'Choreographer required for a dance sequence in Mumbai.',
      'Social media manager needed for film promotions in Hyderabad.',
      'Location scout hiring for a documentary project in Kerala.',
      'Voice-over artist needed for dubbing in Tamil Nadu.',
      'Stunt coordinator required for an action film in Delhi.',
      'Publicist hiring for an upcoming movie launch in Pune.',
      'Screenplay writer needed for a romantic drama in Lucknow.',
      'Film critic job opportunity for an online magazine in Kolkata.',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Jobs')),
      body: ListView.builder(
        itemCount: jobOpportunities.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.movie),
            title: Text(jobOpportunities[index]),
          );
        },
      ),
    );
  }
}
