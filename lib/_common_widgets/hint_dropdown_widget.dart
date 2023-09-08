import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HintDropdownWidget<T> extends StatelessWidget{

  final String hint;
  final String? hintTop;
  final Widget? leading;
  final T value;
  final void Function(T) onChanged;
  final void Function()? onCleared;
  final bool enabled;
  final double dropdownMaxHeight;

  final List<DropdownMenuItem<T>> items;

  const HintDropdownWidget({
    required this.hint,
    required this.hintTop,
    this.leading,
    required this.value,
    required this.onChanged,
    this.onCleared,
    this.enabled = true,
    this.dropdownMaxHeight = 240,
    required this.items,
    super.key
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [

      const SizedBox(width: Dimen.ICON_MARG),

      if(leading != null)
        leading!,

      Expanded(
        child: Stack(
          children: [

            Row(
              children: [

                Expanded(child: IgnorePointer(
                  ignoring: !enabled,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton2<T>(
                        isExpanded: true,
                        iconStyleData: const IconStyleData(
                          iconSize: 0,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: dropdownMaxHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppCard.bigRadius),
                          ),
                        ),
                        buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppCard.defRadius),
                          ),
                        ),
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            color: enabled?iconEnab_(context):hintEnab_(context)
                        ),
                        hint: Text(
                            hint,
                            style: AppTextStyle(color: hintEnab_(context))
                        ),
                        items: items,
                        value: value,
                        onChanged: (value) => onChanged(value as T),
                      )
                  ),
                )),

                if(onCleared != null && value != null && enabled)
                  IconButton(
                      icon: Icon(MdiIcons.close),
                      onPressed: onCleared
                  )

              ],
            ),

            Positioned(
              top: 0,
              left: Dimen.TEXT_FIELD_PADD,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity:
                value == null?0:1,
                child: Text(
                  hintTop??hint,
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL, fontWeight: weight.halfBold, color: hintEnab_(context)),
                ),
              ),
            )

          ],
        ),
      )
    ],
  );

}
