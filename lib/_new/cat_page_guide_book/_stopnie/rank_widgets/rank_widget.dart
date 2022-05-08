import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/api/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_widgets/rank_cat_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/claim_button.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/complete_button.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/rank_spraw_temp_widget.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/cat_page_home/providers.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/account/search_user_dialog.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../details/app_settings.dart';
import '../../../module_statistics_registrator.dart';


class RankFloatingButtonProvider extends ChangeNotifier{

  void notify() => notifyListeners();

}

class RankWidget extends StatefulWidget{

  final Rank rank;
  final List<IconData> icons;
  final DateTime lastUpdateTime;

  final bool showBack;

  final void Function(RankTask item, bool completed) onReqCompletedChanged;

  final bool previewOnly;

  const RankWidget({
    @required this.rank,
    @required this.icons,
    this.lastUpdateTime,
    this.showBack = false,
    this.onReqCompletedChanged,

    this.previewOnly = false,
    Key key
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => RankWidgetState();

}

class RankWidgetState extends State<RankWidget> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.stopnie;

  Rank get rank => widget.rank;
  bool get showBack => widget.showBack;
  void Function(RankTask item, bool completed) get onReqCompletedChanged => widget.onReqCompletedChanged;

  ConfettiController confettiController;
  ValueNotifier<double> notifier;

  bool reachedBottom;

  @override
  void initState() {
    confettiController = ConfettiController(duration: const Duration(seconds: 1));
    notifier = ValueNotifier(.0);

    reachedBottom = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(int i=0; i<rank.cats.length; i++){
      children.add(
        RankCatWidget(
            rank.cats[i],
            onReqComplChanged: (RankTask item, bool completed){
              setState(() {});
              onReqCompletedChanged?.call(item, completed);
            }
        )
      );

      if(i != rank.cats.length-1)
        children.add(RankCatWidget.separator(context, i));
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => RankFloatingButtonProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => SharedUsersProvider(rank, [])),
      ],
      builder: (context, child) => RankSprawTempWidget(
          title: '${rank.titleMale}${rank.titleFemale==null?'':'\n${rank.titleFemale}'}',
          color: RankData.colors[rank.data].avgColor(false),
          completedText: 'Stopień zdobyty!',
          completedTextColor: background_(context),
          appBarBottom:
          SharedUsersWidget(rank),
          underTitleLeading: Row(
            children: widget.icons.map((icon) => Icon(icon, size: RankData.iconSizeMap[rank.data].item2,)).toList(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              if(widget.lastUpdateTime != null)
                SimpleButton.from(
                  textColor: textEnab_(context),
                  icon: MdiIcons.update,
                  text: dateToString(widget.lastUpdateTime, shortMonth: true, withTime: true),
                  textSize: Dimen.TEXT_SIZE_BIG,
                  margin: EdgeInsets.zero,
                  onTap: () => showAppToast(context, text: 'Ostatnia aktualizacja stopnia:\n<b>${dateToString(widget.lastUpdateTime, shortMonth: true, withTime: true)}</b>')
                ),

              rank.buildHeader(context),

              const SizedBox(height: Dimen.SIDE_MARG),

              Column(children: children),

              rank.buildFooter(context),
              const SizedBox(height: 2*Dimen.ICON_MARG)

            ],
          ),
          floatingButton: Consumer<RankFloatingButtonProvider>(
            builder: (context, prov, child){

              bool showComplete = rank.isReadyToComplete && !rank.completed && rank.inProgress;
              bool showClaim = !rank.inProgress && !rank.completed;

              return Stack(
                children: [

                  AnimatedOpacity(
                    opacity: rank.inProgress && rank.isReadyToComplete && !rank.completed?1:0,
                    duration: const Duration(milliseconds: 300),
                    child: IgnorePointer(
                      ignoring: !showComplete,
                      child: CompleteButton(
                        rank,
                        confettiController,
                        color: RankData.colors[rank.data].avgColor(false),
                        onPressed: (){
                          setState((){});
                        },
                      ),
                    ),
                  ),

                  AnimatedOpacity(
                    opacity: rank.inProgress || rank.completed?0:1,
                    duration: const Duration(milliseconds: 300),
                    child: IgnorePointer(
                      ignoring: !showClaim,
                      child: ClaimButton(
                        rank,
                        color: RankData.colors[rank.data].avgColor(false),
                        confettiController: confettiController,
                        onClaimed: () => setState(() => Provider.of<RankProv>(context, listen: false).notify()),
                      ),
                    ),
                  ),

                ],
              );
            },
          ),
          backgroundIconComplete: MdiIcons.trophyAward,

          completenessPercent: rank.completenessPercent,
          inProgress: rank.inProgress,
          isReadyToComplete: rank.isReadyToComplete,
          completed: rank.completed,
          completedDate: rank.completionDate,
          onCompleteDateChanged: (DateTime dateTime) => setState(() => rank.setCompletionDate(dateTime)),
          onStartStopTap: (bool inProgress) => setState(() => rank.changeInProgress(context)),
          onAbandonTap: (){
            rank.changeCompleted(context, value: false, localOnly: true);
            rank.changeInProgress(context, value: false);
            Provider.of<RankProv>(context, listen: false).notify();
            setState(() {});
          },

          showAppBar: showBack,
          confettiController: confettiController,

          previewOnly: widget.previewOnly,
      ),
    );

  }

}

