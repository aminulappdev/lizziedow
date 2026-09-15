import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/profile/view/widgets/support_contract_card.dart';

class ContactSupportBottomSheet extends StatefulWidget {
  const ContactSupportBottomSheet({super.key});

  @override
  State<ContactSupportBottomSheet> createState() =>
      _ContactSupportBottomSheetState();
}

class _ContactSupportBottomSheetState extends State<ContactSupportBottomSheet> {
  final TextEditingController _issueTitleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _issueTitleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w(context),
            right: 20.w(context),
            top: 26.h(context),
            bottom: 14.h(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Contact Support',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8.h(context)),
              Text(
                'Contact with Fertility Sisterhood',
                textAlign: TextAlign.center,
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF8F837A),
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.h(context)),
              Row(
                children: [
                  const Expanded(
                    child: SupportContactCard(
                      icon: Icons.phone_in_talk_outlined,
                      title: 'Call Us at',
                      value: '(252) 555-0126',
                    ),
                  ),
                  SizedBox(width: 12.w(context)),
                  const Expanded(
                    child: SupportContactCard(
                      icon: Icons.support_agent_outlined,
                      title: 'Email Us at',
                      value: 'trungclerspkhd@gmail.com',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h(context)),
              CustomTextField(
                controller: _issueTitleController,
                hintText: 'Enter Issue title',
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 16.h(context)),
              CustomTextField(
                controller: _descriptionController,
                hintText: 'Write description here.....',
                maxLines: 8,
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 20.h(context)),
              CustomButton(
                text: 'Submit Feedback',
                onPressed: () => Navigator.pop(context),
                borderRadius: 8.r(context),
                height: 54.h(context),
                textStyle: MyFonts.dmSans.copyWith(
                  fontSize: 13.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 18.h(context)),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: LightThemeColors.darkBrown,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Discard',
                  style: MyFonts.dmSans.copyWith(
                    fontSize: 13.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

