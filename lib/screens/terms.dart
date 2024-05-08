import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsOfUses extends StatefulWidget {
  const TermsOfUses({super.key});

  @override
  State<TermsOfUses> createState() => _TermsOfUsesState();
}

class _TermsOfUsesState extends State<TermsOfUses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 88, 88, 88)),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          'Terms of Use',
          style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Use',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                'By accessing or using TravelBlitz, you agree to be bound by these Terms. If you do not agree to these Terms, you may not access or use the application.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                '2. Use of the Application',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                '2.1. TravelBlitz was designed to provide information and assistance related to travel by flight, airport trust, and security. You may use the application solely for its intended purpose.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                '2.2. Accuracy of Information: While we strive to provide accurate and up-to-date information, we do not warrant the accuracy, completeness, or reliability of any content provided in the application. Users are encouraged to verify information independently.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                '2.3. Security Measures: You agree to comply with all security measures and protocols implemented within the application to safeguard user data and ensure a secure browsing experience.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                '3.  Travel by Flight',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                '3.1. Booking and Reservations: [Your Application Name] may provide features for booking flights or making reservations with airlines. Users are solely responsible for reviewing and adhering to the terms and conditions set forth by airlines.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                '3.2. Flight Information: Flight schedules, timings, and other information provided in the application are subject to change. We do not guarantee the accuracy or availability of flight information and recommend users to verify details with airlines directly.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                '3.3. Safety Regulations: Users must comply with all safety regulations and guidelines established by airlines and aviation authorities when traveling by flight.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                '4. Airport Trust and Security',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                '4.1. Security Procedures: Users acknowledge and agree to comply with security procedures implemented at airports, including but not limited to baggage screening, body scans, and identity verification.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                '4.2. Prohibited Items: Users must refrain from carrying prohibited items as per airport security regulations. Any violation may result in penalties or legal consequences.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                '4.3. Cooperation with Authorities: Users agree to cooperate with airport security personnel and authorities as required to ensure the safety and security of all passengers and airport staff.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                '5. Limitation of Liability',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                'Disclaimer: TravelBlitz is provided "as is" without warranties of any kind, whether express or implied. We disclaim any liability for damages arising out of your use of the application.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                '6. Modifications to Terms',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                'We reserve the right to modify these Terms at any time without prior notice. By continuing to use TravelBlitz after any such modifications, you agree to be bound by the revised Terms.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                '7. Governing Law',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                'These Terms shall be governed by and construed in accordance with the laws of Thailand, without regard to its conflict of law provisions.',
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                '8. Contact Us',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                'If you have any questions or concerns about these Terms, please contact us at 6531503008@lamduan.mfu.ac.th.',
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