class StopField extends StatelessWidget{

  final String title;
  final String text;
  const StopField({@required this.title, @required this.text, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        if(text != null)
          Row(
            children: [

              //Icon(MdiIcons.lightbulbOutline, color: iconDisab_(context)),
              const SizedBox(width: Dimen.ICON_SIZE),
              const SizedBox(width: Dimen.ICON_MARG),

              Text(
                title,
                style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                  fontWeight: weight.halfBold,
                ),
              ),
            ],
          ),

        if(text != null)
          const SizedBox(height: 2 * Dimen.ICON_MARG),

        if(text != null)
          Text(
            text,
            style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_BIG,
            ),
          ),
      ],
    );
  }

}

class RankOneLineField extends StatelessWidget{

  final String title;
  final String text;
  const RankOneLineField({@required this.title, @required this.text, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    if(text != null)
      return Row(
        children: [
          //Icon(MdiIcons.clockOutline, color: iconDisab_(context)),
          const SizedBox(width: Dimen.ICON_SIZE),
          const SizedBox(width: Dimen.ICON_MARG),

          Text(
            title,
            style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_APPBAR,
              fontWeight: weight.halfBold,
            ),
          ),

          Text(
            text,
            style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_APPBAR,
            ),
          ),
        ],
      );
    else
      return Container();

  }

}

class SharedUsersWidget extends StatefulWidget implements PreferredSizeWidget{
  
  final Rank rank;

  const SharedUsersWidget(this.rank, {Key key}): super(key: key);
  
  @override
  State<StatefulWidget> createState() => SharedUsersWidgetState();

  @override
  Size get preferredSize => const Size(
      0,
      AccountThumbnailRowWidget.defSize + 2*Dimen.DEF_MARG + 2*Dimen.ICON_MARG + Dimen.TEXT_SIZE_NORMAL
  );
  
}

class SharedUsersWidgetState extends State<SharedUsersWidget>{

  Rank get rank => widget.rank;

  SharedUsersProvider sharedUsersProv;
  bool loading;
  bool success;

  void loadSharedUsers({bool resetState = false}){

    if(Rank.sharedUsers.containsKey(rank)) {
      sharedUsersProv._users = Rank.sharedUsers[rank];
      success = true;
      return;
    }

    loading = true;

    if(resetState) setState(() {});

    ApiRank.getAllShareUsers(
        rank.uniqRankName,
        onSuccess: (sharedUsers){
          sharedUsersProv.users = sharedUsers;
          /*
          [
            UserData(key: '1', name: 'Ktośtam Nowak', sex: Sex.male),
            UserData(key: '2', name: 'Miarain Brajan', sex: Sex.male),
            UserData(key: '3', name: 'Urszula Boberek', sex: Sex.female),
            UserData(key: '4', name: 'Wojciech Kurpel', sex: Sex.male),
            UserData(key: '5', name: 'Kladiusz Precel', sex: Sex.male),
            UserData(key: '6', name: 'Konrad Dżozef', sex: Sex.male)
          ];
          */
          loading = false;
          success = true;
          setState(() {});
        },
        onError: (){
          loading = false;
          success = false;
          setState(() {});
        }
    );

  }

  LoginProvider loginProvider;
  LoginProviderListener loginListener;

