import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/account/account_common/druzyna_input_field.dart';
import 'package:harcapp/account/account_common/hufiec_input_field.dart';
import 'package:harcapp/account/account_common/logout.dart';
import 'package:harcapp/account/account_common/microsoft_login_button.dart';
import 'package:harcapp/account/account_page/account_nick_dialog.dart';
import 'package:harcapp/account/account_start/login_part.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp/values/rank_harc.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_start/conf_email_part.dart';
import 'package:harcapp/account/account_start/input_field_controller.dart';
import 'package:harcapp/account/account_start/main_button.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp/account/account_common/sex_input_field.dart';
import 'package:harcapp/account/ms_oauth.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';

import '../../_app_common/accounts/user_data.dart';
import '../../values/rank_instr.dart';
import '../account_common/name_input_field.dart';
import '../account_common/org_input_field.dart';
import '../account_common/rank_harc_input_field.dart';
import '../account_common/rank_instr_input_field.dart';
import '../login_provider.dart';
import '../shadow_user_manager_page.dart';


class AccountPage extends StatefulWidget{
  
  static open(BuildContext context){
    if(AccountData.loggedIn) {
      if(AccountData.emailConf)
        pushPage(context, builder: (context) => const AccountPage());
      else
        pushPage(context, builder: (context) => ConfEmailPart(AccountData.email));
    }else
      pushPage(context, builder: (context) => LoginPart(
        onLoggedIn: (emailConf) {
          if(AccountData.emailConf)
            pushReplacePage(context, builder: (context) => const AccountPage());
          else
            pushReplacePage(context, builder: (context) => ConfEmailPart(AccountData.email));
        },
      ));
  }

  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => AccountPageState();

}

class AccountPageState extends State<AccountPage> with TickerProviderStateMixin{

  late InputFieldController emailController;
  late InputFieldController passController;
  late InputFieldController passRepController;
  late InputFieldController nameController;
  late InputFieldController sexController;

  Sex? sex;

  Org? org;
  late InputFieldController hufiecController;
  late InputFieldController druzynaController;
  late InputFieldController orgController;
  late InputFieldController rankHarcController;
  late InputFieldController rankInstrController;

  RankHarc? rankHarc;
  RankInstr? rankInstr;

  InputFieldController? validPasswordController;

  late bool editMode;
  late bool processing;

  String? errMessage;

  late bool mergingMsAcc;

  bool onBackPressed(bool stopDefaultButtonEvent, RouteInfo info){
    if(editMode)
      setState(() => editMode = false);
    else
      Navigator.pop(context);

    return true;
  }

