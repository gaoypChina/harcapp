import 'dart:async';

import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'comp_role.dart';
import 'models/indiv_comp.dart';
import 'models/indiv_comp_particip.dart';

class IndivCompParticipantsLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<IndivCompParticip>, bool)? onParticipantsLoaded;

  IndivCompParticipantsLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onParticipantsLoaded,
  });

}

class IndivCompParticipantsLoader extends SingleComputer<String?, IndivCompParticipantsLoaderListener>{

  @override
  String get computerName => 'IndivCompParticipantsLoader';

  late IndivComp _comp;
  late int _pageSize;
  CompRole? _lastRole;
  String? _lastUserName;
  String? _lastUserKey;

  @override
  Future<bool> run({
    bool awaitFinish = false,
    IndivComp? comp,
    int pageSize = IndivComp.participsPageSize,
    CompRole? lastRole,
    String? lastUserName,
    String? lastUserKey,
  }){
    assert(comp != null);
    _comp = comp!;
    _pageSize = pageSize;
    _lastRole = lastRole;
    _lastUserName = lastUserName;
    _lastUserKey = lastUserKey;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (IndivCompParticipantsLoaderListener listener in listeners)
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiIndivComp.getParticipants(
        comp: _comp,
        pageSize: _pageSize,
        lastRole: _lastRole,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<IndivCompParticip> participsPage){

          bool reloaded = _lastRole == null && _lastUserName == null && _lastUserKey == null;

          IndivCompParticip me = _comp.getParticip(AccountData.key!)!;
          IndivCompParticip? loadedMe = participsPage.where((particip) => particip.key == me.key).firstOrNull;
          if(loadedMe != null) {
            participsPage.removeWhere((particip) => particip.key == me.key);
            participsPage.insert(0, loadedMe);
          } else if(reloaded) {
            participsPage.removeWhere((particip) => particip.key == me.key);
            participsPage.insert(0, me);
          }

          if(reloaded)
            _comp.setAllLoadedParticips(participsPage);
          else
            _comp.addLoadedParticips(participsPage);

          for(IndivCompParticipantsLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onParticipantsLoaded?.call(participsPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(IndivCompParticipantsLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(IndivCompParticipantsLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callKnownError(null),
    );

  }

}