  @override
  void initState() {

    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginListener = LoginProviderListener(
      onRegistered: (){
        loadSharedUsers(resetState: true);
      },
      onLogin: (confirmed){
        if(confirmed)
          loadSharedUsers(resetState: true);
      },
      onEmailConfirmChanged: (confirmed){
        if(confirmed)
          loadSharedUsers(resetState: true);
      }
    );
    loginProvider.addLoginListener(loginListener);

    sharedUsersProv = Provider.of<SharedUsersProvider>(context, listen: false);

    loading = false;
    success = false;

    if(AccountData.loggedIn) loadSharedUsers();
    super.initState();
  }

  @override
  void dispose() {
    loginProvider.removeLoginListener(loginListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<SharedUsersProvider>(
      builder: (context, prov, child){

        Widget child;

        if(!AccountData.loggedIn)
          return SizedBox(
            height: widget.preferredSize.height,
            width: double.infinity,
            child: SimpleButton(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              onTap: () => AccountPage.open(context),
              radius: AppCard.BIG_RADIUS,
              color: background_(context),
              elevation: AppCard.bigElevation,
              clipBehavior: Clip.hardEdge,
              child: Stack(
                alignment: Alignment.center,
                children: [

                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Icon(
                      MdiIcons.accountCircleOutline,
                      color: backgroundIcon_(context),
                      size: widget.preferredSize.height + 4,
                    ),
                  ),

                  Text('Zaloguj się,\nby udostępnić stopień', style: AppTextStyle(
                      fontWeight: weight.halfBold,
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      color: hintEnab_(context)
                  ), textAlign: TextAlign.center),
                ],
              ),
            ),
          );

        else{
          if(loading)
            child = Row(
              children: [
                const SizedBox(width: Dimen.ICON_FOOTPRINT),
                Expanded(child: Text('Ładowanie...', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR), textAlign: TextAlign.center)),
                const SizedBox(width: Dimen.ICON_MARG),
                SpinKitChasingDots(color: RankData.colors[rank.data].avgColor(AppSettings.isDark), size: Dimen.ICON_SIZE),
                const SizedBox(width: Dimen.ICON_MARG),
              ],
            );

          else if(success)
            child = Row(
              children: [

                if(sharedUsersProv.users.isEmpty)
                  const SizedBox(width: Dimen.ICON_FOOTPRINT),

                if(sharedUsersProv.users.isEmpty)
                  Expanded(
                    child: Text(
                      'Tylko Ty masz tu dostęp.',
                      style: AppTextStyle(
                          color: hintEnab_(context),
                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                          fontWeight: weight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                else
                  Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: AccountThumbnailRowWidget(
                          sharedUsersProv.users.map((user) => user.name).toList(),
                          clipBehavior: Clip.hardEdge,
                          //padding: EdgeInsets.all(Dimen.DEF_MARG),
                          screenWidth: MediaQuery.of(context).size.width - 2*Dimen.DEF_MARG - Dimen.ICON_FOOTPRINT,
                          elevated: false,
                          heroBuilder: (index) => sharedUsersProv.users[index],
                        ),
                      )
                  ),

                IconButton(
                    icon: const Icon(MdiIcons.share),
                    onPressed: () => openShareDialog(context, rank, sharedUsersProv)
                ),

              ],
            );

          else
            child = Row(
              children: [
                const SizedBox(width: Dimen.ICON_FOOTPRINT),
                Expanded(child: Text('Problem z ładowaniem', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR), textAlign: TextAlign.center)),
                IconButton(
                  icon: const Icon(MdiIcons.refresh),
                  onPressed: loadSharedUsers,
                )
              ],
            );
        }

        return Material(
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          color: background_(context),
          elevation: AppCard.bigElevation,
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: Dimen.ICON_MARG, bottom: Dimen.ICON_MARG, left: Dimen.ICON_MARG),
                child: Text('Osoby, którym udostępniono stopień:', style: AppTextStyle(
                    fontWeight: weight.halfBold,
                    fontSize: Dimen.TEXT_SIZE_NORMAL,
                    color: hintEnab_(context)
                )),
              ),

              Expanded(child: child)
            ],
          ),
        );
      }
  );
  
}

class ShareDialog extends StatefulWidget{

  final Rank rank;
  final SharedUsersProvider sharedUsersProv;
  