  void showPasswordDialog(BuildContext parentContext) => openDialog(
    context: parentContext,
    builder: (_) => LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(MediaQuery.of(context).viewInsets),
            child: Material(
              borderRadius: BorderRadius.circular(AppCard.bigRadius),
              child: Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const TitleShortcutRowWidget(title: 'Czy to na pewno Ty?'),

                    InputFieldPassword(
                        hint: 'Hasło:',
                        controller: validPasswordController,
                        autofocus: true
                    ),

                    MainButton(
                        icon: MdiIcons.check,
                        text: 'Zapisz',
                        processing: processing,
                        onTap: () async {
                          await hideKeyboard(parentContext);
                          sendChangeRequest(
                              onSuccess: (){
                                if(mounted) showAppToast(parentContext, text: 'Zapisano');
                                if(mounted) setState(() => editMode = false);
                              }
                          );
                          if(mounted) Navigator.pop(parentContext);
                        }
                    ),

                  ],
                ),
              ),
            )
        ),
      ),
    ),
  );

  void showEmailChangedDialog(BuildContext context) => showAlertDialog(
      context,
      title: 'Ostrożnie...',
      content: 'Zmiana adresu email będzie wymagała jego ponownej weryfikacji.\n\nCzy chcesz kontynuować?',
      actionBuilder: (context) => [

        AlertDialogButton(
            text: 'Tak',
            onTap: (){
              Navigator.pop(context);
              showPasswordDialog(context);
            }
        ),

        AlertDialogButton(text: 'Nie', onTap: () => Navigator.pop(context))
      ]
  );

  void sendChangeRequest({
    void Function()? onSuccess,
    void Function()? onError,
  }) async {

    emailController.errorText = '';
    passController.errorText = '';
    passRepController.errorText = '';
    nameController.errorText = '';
    sexController.errorText = '';

    orgController.errorText = '';
    hufiecController.errorText = '';
    druzynaController.errorText = '';
    rankHarcController.errorText = '';
    rankInstrController.errorText = '';

    validPasswordController!.errorText = '';

    setState(() => processing = true);

    LoginProvider loginProv = LoginProvider.of(context);

    await ApiUser.update(
        email: emailController.text,
        password: passController.text,
        passwordRep: passRepController.text,
        name: nameController.text,
        sex: sex,

        org: AccountData.org == org?
        null:
        Optional.ofNullable(org),

        hufiec: AccountData.hufiec == hufiecController.text?
        null:
        Optional.ofNullable(hufiecController.text.trim()),

        druzyna: AccountData.druzyna == druzynaController.text?
        null:
        Optional.ofNullable(druzynaController.text),

        rankHarc: AccountData.rankHarc == rankHarc?
        null:
        Optional.ofNullable(rankHarc),

        rankInstr: AccountData.rankInstr == rankInstr?
        null:
        Optional.ofNullable(rankInstr),

        validPass: validPasswordController!.text,
        onSuccess: (
            String? email,
            String? jwt,
            String? name,
            Sex? sex,
            Optional<Org>? org,
            Optional<String>? hufiec,
            Optional<String>? druzyna,
            Optional<RankHarc>? rankHarc,
            Optional<RankInstr>? rankInstr
            ) async {
          if(email != null && email != AccountData.email) {
            await AccountData.writeEmailConf(false);
            await AccountData.writeEmail(email);
            await AccountData.writeJwt(jwt);

            loginProv.notify();
            AccountData.callOnEmailConfirmChanged(false);

            if(mounted)
              pushReplacePage(context, builder: (context) => ConfEmailPart(email));
          }

          if(name != null)
            await AccountData.writeName(name);

          if(sex != null)
            await AccountData.writeSex(sex);

          if(org != null)
            await AccountData.writeOrg(org.orElseNull);

          if(hufiec != null)
            await AccountData.writeHufiec(hufiec.orElseNull);

          if(druzyna != null)
            await AccountData.writeDruzyna(druzyna.orElseNull);

          if(rankHarc != null)
            await AccountData.writeRankHarc(rankHarc.orElseNull);

          if(rankInstr != null)
            await AccountData.writeRankInstr(rankInstr.orElseNull);

          validPasswordController!.text = '';
          onSuccess?.call();
        },
        onError: (Response? response){
          try{

            Map? errMap = response!.data['errors'];

            if(errMap != null) {
              emailController.errorText = errMap[ApiUser.UPDATE_REQ_EMAIL] ?? '';
              passController.errorText = errMap[ApiUser.UPDATE_REQ_PASSWORD] ?? '';
              passRepController.errorText = errMap[ApiUser.UPDATE_REQ_PASSWORD_REP] ?? '';
              nameController.errorText = errMap[ApiUser.UPDATE_REQ_NAME] ?? '';
              sexController.errorText = errMap[ApiUser.UPDATE_REQ_SEX] ?? '';
              validPasswordController!.errorText = errMap[ApiUser.UPDATE_REQ_VALID_PASS] ?? '';
            }

            errMessage = response.data['error'];

          }catch (e){ showAppToast(context, text: 'Coś nie siadło.'); }

          validPasswordController!.text = '';
          onError?.call();
        }
    );

    if(mounted) setState(() => processing = false);

  }

  @override
  void initState() {
    emailController = InputFieldController(text: AccountData.email);
    passController = InputFieldController();
    passRepController = InputFieldController();
    nameController = InputFieldController(text: AccountData.name);
    nameController.addListener(() => setState((){}));
    sexController = InputFieldController();
    orgController = InputFieldController();
    rankHarcController = InputFieldController();
    rankInstrController = InputFieldController();

    validPasswordController = InputFieldController();

    sex = AccountData.sex;

    org = AccountData.org;
    hufiecController = InputFieldController(text: AccountData.hufiec);
    druzynaController = InputFieldController(text: AccountData.druzyna);
    rankHarc = AccountData.rankHarc;
    rankInstr = AccountData.rankInstr;

    editMode = false;
    processing = false;

    mergingMsAcc = false;

    BackButtonInterceptor.add(onBackPressed);

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    passRepController.dispose();
    nameController.dispose();
    sexController.dispose();
    orgController.dispose();
    hufiecController.dispose();
    druzynaController.dispose();
    rankHarcController.dispose();
    rankInstrController.dispose();

    BackButtonInterceptor.remove(onBackPressed);

    super.dispose();
  }

  bool savable() =>
      emailController.text.isNotEmpty && nameController.text.isNotEmpty && sex != null;

  void openShadowUsersPage() => pushPage(context, builder: (context) => ShadowUserManagerPage(
    itemTrailingBuilder: (_, __) => IconButton(
      onPressed: null,
      icon: Icon(MdiIcons.dotsHorizontal, color: iconEnab_(context)),
    ),
    onShadowMerged: (index, shadowUser, mergedUser){

      // Update particip in indivComp
      for(String key in shadowUser.indivCompKeys){
        IndivComp? comp = IndivComp.allMap![key];
        if(comp == null) continue;
        IndivCompParticip? shadowParticip = comp.removeLoadedParticipByKey(shadowUser.key, shrinkTotalCount: false);
        if(shadowParticip == null){
          comp.reloadParticipsPage();
          return;
        }
        IndivCompParticip particip = IndivCompParticip.fromUserData(
            mergedUser,
            profile: shadowParticip.profile
        );
        if(comp.isParticipWithinLoaded(particip))
          comp.addLoadedParticip(particip);
      }
      
    },
  ));

  @override
  Widget build(BuildContext context) => AppScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: Text(editMode?'Edytuj konto HarcApp':'Konto HarcApp'),
          centerTitle: true,
          floating: true,
          actions: [

            if(!editMode && !processing)
              IconButton(
                  icon: Icon(MdiIcons.pencil),
                  onPressed: () => setState(() => editMode = true)
              )

          ],
          leading: editMode?Container():IconButton(
            icon: Icon(MdiIcons.arrowLeft),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        if(editMode)
          FloatingContainer.child(
            height: MainButton.height + 2*Dimen.ICON_MARG,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              child: Material(
                color: cardEnab_(context),
                elevation: AppCard.bigElevation,
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                child: Row(
                  children: [

                    Expanded(
                        child: SimpleButton.from(
                          context: context,
                          margin: EdgeInsets.zero,
                          fontWeight: weight.normal,
                          textColor: processing?iconDisab_(context):iconEnab_(context),
                          text: 'Jednak nie',
                          icon: MdiIcons.close,
                          onTap: (){
                            emailController.text = AccountData.email!;
                            emailController.errorText = '';
                            passController.text = '';
                            nameController.text = AccountData.name!;
                            nameController.errorText = '';
                            sex = AccountData.sex;

                            setState(() => editMode = false);
                          },
                        )
                    ),

                    Expanded(
                      child: MainButton(
                          processing: processing,
                          text: 'Zapisz',
                          icon: MdiIcons.check,
                          onTap: (){
                            hideKeyboard(context);
                            if(AccountData.microsoftAcc){
                              sendChangeRequest(
                                  onSuccess: (){
                                    if(mounted) showAppToast(context, text: 'Zapisano');
                                    if(mounted) setState(() => editMode = false);
                                  }
                              );
                              return;
                            }

                            if(emailController.text==AccountData.email)
                              showPasswordDialog(context);
                            else
                              showEmailChangedDialog(context);
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        SliverList(delegate: SliverChildListDelegate([

          const SizedBox(height: Dimen.SIDE_MARG),

          AccountHeaderWidget(
            editMode?nameController.text:AccountData.name!,
            AccountData.org,
            AccountData.hufiec,
            AccountData.druzyna,
            AccountData.rankHarc,
            AccountData.rankInstr,
            verified: AccountData.verified,
            showDetails: false,
            showDetailsButton: false,
            leading: const SizedBox(width: Dimen.ICON_FOOTPRINT),
            trailing: SimpleButton.from(
                context: context,
                icon: MdiIcons.shareVariant,
                margin: EdgeInsets.zero,
                onTap: () => openDialog(
                    context: context,
                    builder: (context) => const AccountNickDialog()
                )
            ),
          ),

          if(AccountData.convertableToMicrosoft)
            Padding(
              padding: const EdgeInsets.only(
                top: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG,
                left: Dimen.SIDE_MARG,
              ),
              child: MicrosoftLoginButton(
                  'Połącz z kontem ZHP',
                  trailing: mergingMsAcc?
                  const SpinKitChasingDots(color: Colors.black, size: Dimen.ICON_SIZE):
                  Icon(MdiIcons.loginVariant, color: Colors.black),
                  onTap: () async {

                    showAlertDialog(
                      context,
                      dismissible: false,
                      title: 'Logowanie',
                      content: 'Trwa logowanie przez konto ZHP...',
                    );

                    await ZhpAccAuth.login();
                    String? azureToken = await ZhpAccAuth.azureToken;
                    if(azureToken == null){
                      Navigator.pop(context);
                      return;
                    }
                    await ApiRegLog.mergeMicrosoft(
                      azureToken,
                      onSuccess: (response){
                        Navigator.pop(context);
                        if(mounted) showAppToast(context, text: 'Połączono konto ZHP z kontem HarcApp.');
                        if(mounted) setState(() {});
                      },
                      onServerMaybeWakingUp: () {
                        if(mounted) showServerWakingUpToast(context);
                        return true;
                      },
                      onError: (err) async {
                        Navigator.pop(context);
                        await ZhpAccAuth.logout();
                        if(err!.data['error'] == 'microsoft_merge_email_mismatch')
                          await showAlertDialog(
                              context,
                              title: 'To nie przejdzie...',
                              content: 'Aby połączyć konta, zaloguj się kontem ZHP o tym samym adresie email co konto HarcApp: ${AccountData.email}.',
                              actionBuilder: (context) => [
                                AlertDialogButton(text: 'No dobrze', onTap: () => Navigator.pop(context))
                              ]
                          );
                        else
                          showAppToast(context, text: simpleErrorMessage);

                      },
                    );

                  }
              ),
            ),

          const SizedBox(height: Dimen.SIDE_MARG),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: BorderMaterial(
              radius: AppCard.bigRadius,
              child: Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG - BorderMaterial.defBorderWidth),
                child: Column(
                  children: [

                    TitleShortcutRowWidget(
                      title: 'Moje dane',
                      leading: const SizedBox(width: Dimen.SIDE_MARG),
                      textAlign: TextAlign.start,
                      titleColor: hintEnab_(context),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                      child: Text(
                        'Imię i nazwisko wraz z organizacją, hufcem, drużyną i stopniami widoczne są dla wszystkich. Płeć pozwala HarcAppce dobrze odmienić niektóre słowa.'
                            '\n\n${AccountData.microsoftAcc?'Imię i nazwisko jest takie, jak w koncie ZHP.':'Imię i nazwisko można zmienić raz na 60 dni.'}',
                        textAlign: TextAlign.justify,
                        style: AppTextStyle(color: hintEnab_(context)),
                      ),
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    if(editMode)
                      NameInputField(
                        dimTextOnDisabled: false,
                        controller: nameController,
                      ),

                    if(editMode)
                      const SizedBox(height: Dimen.SIDE_MARG),

                    SexInputField(
                        sex,
                        enabled: editMode,
                        dimTextOnDisabled: false,
                        controller: sexController,
                        onChanged: (sex) => setState(() => this.sex = sex)
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    OrgInputField(
                        org,
                        enabled: !AccountData.microsoftAcc && editMode,
                        dimTextOnDisabled: editMode && AccountData.microsoftAcc,
                        controller: orgController,
                        onChanged: (org) => setState(() => this.org = org)
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    HufiecInputField(
                      enabled: editMode,
                      dimTextOnDisabled: false,
                      controller: hufiecController,
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    DruzynaInputField(
                      enabled: editMode,
                      dimTextOnDisabled: false,
                      controller: druzynaController,
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    RankHarcInputField(
                        rankHarc,
                        enabled: editMode,
                        dimTextOnDisabled: false,
                        controller: rankHarcController,
                        onChanged: (rankHarc) => setState(() => this.rankHarc = rankHarc)
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    RankInstrInputField(
                        rankInstr,
                        enabled: editMode,
                        dimTextOnDisabled: false,
                        controller: rankInstrController,
                        onChanged: (rankInstr) => setState(() => this.rankInstr = rankInstr)
                    ),

                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: BorderMaterial(
              child: Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG - BorderMaterial.defBorderWidth),
                child: Column(
                  children: [

                    TitleShortcutRowWidget(
                        title: 'Email',
                        leading: const SizedBox(width: Dimen.SIDE_MARG),
                        textAlign: TextAlign.start,
                        titleColor: hintEnab_(context),
                        trailing:
                        AccountData.microsoftAcc?
                        IconButton(
                          onPressed: () => showAppToast(context, text: 'Konto powiązane z Microsoft ZHP'),
                          icon: Icon(MdiIcons.microsoft, color: iconEnab_(context)),
                        ):null
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: Dimen.SIDE_MARG,
                          right: Dimen.SIDE_MARG,
                          bottom: Dimen.SIDE_MARG
                      ),
                      child: Text(
                        'Adres email jest widoczny tylko dla Ciebie. Służy do weryfikacji i odzyskiwania konta.',
                        textAlign: TextAlign.justify,
                        style: AppTextStyle(color: hintEnab_(context)),
                      ),
                    ),

                    InputField(
                      hint: 'Email:',
                      controller: emailController,
                      enabled: !AccountData.microsoftAcc && editMode,
                      textDisabledColor: (editMode && AccountData.microsoftAcc)?textDisab_(context):textEnab_(context),
                      maxLength: ApiUser.EMAIL_MAX_LENGTH,
                      leading: Icon(MdiIcons.email, color: iconDisab_(context)),
                    ),

                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          if(AccountData.regularAcc)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: BorderMaterial(
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG - BorderMaterial.defBorderWidth),
                  child: Column(
                    children: [

                      TitleShortcutRowWidget(
                          title: 'Nowe hasło',
                          leading: const SizedBox(width: Dimen.SIDE_MARG),
                          textAlign: TextAlign.start,
                          titleColor: hintEnab_(context)
                      ),

                      InputFieldPassword(
                        hint: 'Hasło:',
                        controller: passController,
                        enabled: editMode,
                        maxLength: ApiUser.PASS_MAX_LENGTH,
                        leading: Icon(MdiIcons.key, color: iconDisab_(context)),
                      ),

                      InputFieldPassword(
                        hint: 'Powtórz hasło:',
                        controller: passRepController,
                        enabled: editMode,
                        maxLength: ApiUser.PASS_MAX_LENGTH,
                        leading: Icon(MdiIcons.shieldKey, color: iconDisab_(context)),
                      ),

                    ],
                  ),
                ),
              ),
            ),

          if(AccountData.regularAcc)
            const SizedBox(height: Dimen.SIDE_MARG),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: BorderMaterial(
              child: GestureDetector(
                onTap: openShadowUsersPage,
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG - BorderMaterial.defBorderWidth),
                  child: Column(
                    children: [

                      TitleShortcutRowWidget(
                          title: 'Konta widmo (${AccountData.shadowUserCount})',
                          leading: const SizedBox(width: Dimen.SIDE_MARG),
                          textAlign: TextAlign.start,
                          titleColor: hintEnab_(context),
                          trailing: IconButton(
                            icon: Icon(MdiIcons.arrowRight, color: iconEnab_(context)),
                            onPressed: openShadowUsersPage,
                          )
                      ),

                      ListTile(
                        title: Text(
                          'Przeglądaj moje konta widmo',
                          style: AppTextStyle(color: textEnab_(context)),
                        ),
                        subtitle: Text(
                          '\nKonta widmo to sztuczne konta zakładane dla osób, które nie mają konta HarcApp.',
                          style: AppTextStyle(color: textEnab_(context)),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          if(!editMode)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: Row(
                children: [

                  Expanded(child: Container()),

                  Expanded(
                    child: MainButton(
                      processing: processing,
                      text: 'Wyloguj',
                      icon: MdiIcons.exitToApp,
                      onTap: () => openLogoutDialog(context),
                      hero: false,
                    ),
                  ),

                ],
              ),
            ),

          if(!editMode)
            const SizedBox(height: Dimen.SIDE_MARG),

          if(editMode)
            PartTemplate(
                title: 'Strefa zagrożenia',
                heroTag: null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    TitleShortcutRowWidget(
                        title: 'Usuń konto',
                        leading: const SizedBox(width: Dimen.SIDE_MARG),
                        textAlign: TextAlign.start,
                        titleColor: hintEnab_(context)
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: Dimen.SIDE_MARG,
                          right: Dimen.SIDE_MARG,
                          bottom: Dimen.SIDE_MARG
                      ),
                      child: Text(
                        'Usunięcie konta jest równoznaczne z trwałą utratą wszystkich informacji z nim związanych.\nNie ma możliwości cofnięcia tej operacji.',
                        style: AppTextStyle(color: hintEnab_(context)),
                      ),
                    ),

                    Hero(
                      tag: DeleteAccountDialog.buttonHeroTag,
                      child: SimpleButton.from(
                          text: 'Usuń konto',
                          textColor: background_(context),
                          color: Colors.red,
                          onTap: () async {

                            openDialog(
                                context: context,
                                builder: (context) => const DeleteAccountDialog()
                            );

                          }
                      ),
                    ),

                  ],
                )
            ),

        ])),


      ],
    ),
  );

}


class DeleteAccountDialog extends StatefulWidget{

  static const buttonHeroTag = 'deleteButtonHeroTag';

  const DeleteAccountDialog({super.key});

  @override
  State<StatefulWidget> createState() => DeleteAccountDialogState();

}

class DeleteAccountDialogState extends State<DeleteAccountDialog>{

  InputFieldController? passwordController;
  late bool processing;

  @override
  void initState() {
    passwordController = InputFieldController();
    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              TitleShortcutRowWidget(
                  title: 'Ostrożnie!',
                  leading: const SizedBox(width: Dimen.SIDE_MARG),
                  textAlign: TextAlign.start,
                  titleColor: hintEnab_(context)
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG,
                    bottom: Dimen.SIDE_MARG
                ),
                child: AppText(
                  'Usunięcie konta jest równoznaczne z trwałą utratą wszystkich informacji z nim związanych.\n<b>Nie ma możliwości cofnięcia tej operacji.</b>',
                  color: hintEnab_(context),
                ),
              ),

              if(AccountData.regularAcc)
                InputFieldPassword(
                  hint: 'Hasło',
                  controller: passwordController,
                )
              else
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimen.SIDE_MARG,
                      right: Dimen.SIDE_MARG,
                      bottom: Dimen.SIDE_MARG
                  ),
                  child: AppText(
                    'Za chwilę będziesz poproszony o zalogowanie się swoim kontem ZHP. Po udanym logowaniu, Twoje <b>konto HarcApp</b> zostanie usunięte.'
                        '\n\nTwoje <b>konto ZHP</b> nie zostanie usunięte.',
                    color: hintEnab_(context),
                  ),
                ),

              if(AccountData.regularAcc)
                const SizedBox(height: Dimen.SIDE_MARG),

              Hero(
                tag: DeleteAccountDialog.buttonHeroTag,
                child: AnimatedChildSlider(
                  index: processing?1:0,
                  switchInCurve: Curves.easeOutQuart,
                  switchOutCurve: Curves.easeOutQuart,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SimpleButton.from(
                          text: AccountData.microsoftAcc?'Kontynuuj usuwanie konta':'Usuń konto',
                          textColor: background_(context),
                          color: Colors.red,
                          onTap: processing?null:() async {

                            LoginProvider loginProv = LoginProvider.of(context);

                            setState(() => processing = true);

                            if(AccountData.microsoftAcc) {
                              await ZhpAccAuth.logout();
                              try{
                                await ZhpAccAuth.login();
                              } on Exception{
                                setState(() => processing = false);
                                return;
                              }
                            }

                            ApiUser.delete(
                              validPass: AccountData.regularAcc?passwordController!.text:null,
                              validAzureToken: await ZhpAccAuth.azureToken,
                              onSuccess: () async {
                                String? email = AccountData.email;
                                await AccountData.forgetAccount();
                                loginProv.notify();

                                if (!mounted) return;
                                showAppToast(context, text: 'Konto HarcApp <b>$email</b> trwale usunięte.');

                                Navigator.pop(context);
                                Navigator.pop(context);
                                setState(() => processing = false);
                              },
                              onError: (message){
                                if(mounted) showAppToast(context, text: 'Coś nie tak...');
                                if(mounted) passwordController!.errorText = message;
                                if(mounted) setState(() => processing = false);
                              },
                            );
                          }
                      ),
                    ),

                    SizedBox(
                      height: Dimen.ICON_SIZE + 2*Dimen.ICON_MARG + 2*SimpleButton.DEF_MARG,
                      child: SpinKitThreeBounce(
                        size: Dimen.ICON_SIZE,
                        color: iconEnab_(context),
                      ),
                    )

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );

}

