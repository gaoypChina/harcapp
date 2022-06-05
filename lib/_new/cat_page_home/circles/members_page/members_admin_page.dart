import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../../_common_widgets/loading_widget.dart';
import '../circle_page.dart';
import '../circle_role.dart';
import '../common/member_header_widget.dart';
import '../common/member_tile.dart';
import '../model/circle.dart';
import '../model/member.dart';
import 'add_user_bottom_sheet.dart';
import 'members_page_templ.dart';

class MembersAdminPage extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;

  const MembersAdminPage(this.circle, this.palette, {super.key});

  @override
  State<StatefulWidget> createState() => MembersAdminPageState();

}

class MembersAdminPageState extends State<MembersAdminPage>{

  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;

  late List<Member?> selectedMembers;

  void onMemberProviderNotified() => setState((){});

  @override
  void initState() {

    CircleMembersProvider.addOnNotifyListener(onMemberProviderNotified);
    selectedMembers = [];

    super.initState();
  }

  @override
  void dispose() {
    CircleMembersProvider.removeOnNotifyListener(onMemberProviderNotified);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      MembersPageTempl(
        circle: circle,
        palette: palette,

        adminsListHeaderTrailing: (memAdmins) => IconButton(
          icon: const Icon(MdiIcons.selectMultiple),
          onPressed: (){

            bool allSelected = true;
            for(Member mem in memAdmins)
              if(!selectedMembers.contains(mem)){
                allSelected = false;
                break;
              }

            if(allSelected)
              for(Member mem in memAdmins)
                selectedMembers.remove(mem);
            else
              for(Member mem in memAdmins)
                if(!selectedMembers.contains(mem)) selectedMembers.add(mem);

            setState(() {});

          },
        ),

        modsListHeaderTrailing: (memMods) => IconButton(
          icon: const Icon(MdiIcons.selectMultiple),
          onPressed: (){

            bool allSelected = true;
            for(Member mem in memMods)
              if(!selectedMembers.contains(mem)){
                allSelected = false;
                break;
              }

            if(allSelected)
              for(Member mem in memMods)
                selectedMembers.remove(mem);
            else
              for(Member mem in memMods)
                if(!selectedMembers.contains(mem)) selectedMembers.add(mem);

            setState(() {});

          },
        ),

        obsListHeaderTrailing: (memObs) => IconButton(
          icon: const Icon(MdiIcons.selectMultiple),
          onPressed: (){

            bool allSelected = true;
            for(Member mem in memObs)
              if(!selectedMembers.contains(mem)){
                allSelected = false;
                break;
              }

            if(allSelected)
              for(Member mem in memObs)
                selectedMembers.remove(mem);
            else
              for(Member mem in memObs)
                if(!selectedMembers.contains(mem)) selectedMembers.add(mem);

            setState(() {});
          },
        ),

        customAppBar:
        selectedMembers.isEmpty?
        SliverAppBar(
          title: const Text('Lista uczestników'),
          centerTitle: true,
          floating: true,
          backgroundColor: CirclePage.appBarColor(context, palette),
          actions: [
            if(circle.myRole == CircleRole.ADMIN)
              IconButton(
                  icon: const Icon(MdiIcons.plus),
                  onPressed: () => showScrollBottomSheet(
                      context: context,
                      builder: (context) => AddUserBottomSheet(circle, palette)
                  )
              )
          ],
        ):
        SelectedAppBar(
          circle,
          selectedMembers,
          backgroundColor: CirclePage.appBarColor(context, palette),
          onSelectAll: () => setState((){
            selectedMembers.clear();
            selectedMembers.addAll(circle.members);
          }),
          onUnselectAll: () => setState(() => selectedMembers.clear()),
        ),

        itemBuilder: (context, member) => _MemberTile(
          circle,
          palette,
          member,

          anythingSelected: selectedMembers.isNotEmpty,
          selected: selectedMembers.contains(member),

          onSelectionTap: (){
            if(selectedMembers.contains(member))
              setState(() => selectedMembers.remove(member));
            else
              setState(() => selectedMembers.add(member));
          },
          heroTag: member,
        ),

      ),

      if(circle.members.length == 1 && selectedMembers.isEmpty)
        Positioned(
            left: 2*Dimen.SIDE_MARG,
            right: 2*Dimen.SIDE_MARG,
            bottom: kBottomNavigationBarHeight + 2*Dimen.SIDE_MARG,
            child: Material(
              color: background_(context),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
                      const SizedBox(width: Dimen.DEF_MARG),
                      Icon(MdiIcons.accountPlus, size: 68.0, color: backgroundIcon_(context)),
                      const SizedBox(width: Dimen.DEF_MARG+8),

                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Icon(MdiIcons.accountMultiple, size: 48.0, color: backgroundIcon_(context)),
                      )

                    ],
                  ),