  const ShareDialog(this.rank, this.sharedUsersProv, {Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => ShareDialogState();

}

class ShareDialogState extends State<ShareDialog>{

  Rank get rank => widget.rank;
  SharedUsersProvider get sharedUsersProv => widget.sharedUsersProv;

  List<UserDataNick> usersToAdd;
  List<UserData> usersToRemove;

  List<UserData> initUsers;
  List<UserData> get users{
    List<UserData> _users = [];
    _users.addAll(initUsers);
    _users.addAll(usersToAdd);
    return _users;
  }

  bool processing;

  bool get anythingChanged => usersToAdd.isNotEmpty || usersToRemove.isNotEmpty;

  @override
  void initState() {
    usersToAdd = [];
    usersToRemove = [];
    initUsers = sharedUsersProv.users;

    processing = false;

    super.initState();
  }

  void addNewUser() async {
    UserData user = await openSearchUserDialog(
        context,
        illegalUserKeys: initUsers.map((user) => user.key).toList(),
        illegalAttemptMessage: 'Użytkownik ma już dostęp do stopnia.'
    );

    if(user == null) return;

    setState(() => usersToAdd.add(user));
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        child: AppScaffold(
          appBar: AppBar(
            title: const Text('Udostępnij'),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.check),
                onPressed: anythingChanged?() async {
                  setState(() => processing = true);
                  showLoadingWidget(context, RankData.colors[rank.data].avgColor(AppSettings.isDark), 'Chwileczkę...');
                  await ApiRank.shareRank(
                      rank.uniqRankName,
                      addByNick: usersToAdd.map((user) => user.nick).toList(),
                      removeByKey: usersToRemove.map((user) => user.key).toList(),
                      onSuccess: (users){
                        sharedUsersProv.users = users;
                        Navigator.pop(context);
                      },
                      onError: () => mounted?showAppToast(context, text: 'Coś poszło nie tak...'):null,
                  );
                  await popPage(context);
                  if(mounted) setState(() => processing = false);

                }:null
              )
            ],
          ),
          body: Builder(
            builder: (context){

              if(users.isEmpty)
                return Center(
                  child: SimpleButton(
                    radius: AppCard.BIG_RADIUS,
                    onTap: addNewUser,
                    child: const Padding(
                      padding: EdgeInsets.all(Dimen.SIDE_MARG),
                      child: EmptyMessageWidget(
                        icon: MdiIcons.accountPlusOutline,
                        text: 'Udostępnij stopień\nnowej osobie',
                      ),
                    )
                  ),
                );

              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index){

                    bool removed = usersToRemove.contains(users[index]);

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: Dimen.SIDE_MARG/2, horizontal: Dimen.SIDE_MARG),
                      leading: Hero(
                          tag: users[index],
                          child: AccountThumbnailWidget(name: users[index].name, enabled: !removed, elevated: false)
                      ),
                      title: Text(
                          users[index].name,
                          style: AppTextStyle(
                              color: removed?hintEnab_(context):textEnab_(context),
                              decoration: removed?TextDecoration.lineThrough:TextDecoration.none
                          )
                      ),
                      trailing:
                      removed?
                      IconButton(
                        icon: const Icon(MdiIcons.refresh),
                        onPressed: () => setState(() => usersToRemove.remove(users[index])),
                      ):
                      IconButton(
                        icon: const Icon(MdiIcons.close),
                        onPressed: (){
                          UserData user = users[index];
                          if(!usersToAdd.remove(user))
                            usersToRemove.add(user);

                          setState((){});
                        },
                      ),
                    );
                  }
              );

            },
          ),
          bottomNavigationBar:
          users.isEmpty?null:
          SimpleButton.from(
            context: context,
            margin: EdgeInsets.zero,
            icon: MdiIcons.plus,
            text: 'Udostępnij nowej osobie',
            onTap: addNewUser,
          ),
        ),
      ),
    ),
  );


}

Future<void> openShareDialog(BuildContext context, Rank rank, SharedUsersProvider sharedUsersProv) => openDialog(context: context, builder: (context) => ShareDialog(rank, sharedUsersProv));

class SharedUsersProvider extends ChangeNotifier{

  Rank rank;
  List<UserData> _users;
  List<UserData> get users => _users;
  set users(List<UserData> value){
    _users = value;
    _users.sort((user1, user2) => user1.name.compareTo(user2.name));
    Rank.sharedUsers[rank] = value;
    notifyListeners();
  }

  SharedUsersProvider(this.rank, this._users){
    _users.sort((user1, user2) => user1.name.compareTo(user2.name));
  }

}