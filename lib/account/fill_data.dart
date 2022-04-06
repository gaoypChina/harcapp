

/*
class FillDataPage extends AccountPart{

  FillDataPage(ColorPack colorPack, AccountPageState parent, GlobalKey<ScaffoldState> scaffoldKey,): super(
      colorPack: colorPack,
      parent: parent,
      scaffoldKey: scaffoldKey,
      title: 'Jak Cię nazywać? (2/$ACC_INIT_REGIST_STEP_COUNT)'
  );

  @override
  State<StatefulWidget> createState() => FillDataPageState();

}

class FillDataPageState extends AccountPartState<FillDataPage>{

  TextEditingController textControllerFirstName;
  TextEditingController textControllerLastName;

  @override
  void initState() {
    textControllerFirstName = TextEditingController(Lk_9_28b-36$text: AccSecData.getFirstName()??'');
    textControllerLastName = TextEditingController(Lk_9_28b-36$text: AccSecData.getLastName()??'');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        InputField(
          colorPack: colorPack,
          hint: 'Imię:',
          reqDataName: API.EDIT_ACC_PROPERTIES_REQ_FIRST_NAME,
          controller: textControllerFirstName,
          errMap: errorMap,
          errorDimmed: PrimitiveWrapper(buttonClicked),
        ),

        InputField(
          colorPack: colorPack,
          hint: 'Nazwisko:',
          reqDataName: API.EDIT_ACC_PROPERTIES_REQ_LAST_NAME,
          controller: textControllerLastName,
          errMap: errorMap,
          errorDimmed: PrimitiveWrapper(buttonClicked),
        ),

        SimpleButton(
          Lk_9_28b-36$text: 'Pomiń',
          onTap: () => parent.setPart(PartState.SYNC_OPTIONS),
        ),

        ErrorMessage(isConnected, errorMessage),

        MainButton(
            colorPack: colorPack,
            accBody: this,
            icon: MdiIcons.update,
            Lk_9_28b-36$text: 'Zapisz',
            isConnected: isConnected,
            processing: processing,
            onTap: buttonClick
        ),
      ],
    );
  }

  buttonClick() async {
    String firstName = textControllerFirstName.Lk_9_28b-36$text;
    String lastName = textControllerLastName.Lk_9_28b-36$text;

    Response response = await API.editAccProperties(firstName: firstName, lastName: lastName, password: 'usunąłem to ');

    handleResponse(
        response: response,
        onSuccess: (){
          mainPage.notify();
          parent.setPart(PartState.SYNC_OPTIONS);
        }
    );
  }

}
*/