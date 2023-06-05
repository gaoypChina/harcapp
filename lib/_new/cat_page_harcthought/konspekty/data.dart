import 'package:harcapp/_new/cat_page_harcthought/konspekty/konspekt.dart';
import 'package:harcapp/values/people.dart';

List<Konspekt> allKonspekts = [

  const Konspekt(
    name: 'gang_potencjalnych_porywaczy',
    title: 'Gang potencjalnych porywaczy',
    coverAuthor: 'freepik.com (vectorpouch)',
    author: JULIA_JAROSZ,aims: [
      'Poprawa umiejętności pracy w zespole i przyjmowania potrzebnych w zepole ról',
      'Poprawa umiejętności koordynowania działań w zespole',
      'Poprawa umiejętności analizy i dyskryminowania między informacjami ważnymi i nieważnymi',
    ],
    intro: 'Harcerze dowiadują się, że <b>nad ranem</b> w <b>weekend</b> dokonano porwania ważnej osoby. Policja ustaliła już, że za porwaniem stoi jeden z działających w okolicy gangów.'
        '\n'
        '\nHarcerze wyruszają, by zdobyć informacje o gangach. Ich zadaniem jest zebrać jak najwięcej informacji, przeanalizować je i wskazać, który gang, ich zdaniem, dokonał porwania. Wnioski harcerzy muszą być poparte argumentami.',
    description: 'Lista okolicznych gangów:'
        '\n- Gang Olszaka'
        '\n- Szajka Łysego'
        '\n- Świnki trzy'
        '\n- Łaciata paczka'
        '\n- Grupa Mariana'
        '\n- Nowa ekipa'
        '\n- Dzika wataha'
        '\n- Robaczek i spółka'
        '\n- Kolorowe irokezy'
        '\n'
        '\nHarcerze mają do zdobycia 64 wycinki informacji (załącznik: <b>wycinki informacji<b>). Spośród nich jedynie 8 wycinków ma znaczenie dla sprawy, ponieważ dają alibi niektórym gangom - pozostałe wycinki nie mają żadnego znaczenia.'
        '\n'
        '\nAlibi posiadają następujące gangi:'
        '\n- Gang Olszaka'
        '\n- Szajka Łysego'
        '\n- Świnki trzy'
        '\n- Łaciata paczka'
        '\n- Dzieci ulicy'
        '\n- Grupa Mariana'
        '\n- Nowa ekipa'
        '\n- Dzika wataha'
        '\n'
        '\nAlibi nie posiadają następujące gangi:'
        '\n- Robaczek i spółka'
        '\n- Kolorowe irokezy'
        '\n'
        '\nTrudność gry polega na odpowiednim skoordynowaniu działań przez harcerzy i uporządkowaniu zebranych informacje.'
        '\n'
        '\n<b>Grę można uprościć</b> podając harcerzom wskazówkę: wycinki informacji są opatrzone kolorwami i w każdej grupie danego koloru kluczowy jest tylko jeden wycinek.'
        '\n'
        '\n<b>Grę można utrudnić</b> sprawiając, by żadna osoba lub grupa nie zdobyła zbyt dużej liczby wycinków informacji i by była skazana na współpracę z innymi.'
        '\n'
        '\nForma zdobywania wycinków informacji jest dowolna: mogą one być nagrodą w innej grze za wykonane zadania, mogą być schowane na określonym terenie, itp..',
    attachments: [
      KonspektAttachment(
        name: 'Wycinki informacji',
        asset: 'assets/konspekty/gang_potencjalnych_porywaczy/wycinki_informacji.pdf',
      )
    ],
  ),

];