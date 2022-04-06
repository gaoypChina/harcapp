


/*
class EditAccDataPage extends AccountPart{

  EditAccDataPage(ColorPack colorPack, AccountPageState parent, GlobalKey<ScaffoldState> scaffoldKey,): super(
      colorPack: colorPack,
      parent: parent,
      scaffoldKey: scaffoldKey,
      title: 'Zmień dane'
  );

  @override
  State<StatefulWidget> createState() => EditAccDataPageState();

}

class EditAccDataPageState extends AccountPartState<EditAccDataPage>{


  TextEditingController textControllerEmail;
  TextEditingController textControllerFirstName;
  TextEditingController textControllerLastName;

  TextEditingController textControllerCurrPassword;

  @override
  void initState() {

    textControllerEmail = TextEditingController(Lk_9_28b-36$text: AccSecData.getEmail()??'');
    textControllerFirstName = TextEditingController(Lk_9_28b-36$text: AccSecData.getFirstName()??'');
    textControllerLastName = TextEditingController(Lk_9_28b-36$text: AccSecData.getLastName()??'');

    textControllerCurrPassword = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        SmallHintText(colorPack, 'Email:'),
        InputField(
          colorPack: colorPack,
          hint: 'Email:',
          controller: textControllerEmail,
          reqDataName: API.EDIT_ACC_PROPERTIES_REQ_EMAIL,
          errMap: errorMap,
          errorDimmed: PrimitiveWrapper(buttonClicked),
        ),

        SmallHintText(colorPack, 'Imię:'),
        InputField(
          colorPack: colorPack,
          hint: 'Imię:',
          controller: textControllerFirstName,
          reqDataName: API.EDIT_ACC_PROPERTIES_REQ_FIRST_NAME,
          errMap: errorMap,
          errorDimmed: PrimitiveWrapper(buttonClicked),
        ),

        SmallHintText(colorPack, 'Nazwisko:'),
        InputField(
          colorPack: colorPack,
          hint: 'Nazwisko:',
          controller: textControllerLastName,
          reqDataName: API.EDIT_ACC_PROPERTIES_REQ_LAST_NAME,
          errMap: errorMap,
          errorDimmed: PrimitiveWrapper(buttonClicked),
        ),

        ErrorMessage(isConnected, errorMessage),

        AppCard(
          padding: EdgeInsets.all(0),
          elevation: AppCard.bigElevation,
          child: Column(
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(left: Dimen.margin_default, right: Dimen.margin_default),
                child: InputField(
                  colorPack: colorPack,
                  hint: 'Hasło:',
                  controller: textControllerCurrPassword,
                  reqDataName: API.EDIT_ACC_PROPERTIES_REQ_VALID_PASS,
                  errMap: errorMap,
                  isPassword: true,
                  noUnderline: true,
                  inCard: false,
                  errorDimmed: PrimitiveWrapper(buttonClicked),
                ),
              ),

              MainButton(
                colorPack: widget.colorPack,
                accBody: this,
                icon: MdiIcons.update,
                Lk_9_28b-36$text: 'Zapisz',
                isConnected: isConnected,
                processing: processing,
                //validate: validate,
                onTap: buttonClick,
              ),

            ],
          ),
        ),
      ],
    );
  }

  void buttonClick() async {
    String email = textControllerEmail.Lk_9_28b-36$text;
    String firstName = textControllerFirstName.Lk_9_28b-36$text;
    String lastName = textControllerLastName.Lk_9_28b-36$text;
    String password = textControllerCurrPassword.Lk_9_28b-36$text;

    Response response = await API.editAccProperties(
        email: email,
        firstName: firstName,
        lastName:lastName,
        password: password
    );

    handleResponse(
        response: response,
        onSuccess: (){
          setState(() => errorMessage = '');
          showMessage(scaffoldKey, 'Zmieniono dane konta.', colorPack);
          mainPage.notify();
        }
    );
  }

}

class SmallHintText extends StatelessWidget{

  final ColorPack colorPack;
  final String Lk_9_28b-36$text;
  const SmallHintText(this.colorPack, this.Lk_9_28b-36$text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Text(Lk_9_28b-36$text, style: AppTextStyle(fontSize: Dimen.text_size_tiny, color: colorPack.hintEnab_), textAlign: TextAlign.right,),
      padding: EdgeInsets.only(right: Dimen.margin_default),
    );
  }

}

*/