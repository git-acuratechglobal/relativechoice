import 'package:flutter/material.dart';
import 'package:relative_choice/core/extensions/extensions.dart';

import '../../../../core/widgets/backicon.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4FCFF),
      appBar: AppBar(

        title: const Text(
          'Privacy & Cookie Policy',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2E3A59),
        elevation: 0,
        leading:   IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const BackIcon()),
        actions: const [
          // IconButton(
          //   icon: const Icon(Icons.home, color: Colors.white),
          //   onPressed: () {
          //     _scrollController.animateTo(
          //       0,
          //       duration: const Duration(milliseconds: 500),
          //       curve: Curves.easeInOut,
          //     );
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildQuickSummary(),
              const SizedBox(height: 32),
              _buildSection('Who We Are', _whoWeAreContent()),
              _buildSection(
                  'What This Policy Covers', _whatThisPolicyCoversContent()),
              _buildSection(
                  'Information We Collect', _informationWeCollectContent()),
              _buildSection(
                  'How We Use Your Information', _howWeUseInfoContent()),
              _buildSection(
                  'About Cookies and Similar Technologies', _cookiesContent()),
              _buildSection(
                  'How We Share Information', _howWeShareInfoContent()),
              _buildSection(
                  'Keeping Your Information Secure', _securityContent()),
              _buildSection(
                  'Your Privacy Rights and Choices', _privacyRightsContent()),
              _buildSection('Age Requirements', _ageRequirementsContent()),
              _buildSection(
                  'International Users', _internationalUsersContent()),
              _buildSection(
                  'Changes to This Policy', _changesToPolicyContent()),
              _buildSection('Questions or Concerns?', _questionsContent()),
              _buildSection(
                  'California Privacy Rights', _californiaRightsContent()),
              const SizedBox(height: 32),
              _buildFooter(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2E3A59),
            Color(0xFF3B4A6B),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.security,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  'Privacy & Cookie Policy',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Hey there! Thanks for checking out our Privacy & Cookie Policy. We know this might not be the most exciting read, but it's important - just like family! Think of this as us sitting down together and having an honest chat about how we handle your information while you're building meaningful connections on Relative Choice.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4FD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2196F3).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.summarize,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Quick Summary',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._buildBulletPoints([
            'We collect information you choose to share to help match you with potential chosen family members',
            'We use cookies and similar technologies to make our site work better for you',
            'We take your privacy seriously and protect your information',
            'We only share your information when necessary to provide our services',
            'You have control over your information and privacy choices',
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF2E3A59),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBulletPoints(List<String> points) {
    return points
        .map((point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2196F3),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      point,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }

  Widget _buildSubSection(String title, List<Widget> content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1976D2),
            ),
          ),
          const SizedBox(height: 8),
          ...content,
        ],
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          height: 1.5,
          color: Color(0xFF424242),
        ),
      ),
    );
  }

  List<Widget> _whoWeAreContent() {
    return [
      _buildText(
          "If you're in the United States (that's our current service area), the company responsible for your data is:"),
      Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Relative Choice Corporation\n6316 Oxon Hill Rd, #744, Oxon Hill, MD 20745',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF424242),
          ),
        ),
      ),
    ];
  }

  List<Widget> _whatThisPolicyCoversContent() {
    return [
      _buildText(
          "This policy applies to everything related to Relative Choice - our website, our app, and any other services we provide. We'll just call all of these our services throughout this policy to keep things simple."),
    ];
  }

  List<Widget> _informationWeCollectContent() {
    return [
      _buildText(
          "Let's talk about what information we gather to help you build meaningful family connections:"),
      const SizedBox(height: 16),
      _buildSubSection('Information You Share With Us', [
        ..._buildBulletPoints([
          'Basic account info (email, password, age verification)',
          'Profile information (including what kind of family connections you\'re seeking)',
          'Photos and content you choose to share',
          'Messages between you and potential family connections',
          'Payment information when you subscribe to certain tier levels',
          'Survey responses if you choose to participate',
          'Information you share about others (like when referring a friend)',
        ]),
      ]),
      _buildSubSection('Information Collected Automatically', [
        ..._buildBulletPoints([
          'How you use our service (like features you use most)',
          'Device information (like what type of phone or computer you\'re using)',
          'Location information (if you allow it)',
          'Log data (technical stuff that helps us keep the service running smoothly)',
        ]),
      ]),
      _buildSubSection('Information From Other Sources', [
        ..._buildBulletPoints([
          'If you create an account through social media',
          'Verification services (when we need to confirm something for safety)',
          'Public sources',
          'Other members (like if someone reports a concern)',
        ]),
      ]),
      Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFFF9800).withOpacity(0.3),
          ),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Color(0xFFFF9800),
              size: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Remember: We take extra care with information that might be considered sensitive (like religious beliefs or ethnic background). You\'re never required to share this information, and you can always select "prefer not to say."',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF424242),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _howWeUseInfoContent() {
    return [
      _buildText(
          "We use your information to help you build meaningful family connections. Here's what that looks like in practice:"),
      const SizedBox(height: 16),
      _buildSubSection('The Basics', [
        ..._buildBulletPoints([
          'Creating and managing your account',
          'Matching you with potential chosen family members',
          'Showing your profile to others looking for similar connections',
          'Processing your payments and subscriptions',
          'Sending you service updates and necessary notifications',
        ]),
      ]),
      _buildSubSection('Making Your Experience Better', [
        ..._buildBulletPoints([
          'Personalizing your search results',
          'Recommending potential matches',
          'Understanding how people use our service so we can improve it',
          'Providing customer support when you need help',
          'Protecting your safety and security on our platform',
        ]),
      ]),
      _buildSubSection('Communications', [
        ..._buildBulletPoints([
          'Sending you matches and connection opportunities',
          'Letting you know about features that might help you',
          'Sharing important updates about our service',
          'Sending promotional materials (which you can opt out of anytime)',
        ]),
      ]),
    ];
  }

  List<Widget> _cookiesContent() {
    return [
      _buildText(
          "Let's talk about cookies - and no, not the kind you share at family gatherings! These are small files that help our service work better for you."),
      const SizedBox(height: 16),
      _buildSubSection('What Are Cookies?', [
        _buildText(
            "Think of cookies like name tags at a family reunion - they help us recognize you when you come back to our site and remember your preferences so you don't have to start from scratch every time."),
      ]),
      _buildSubSection('Types of Cookies We Use', [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Essential Cookies',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 4),
              ..._buildBulletPoints([
                'These are the must-haves that keep our service running',
                'Help you stay logged in',
                'Keep your account secure',
                'Remember basic preferences',
              ]),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Analytics Cookies',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 4),
              ..._buildBulletPoints([
                'Help us understand how people use our service',
                'Show us what\'s working and what needs improvement',
                'Don\'t collect any personal information about you',
              ]),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Feature Cookies',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 4),
              ..._buildBulletPoints([
                'Remember your preferences',
                'Help personalize your experience',
                'Make the site work better for you',
              ]),
            ],
          ),
        ),
      ]),
      Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF3E5F5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFF9C27B0).withOpacity(0.3),
          ),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.settings,
              color: Color(0xFF9C27B0),
              size: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'You can control cookie settings through your browser, but remember that some parts of our service might not work as well if you block certain cookies.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF424242),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _howWeShareInfoContent() {
    return [
      _buildText(
          "Just like in any family, trust and privacy are important to us. Here's how we handle sharing your information:"),
      const SizedBox(height: 16),
      _buildSubSection('With Other Members', [
        ..._buildBulletPoints([
          'Your profile information is visible to other members',
          'Your messages are shared only with the people you\'re communicating with',
          'You control what personal details you share in your profile',
          'Your contact information stays private until you decide to share it',
        ]),
      ]),
      _buildSubSection('With Service Providers', [
        _buildText(
            'We work with trusted partners who help us provide our service, including:'),
        ..._buildBulletPoints([
          'Payment processors for handling subscriptions',
          'Security services to keep our platform safe',
          'Customer support tools to help when you need assistance',
          'Technical services that keep everything running smoothly',
        ]),
      ]),
      _buildSubSection('For Legal Reasons', [
        _buildText('Sometimes we have to share information:'),
        ..._buildBulletPoints([
          'To respond to legal requests',
          'To protect people\'s safety',
          'To prevent fraud or other illegal activities',
          'To defend our legal rights',
        ]),
      ]),
    ];
  }

  List<Widget> _securityContent() {
    return [
      _buildText(
          "We take your privacy seriously and use industry-standard security measures to protect your information. However, no online service can guarantee 100% security, so we encourage you to:"),
      const SizedBox(height: 12),
      ..._buildBulletPoints([
        'Use a strong password',
        'Keep your login information private',
        'Be careful about what personal information you share in your profile',
        'Let us know if you notice anything suspicious',
      ]),
    ];
  }

  List<Widget> _privacyRightsContent() {
    return [
      _buildText(
          "You're in control of your information on Relative Choice. Here's what you can do:"),
      const SizedBox(height: 16),
      _buildSubSection('Your Account Controls', [
        ..._buildBulletPoints([
          'Update or correct your profile information anytime',
          'Choose what information to share or keep private',
          'Control your notification preferences',
          'Manage your privacy settings',
        ]),
      ]),
      _buildSubSection('Your Rights', [
        _buildText('You can:'),
        ..._buildBulletPoints([
          'Access your personal information',
          'Request a copy of your data',
          'Ask us to correct inaccurate information',
          'Delete your account',
          'Opt out of promotional communications',
        ]),
      ]),
      _buildSubSection('Making Changes', [
        ..._buildBulletPoints([
          'Most changes can be made right in your account settings',
          'For other requests, contact our support team',
          'We\'ll respond to your privacy requests as quickly as we can',
        ]),
      ]),
      Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFFF9800).withOpacity(0.3),
          ),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Color(0xFFFF9800),
              size: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Remember, some information we might need to keep for legal or security reasons, even if you delete your account.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF424242),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _ageRequirementsContent() {
    return [
      _buildText(
          "Relative Choice is for adults only. You must be at least 18 years old to use our service. We don't knowingly collect information from anyone under 18, and we'll remove any accounts we discover that belong to underage users."),
    ];
  }

  List<Widget> _internationalUsersContent() {
    return [
      _buildText(
          "Right now, our service is available only in the United States. If you're accessing our service from outside the U.S., remember that your information will be processed in the United States and subject to U.S. laws."),
    ];
  }

  List<Widget> _changesToPolicyContent() {
    return [
      _buildText(
          "Like any family, we grow and change over time. When we update this policy, we'll:"),
      const SizedBox(height: 12),
      ..._buildBulletPoints([
        'Post the updated policy on our website',
        'Update the "Last Modified" date at the bottom',
      ]),
      const SizedBox(height: 8),
      _buildText(
          'Continuing to use our service after changes means you accept the updated policy.'),
    ];
  }

  List<Widget> _questionsContent() {
    return [
      _buildText(
          "We're here to help! If you have questions about your privacy or this policy:"),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.email, size: 20, color: Color(0xFF2196F3)),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    maxLines: 2,
                    'Email us at: privacy@relativechoice.com',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF424242),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 20, color: Color(0xFF2196F3)),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Write to us at:\nRelative Choice Corporation\n6316 Oxon Hill Rd, #744, Oxon Hill, MD 20745\nAttention: Privacy Team',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF424242),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 12),
      _buildText(
          'For general support questions, visit our Help Center or contact our support team.'),
    ];
  }

  List<Widget> _californiaRightsContent() {
    return [
      _buildText(
          "If you're a California resident, you have specific rights under the California Consumer Privacy Act (CCPA) and the California Privacy Rights Act (CPRA). Here's what you should know:"),
      const SizedBox(height: 16),
      _buildSubSection('Information We Collect and Why', [
        _buildText(
            'We categorize the personal information we collect in these ways:'),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Basic Identifiers',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 8),
              ..._buildBulletPoints([
                'What we collect: Name, email, address, phone number, account login',
                'Where it comes from: Directly from you',
                'Why we need it: To run your account and provide our services',
                'Who we share it with: Service providers who help run our platform',
                'How long we keep it: Premium Members: Duration of membership; Basic Members: 2 years after last activity; Members with unused features: Up to 4 years from last purchase',
              ]),
            ],
          ),
        ),
      ]),
      _buildSubSection('Your California Rights', [
        _buildText('You can:'),
        ..._buildBulletPoints([
          'See what information we have about you',
          'Get a copy of your information',
          'Delete your information (with some legal exceptions)',
          'Correct inaccurate information',
          'Limit how we use sensitive personal information',
          'Opt out of certain data sharing',
        ]),
      ]),
      _buildSubSection('How to Exercise Your Rights', [
        ..._buildBulletPoints([
          'Use the privacy controls in your account settings',
          'Email us at privacy@relativechoice.com',
          'Visit [website section] to submit a request',
        ]),
        const SizedBox(height: 8),
        _buildText("We'll respond to verified requests within 45 days."),
      ]),
      _buildSubSection('Additional State Privacy Rights', [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Virginia, Colorado, and Connecticut Residents',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 4),
              _buildText('You have rights to:'),
              ..._buildBulletPoints([
                'Access your personal information',
                'Correct inaccurate personal information',
                'Delete your personal information',
                'Get a copy of your data in a portable format',
                'Opt out of targeted advertising if we offer it',
              ]),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Other State Residents',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 4),
              _buildText(
                  'Delaware, Iowa, Nebraska, New Hampshire, New Jersey, Texas, Oregon, and Montana residents have the right to appeal if we deny your privacy request. Contact us with "Privacy Request Appeal" in your message.'),
            ],
          ),
        ),
      ]),
    ];
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2E3A59),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Text(
            'Last Modified: March 2025',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '© 2025 Relative Choice, LLC. All rights reserved.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
