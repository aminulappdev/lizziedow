
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/circle_widgets.dart';

class HomeAgendaTile extends StatelessWidget {
  const HomeAgendaTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.details, 
    this.onViewAll,
  });

  static const Color _textColor = Color(0xFF332A25);
  static const Color _mutedColor = Color(0xFF776B62);

  final String icon; 
  final String title;
  final String subtitle; 
  final List<HomeAgendaDetail> details;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleIconWidgets(iconPath: icon, iconRadius: 26.w(context),padding: 10,),
        SizedBox(width: 14.w(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: MyFonts.instrumentSerif.copyWith(
                        color: _textColor,
                        fontSize: 24.sp(context),
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onViewAll,
                    borderRadius: BorderRadius.circular(16.r(context)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w(context),
                        vertical: 4.h(context),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View all',
                            style: MyFonts.dmSans.copyWith(
                              color: _mutedColor,
                              fontSize: 11.sp(context),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 6.w(context)),
                          Icon(
                            Icons.chevron_right,
                            color: _textColor,
                            size: 18.sp(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h(context)),
              Text(
                subtitle,
                style: MyFonts.dmSans.copyWith(
                  color: _textColor,
                  fontSize: 13.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8.h(context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8.w(context),
                    runSpacing: 7.h(context),
                    children: details
                        .take(2)
                        .map((detail) => _AgendaDetailRow(detail: detail))
                        .toList(growable: false),
                  ),
                  ...details.skip(2).map(
                        (detail) => Padding(
                          padding: EdgeInsets.only(top: 7.h(context)),
                          child: _AgendaDetailRow(detail: detail),
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AgendaDetailRow extends StatelessWidget {
  const _AgendaDetailRow({required this.detail});

  final HomeAgendaDetail detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          detail.icon,
          color: HomeAgendaTile._mutedColor,
          size: 15.sp(context),
        ),
        SizedBox(width: 4.w(context)),
        Text(
          detail.label,
          style: MyFonts.dmSans.copyWith(
            color: HomeAgendaTile._mutedColor,
            fontSize: 12.sp(context),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class HomeAgendaDetail {
  const HomeAgendaDetail(this.icon, this.label);

  final IconData icon;
  final String label;
}