                  //SizedBox(height: Dimen.SIDE_MARG),

                  AppText(
                    'Wybierz <b>+</b> w górnym prawym rogu, by <b>dodać ludzi</b> do kręgu',
                    color: hintEnab_(context),
                    size: Dimen.TEXT_SIZE_APPBAR,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
        )

    ],
  );

}

class SelectedAppBar extends SliverAppBar{

  final Circle? circle;
  final List<Member?> selectedMems;

  @override
  final Color? backgroundColor;

  final void Function()? onSelectAll;
  final void Function()? onUnselectAll;

  SelectedAppBar(this.circle, this.selectedMems, {Key? key, this.backgroundColor, this.onSelectAll, this.onUnselectAll}):super(key: key,
    leadingWidth: Dimen.APPBAR_LEADING_WIDTH + Dimen.ICON_FOOTPRINT,
    leading: Row(
      children: [
        SizedBox(
          width: Dimen.APPBAR_LEADING_WIDTH,
          child: IconButton(
              icon: const Icon(MdiIcons.close),
              onPressed: onUnselectAll
          ),
        ),

      ],
    ),
    title: Text('Zaznaczono: ${selectedMems.length}'),
    centerTitle: true,
    floating: true,
    pinned: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 2*Dimen.DEF_MARG),
        child: IconButton(
            icon: const Icon(MdiIcons.selectMultiple),
            onPressed: onSelectAll
        ),
      )
    ],
  );


}

class _MemberTile extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  final Member member;
  final bool anythingSelected;
  final bool selected;
  final void Function()? onSelectionTap;
  final dynamic heroTag;

  const _MemberTile(
      this.circle,
      this.palette,
      this.member,
      { required this.anythingSelected,
        this.selected=false,
        this.onSelectionTap,
        this.heroTag,
        super.key
      });

  @override
  State<StatefulWidget> createState() => _MemberTileState();

}

class _MemberTileState extends State<_MemberTile>{

  Circle? get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;
  Member get member => widget.member;

  bool get anythingSelected => widget.anythingSelected;
  bool get selected => widget.selected;
  void Function()? get onSelectionTap => widget.onSelectionTap;

  get heroTag => widget.heroTag;

