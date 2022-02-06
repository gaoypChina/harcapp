import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/pola_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'data_faktury.dart';


class ChildFaktury extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[

        Positioned.fill(
          child: ListView.separated(
            padding: EdgeInsets.only(
                top: Dimen.SIDE_MARG,
                bottom: Dimen.ICON_FOOTPRINT + 3*Dimen.SIDE_MARG,
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG
            ),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => FakturaWidget(ALL_DATA_FAKTURY[index]),
            itemCount: ALL_DATA_FAKTURY.length,
            separatorBuilder: (context, index) => SizedBox(height: Dimen.SIDE_MARG),
          ),
        ),

        Positioned(
          bottom: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
          right: Dimen.SIDE_MARG,
          child: AppCard(
            elevation: AppCard.bigElevation,
            radius: AppCard.BIG_RADIUS,
            onTap: () => polaTap(context),
            margin: EdgeInsets.zero,
            child: TitleShortcutRowWidget(
              leading: Padding(
                child: PolaIcon(color: hintEnab_(context)),
                padding: EdgeInsets.all(Dimen.ICON_MARG),
              ),
              title: 'Kupuj polskie',
              onOpen: (context) => polaTap(context),
            ),
          ),
        )
      ],
    );
  }
}

class FakturaWidget extends StatelessWidget{

  final FakturaData data;

  const FakturaWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      radius: AppCard.BIG_RADIUS,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.all(Dimen.ICON_MARG),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FakturaBigWidget(data))
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Hero(
            tag: data.title,
            child: Material(
              color: Colors.transparent,
              child: Text(data.title, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
            ),
          ),

          SizedBox(height: Dimen.ICON_MARG),
          //Text('Adres:', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL, color: AppColors.text_hint_enab)),
          //SizedBox(height: Dimen.DEF_MARG),
          Row(
            children: [
              Icon(MdiIcons.mapMarkerOutline, color: iconDisab_(context)),
              SizedBox(width: Dimen.ICON_MARG),
              Hero(
                tag: data.adres,
                child: Material(
                  color: Colors.transparent,
                  child: Text(data.adres, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
                )
              ),
            ],
          ),
          //SizedBox(height: 2*Dimen.DEF_MARG),
          //Text('NIP:', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL, color: AppColors.text_hint_enab)),
          SizedBox(height: Dimen.ICON_MARG),
          Row(
            children: [
              SizedBox(
                child: Center(
                  child: Text('NIP', style: AppTextStyle(fontWeight: weight.bold, fontSize: 13.0, color: hintEnab_(context))),
                ),
                width: Dimen.ICON_SIZE,
              ),
              SizedBox(width: Dimen.ICON_MARG),
              Hero(
                tag: data.nip,
                child: Material(
                  color: Colors.transparent,
                  child: Text(data.nip, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
                ),
              )
            ],
          ),

        ],
      )
    );
  }
}

class FakturaBigWidget extends StatelessWidget{

  final FakturaData data;
  const FakturaBigWidget(this.data);

  @override
  Widget build(BuildContext context) {

    AutoSizeGroup group = AutoSizeGroup();
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return AppScaffold(
      scaffoldKey: scaffoldKey,
      appBar: AppBar(
        backgroundColor: background_(context),
        elevation: 0,
        title: Text('Dane do faktury'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(MdiIcons.contentCopy),
            onPressed: ()async{
              await Clipboard.setData(ClipboardData(text: data.title + '\n\n' + data.adres + '\n\n' + 'NIP: ${data.nip}'));
              showAppToast(context, text: 'Skopiowano');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimen.ICON_MARG),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: data.title,
              child: Material(
                color: Colors.transparent,
                child: AutoSizeText(
                    data.title, group: group,
                    style: AppTextStyle(fontSize: 60.0, fontWeight: weight.halfBold),
                    maxLines: data.title.split('\n').length
                ),
              )
            ),
            SizedBox(height: 2*Dimen.ICON_MARG),
            Text('Adres:',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: hintEnab_(context)),
            ),

            Hero(
              tag: data.adres,
              child: Material(
                color: Colors.transparent,
                child: AutoSizeText(
                    data.adres, group: group,
                    style: AppTextStyle(fontSize: 60.0, fontWeight: weight.halfBold),
                    maxLines: data.adres.split('\n').length
                ),
              )
            ),
            SizedBox(height: 2*Dimen.ICON_MARG),
            Hero(
              tag: data.nip,
              child: Material(
                color: Colors.transparent,
                child: Row(
                  children: [

                    Text('NIP: ',
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: hintEnab_(context)),
                        maxLines: 1
                    ),

                    AutoSizeText(data.nip, group: group,
                        style: AppTextStyle(fontSize: 60.0, fontWeight: weight.halfBold),
                        maxLines: data.nip.split('\n').length
                    )

                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}