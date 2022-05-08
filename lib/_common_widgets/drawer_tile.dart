import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

class DrawerTile<T> extends StatelessWidget{

  final IconData icon;
  final Widget leading;
  final String title;
  final T source;
  final T selectedSource;
  final void Function(T) onSelect;
  final Widget trailing;

  const DrawerTile({
    this.icon,
    this.leading,
    @required this.title,
    @required this.source,
    @required this.selectedSource,
    @required this.onSelect,
    this.trailing,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
      leading: leading??(icon == null? null: Icon(
          icon,
          color: selectedSource == source?iconEnab_(context):textEnab_(context)
      )),
      title: Text(
          title,
          style: AppTextStyle(
              fontWeight: selectedSource == source?weight.bold:weight.normal,
              color: selectedSource == source?iconEnab_(context):textEnab_(context)
          )
      ),
      trailing: trailing,
      onTap: () => onSelect?.call(source)
  );

}