  void openParticipantDetails() => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        color: CirclePage.backgroundColor(context, palette),
        builder: (context) => Column(
          children: [

            MemberHeaderWidget(member.name, member.shadow, member.role, heroTag: member.key),

            const SizedBox(height: 2*24.0),

            ListTile(
              leading: const SizedBox(width: Dimen.ICON_SIZE),
              title: Text('Edytuj rolę uczestnika', style: AppTextStyle(color: hintEnab_(context)))
            ),

            if(member.role != CircleRole.OBSERVER)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.OBSERVER]),
                title: Text('Nadaj rolę uczestnika', style: AppTextStyle()),
                onTap: member.shadow?null: () async {
                  await showUpdateRoleDialog(
                    CircleRole.OBSERVER,
                    onSuccess: (){
                      if(member.key == AccountData.key)
                        Navigator.pop(context);
                    }
                  );

                  Navigator.pop(context);

                },
              ),

            if(member.role != CircleRole.MODERATOR)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.MODERATOR]),
                title: Text('Nadaj rolę moderatora', style: AppTextStyle()),
                onTap: member.shadow?null: () async {
                  await showUpdateRoleDialog(
                      CircleRole.MODERATOR,
                      onSuccess: (){
                        if(member.key == AccountData.key)
                          Navigator.pop(context);
                      }
                  );
                  Navigator.pop(context);
                },
              ),

            if(member.role != CircleRole.ADMIN)
              ListTile(
                enabled: !member.shadow,
                leading: Icon(circleRoleToIcon[CircleRole.ADMIN]),
                title: Text('Nadaj rolę administratora', style: AppTextStyle()),
                onTap: member.shadow?null: () async {
                  await showUpdateRoleDialog(
                    CircleRole.ADMIN,
                    onSuccess: (){
                      if(member.key == AccountData.key)
                        Navigator.pop(context);
                    }
                  );
                  Navigator.pop(context);
                },
              ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              enabled: !member.shadow,
              leading: const Icon(MdiIcons.googleCirclesGroup),
              title: Text('Zarządzaj zastępem', style: AppTextStyle()),
              subtitle: member.patrol==null?null:Text(member.patrol!, style: AppTextStyle()),
              onTap: member.shadow?null: () async {
                Navigator.pop(context);
                showUpdatePatrolDialog();
              },
            ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ListTile(
              leading: const Icon(MdiIcons.logoutVariant, color: Colors.red),
              title: Text('Wyproś uczestnika', style: AppTextStyle(color: Colors.red)),
              onTap: () => showRemoveDialog([member], circle!.members)
            ),

          ],
        ),
      )
  );

  Future<void> showUpdateRoleDialog(CircleRole newRole, {void Function()? onSuccess}) async {
    bool close = false;

    if(member.key == AccountData.key && newRole != CircleRole.ADMIN)
      await showAlertDialog(
        context,
        title: 'Chwileczkę!',
        content: 'Czy na pewno chcesz zrzec się roli <b>administratora</b> kręgu <b>${circle!.name}</b>?',
        actionBuilder: (context) => [
          AlertDialogButton(
            text: 'Tak',
            onTap: () => Navigator.pop(context)
          ),
          AlertDialogButton(
            text: 'Nie',
            onTap: (){
              close = true;
              Navigator.pop(context);
            },
          ),
        ],
      );

    if(close) return;

    showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

    await ApiCircle.updateUsers(
        circleKey: circle!.key,
        users: [MemberUpdateBody(member.key, role: Optional.of(newRole))],
        onSuccess: (List<Member> allMems){
          circle!.setAllMembers(context, allMems);
          Navigator.pop(context);
          onSuccess?.call();
        },
        onError: (){
          showAppToast(context, text: 'Coś tu poszło nie tak...');
          Navigator.pop(context);
        }
    );
  }

  Future<void> showUpdatePatrolDialog({void Function()? onSuccess}) async {

    openDialog(
        context: context,
        builder: (context) => _EditPatrolDialog(
          circle!,
          palette,
          member,
          onSuccess: () => Navigator.pop(context),
          onError: () => Navigator.pop(context),
        )
    );

  }

  Future<void> showRemoveDialog(List<Member> memsToRemove, List<Member?> allMems) async {

    if(!await isNetworkAvailable()){
      showAppToast(context, text: 'Brak dostępu do Internetu');
      return;
    }

    int allAdminCount = 0;
    int remAdminCount = 0;
    for(Member? mem in allMems) if(mem!.role == CircleRole.ADMIN) allAdminCount++;
    for(Member mem in memsToRemove) if(mem.role == CircleRole.ADMIN) remAdminCount++;

    if(allAdminCount == remAdminCount){
      await showAlertDialog(
          context,
          title: 'Hola, hola...',
          content: 'Zamierzasz usunąć ostatniego administratora?\n\nTak nie wolno.',
          actionBuilder: (context) => [
            AlertDialogButton(
                text: 'No dobrze',
                onTap: () => Navigator.pop(context)
            )
          ]
      );
      return;
    }

    bool plural;

    String participsString = '';
    if(memsToRemove.isEmpty)
      return;
    else if(memsToRemove.length == 1) {
      participsString = memsToRemove[0].name;
      plural = false;
    }else {
      participsString = '${memsToRemove.length} użytkowników';
      plural = true;
    }

    await showAlertDialog(
        context,
        title: 'Wypraszanie ${plural?'użytkowników':'użytkownika'}...',
        content: '$participsString nie będzie mieć dłużej dostępu do współzawodnictwa.\n\nNa pewno chcesz ${plural?'ich':'go'} wyprosić?',
        actionBuilder: (_context) => [

          AlertDialogButton(
              text: 'Nie',
              onTap: () => Navigator.pop(_context)
          ),

          AlertDialogButton(
              text: 'Tak',
              onTap: () async {
                Navigator.pop(context);
                Navigator.pop(context);

                showLoadingWidget(context, CirclePage.strongColor(context, palette), 'Wypraszanie ${plural?'użytkowników':'użytkownika'}...');
                await ApiCircle.removeUsers(
                    circleKey: circle!.key,
                    userKeys: memsToRemove.map((p) => p.key).toList(),
                    onSuccess: (List<String> removedParticips) async {
                      circle!.removeMembersByKey(context, removedParticips);

                      showAppToast(context, text: 'Wyproszono');
                      await popPage(context);
                    },
                    onError: () async {
                      showAppToast(context, text: 'Coś tu poszło nie tak...');
                      await popPage(context);
                    }
                );
              }
          )
        ]
    );

  }

  @override
  Widget build(BuildContext context) => MemberTile(
    userKey: member.key,
    name: member.name,
    subtitle: member.patrol==null?null:Text(member.patrol!, style: AppTextStyle(color: hintEnab_(context))),
    shadow: member.shadow,
    role: member.role,
    anythingSelected: anythingSelected,
    selected: selected,
    selectedColor: CirclePage.cardColor(context, palette),
    selectedTextColor: CirclePage.strongColor(context, palette),
    onLongPress: onSelectionTap,
    onTap: anythingSelected?onSelectionTap:(circle!.myRole == CircleRole.ADMIN || circle!.myRole == CircleRole.MODERATOR?openParticipantDetails:null),
    heroTag: heroTag,
  );

}

