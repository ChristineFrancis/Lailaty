import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class CancelJourneyContainer extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onChooseCancellationReason;
  const CancelJourneyContainer({
    super.key,
    required this.onClose,
    required this.onChooseCancellationReason,
  });

  List<String> _getCancellationReasons() {
    return [
      StringManager.thePassengerDidNotShow,
      StringManager.refuseToExecuteTheRequest,
      StringManager.falseRequest,
      StringManager.passengerComplaint,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final cancellationReasons = _getCancellationReasons();
    return Container(
      height: context.screenHeight * 0.4,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onClose,
                child: Container(
                  width: context.screenWidth * 0.08,
                  height: context.screenWidth * 0.08,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.yellowTextColor,
                  ),
                  child: Icon(
                    Icons.close,
                    size: context.screenWidth * 0.05,
                    color: ColorManager.grey1,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringManager.reasonForCancellation,
                    style: StyleManager.boldTextStyle24(
                      size: context.screenWidth * 0.07,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.screenWidth * 0.03,
              )
            ],
          ),
          SizedBox(height: context.screenHeight * 0.02),
          Expanded(
            child: ListView.builder(
              itemCount: cancellationReasons.length,
              itemBuilder: (context, index) {
                final reason = cancellationReasons[index];
                return GestureDetector(
                  onTap: onChooseCancellationReason,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorManager.greyRateContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      reason,
                      textAlign: TextAlign.right,
                      style: StyleManager.semiboldTextStyle20(
                        size: context.screenWidth * 0.04,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