class _EditPatrolDialog extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  final Member member;
  final void Function()? onSuccess;
  final void Function()? onError;

  const _EditPatrolDialog(this.circle, this.palette, this.member, {this.onSuccess, this.onError});

  @override
  State<StatefulWidget> createState() => _EditPatrolDialogState();

}

class _EditPatrolDialogState extends State<_EditPatrolDialog>{

  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;
  Member get member => widget.member;
  void Function()? get onSuccess => widget.onSuccess;
  void Function()? get onError => widget.onError;

  late TextEditingController controller;

  late List<String> patrolNames;

  @override
  void initState(){
    controller = TextEditingController(text: member.patrol??'');

    patrolNames = [];
    for(Member mem in circle.members)
      if(mem.patrol != null && !patrolNames.contains(mem.patrol))
      patrolNames.add(mem.patrol!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(MediaQuery.of(context).viewInsets),
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
        clipBehavior: Clip.hardEdge,
        color: CirclePage.backgroundColor(context, palette),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: const Text('Przypisz do zastępu'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [

                IconButton(
                  icon: const Icon(MdiIcons.check),
                  onPressed: () async {

                    showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

                    await ApiCircle.updateUsers(
                        circleKey: circle.key,
                        users: [MemberUpdateBody(
                            member.key,
                            patrol: Optional.ofNullable(
                                controller.text.isEmpty?
                                null:
                                controller.text
                            )
                        )],
                        onSuccess: (List<Member> allMems){
                          circle.setAllMembers(context, allMems);
                          Navigator.pop(context); // Close loading widget.
                          onSuccess?.call();
                        },
                        onError: (){
                          showAppToast(context, text: 'Coś tu poszło nie tak...');
                          Navigator.pop(context); // Close loading widget.
                          onError?.call();
                        }
                    );

                  },
                )

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: AppTextFieldHint(
                hint: 'Nazwa zastępu:',
                hintTop: 'Nazwa zastępu',
                controller: controller,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: Dimen.ICON_MARG,
                right: Dimen.ICON_MARG,
                bottom: Dimen.ICON_MARG
              ),
              child: Wrap(
                spacing: Dimen.ICON_MARG,
                runSpacing: Dimen.ICON_MARG,
                children: patrolNames.map(
                        (patrol) => SimpleButton.from(
                      context: context,
                      text: patrol,
                      margin: EdgeInsets.zero,
                      color: backgroundIcon_(context),
                      onTap: () => controller.text = patrol,
                    )
                ).toList(),
              ),
            )

          ],
        ),
      ),
    ),
  );

}