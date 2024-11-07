# --- Part Two ---
#
# Now, you're ready to remove the garbage.
#
# To prove you've removed it, you need to count all of the characters within the
# garbage. The leading and trailing < and > don't count, nor do any canceled
# characters or the ! doing the canceling.
#
#     <>, 0 characters.
#     <random characters>, 17 characters.
#     <<<<>, 3 characters.
#     <{!>}>, 2 characters.
#     <!!>, 0 characters.
#     <!!!>>, 0 characters.
#     <{o"i!a,<{i<a>, 10 characters.

def stream(input)
  index = 0
  garbage = 0
  char = nil
  within_garbage = false
  characters = input.chars

  loop do
    break if index >= characters.size

    char = characters[index]

    case char
    when '{'
      garbage += 1 if within_garbage

      index += 1
    when '<'
      garbage += 1 if within_garbage
      within_garbage = true
      index += 1
    when '>'
      within_garbage = false
      index += 1
    when '!'
      index += 2
    else
      garbage += 1 if within_garbage
      index += 1
    end
  end

  garbage
end

puts stream '<>'
puts stream '<random characters>'
puts stream '<<<<>'
puts stream '<{!>}>'
puts stream '<!!>'
puts stream '<!!!>>'
puts stream '<{o"i!a,<{i<a>'
puts stream <<~INPUT
  {{{{{},{<!!!>},<}<!e!>,<<!>!>},<>,{<"u!!!>,!!'!!!>!>,<}{!>,<u!!!>e>}},{{{<!!!>,<!>u!!,>},{}}}},{{<,!>},<!>},<ae!!<''"!>},<"}ii!>},<!>!!!>>,<o!!}!!!>o!>},<{,<<!!{{u{!!!>!>},<!>,<>},{},{<!!,i!!i'!>},<ea!!!>{!}!>!!i!!>}}},{{{{<i!!!>o'!!{'>},{<!!!>ao,!!!>!u!!!>{<'oui!!"!>>}},{<}{!>},<a!>},<!!<'o,!!o!!!>'}!a>}}},{{{<!>>},{{<!!!!!>!!!>o!"!!!>!!!>},<i>}},{{<'!!<!!!>!>i!>,<a'>}}},{{{{{{<e!!!>{>},{{{<!!>},{}},{}}}},{{{<}ai,!,i!>,<,aii}!>},<!!,!>},<!!!>},<}>}},<"a!i'{>}},{{<a!!,!<{e!!!>},<u!>,<!!!>"<{oe>,<"ie!>!!!><!>},<!!!"!!"'{u>},{{<}!a!>},<!!a<!>},<!>!!!>}!!{o!>},<ia}o!>>}},{{<!>},<!>!!e!!a{!!i!!u{{!ao>}}},{{},{}}},{{{<!a}>},<e!>,<!>},<!>},<{},,!>,<>},{{<!!!>u!!"}!>},<i!>,<!!}>}},{<!>a{<i'!>!!'!!}!>","o!>},<!!"<!!>,<<!!!>!>},<!>},<>}},{{{<!!}!>'!>},<<!>},<"!>},<!>,i,,!>,<!">},{{{<!}}<o!>,<}!!!>!'e}!>},<i!!o}!>},<u!!e!>>}},{<>}}},{{}}}},{{},{{{{<!>,<i,e!!"!>,<'!!!>u!>!>'}>},<o>},{{{{<''!!{!!iu}}!>uoi!><!!{!>!<u>},<o!>,<a!>},<!>,<{,!>u>},<}!!'>}}},{{<a{,!!!!!>i!!,<!>},<!!!><>,<!>'"i!!">},{{<!>,<{i!>},<!>,<>,{}}}},{{},{{<}ei}!!'e",i!>,<o!!<'e}!!!<>}}}}},{{{},{{{{<!!'u!!!>{o!!a!!!>!!!"o>},{{<a},<<!>,<!>ii!!!>!!!>!>,<'u!>},<o,!>,<!!!>>}}},{<,>},{{},<<"{!}'{!!!>}'!>,'ae!>},<>}},{{<!>,<e!!!!!>o!!!>a!>,<}}}e!>!>e!>},<!!<u!e>,<ea'!!!>,eao<eoo>},{{<e'ioi!!e{u{e<e!!!>},<i'!!!>'>},{{{<!>!>,<!!o!!,{a"o<!>,<e!!a<u!',a>},<!!!>''!>,<<!>,<u!>,<uo!e!>,<a!>,<>}},{<!>io!!<!!!>,!>,<,!>},<!!,oi!>>,{<!!"!!}!!,>}}},{{}}},{{{<!!!>'!e!!!>o{>},{<'e!!i<i!!}!!!!!>},<{>}},{<a!}ia>},{<!!o>,<aa}!!!!!>},<''!"!!!>>}},{{{<!>},<'!>,<{!"!>},<!!!>>,<!!!>ii!!eoo!>,<i!!e>},{{{<<i!>},<!!>},<'"}<}!>!!!>,<{!>},<!<!!i'}u>}}},{{<i!!!>!e}!><!!!!<e!>!!u!!!!ie!!!!!>aa{>},{}},{{<''!!o!!'!>},<!!!>!!!!!i!o'a!>},<oeu!'>},{{<,u!!,!>},<!!}!>!!}""aa>},{<a<iu!>},<u>}}}}},{},{{{{{<>,{<u!!!>!u{,}u!,!!!!!>!!",!>!>},<!!{>}},{<!>},<!<a!!!>,<{!!!><,e!<e!>},<a!uu{>}},{{},{}},{{{},{<a<!>u!!!>'!>},<e>,<!!"ea!<u!>,<,i!!>}},<!'!!!>}">}},{{<!>},<ou}a}>},{<}!>,<{uo!!!>!a!><!!!>e'!>},<aai>}}},{{<!!!!{"o!!!>},<{}e!>!>"!>},<{!!!>,<!!!>!!!>!!i{>}},{<'e>,{{<'!!!>a{!!"ouo{>},{<!!!>"!<!>},<"!}u!><o'!!ii{}!!"o>}}}}},{{{},{<!,!>,<!!u!>o}!>!>,<!>,<!a!e!!>,<!!"{,!>,<!>i<,!!!>>},{{{<!>},<i!!!i>,<!>{!i!e!>,<!>,<>},{<!!!<!!a!!>,{<o>}},{}},{<!!'!!!!"!e,!!!!'e!!!!,!!!>ua"!e!>u!u>}}},{{{},{{},{{<!!!!,!!!!!!!!!!!>,<e!!!!}}{a!>,<!!!!{>,{<!!i"},u!>},<o!>},<a"ie">}},<!>},<!!!>!>!>},<<'"'>}},{{}}},{{<i>,{{<}'!!!>!>,<u,!!{!!!>!"!!!>},<'o>}}},{<!!!>!>},<!>,<!o>}},{{{<oo!!!!oo!!!!!!o>},<"<!!!>>},{{}}}},{{},{<u!>},<!!!><,i!>,<!!'{'>}}},{{<ae},a>},{<{"!>i,"!!!>a!!!>>},{<!!!>!'{<<<o>,{<"e",a>}}},{{{<{!!e<!!!>u,!>,<u>,{<<"<oee!>,<!!,<'!!!>!!!>{!,">,{<<!!!>ai!!!>},<u>}}}}}}}},{{{{{}},{<e,"u!!!!!!oa'oe}a<e,u>}},{{{<'{!'!!!>,o{{!i'u>,{<!!i!!!!!>ae!!!e!e!}{u>}},{},{{<,u''}>},{<{a'!>,<,a!eou!o!!',"'}u,>}}},{{{<!!!!'>,{}},{{<}<{a!>},<}<!!!>u!<a,!>!!a!>,<!!{'>}},{<!!a!!!>,iaou!>},<oia!"!!!>},<!!!><!!!>u!>},<>,<!!e}{i,,u>}},{<!!!>uu!!eea!>},<'}!e!>},<!!o!!!!,>}},{{{<io!>,<}}e"!!!!!>,<!>''!>,<ii!!!>,<!>},<!>!>},<>},{<!!!>!>!{''!{u!>,<a,!!a>}},{<e'"<!!!>o!!,i}!{<,!!!>!"o!!"u'>}}},{{{{{<!!}!>!>,<u!!ae""o!!!!{!>>}},{{{{<i!>,"!>,<{,!!',!>!{!>!!!>,<o'!!!>>},{<!!!>,!!u>,{<"!>},<o!>,"!"!>,<u',!!!!o>}}}}}},{<eo!!u!>,!>,<!!!!}}>},{{},{<!{<>}}},{<!!{!!!!!'"<!!!>'!!"u>,{<"ao!>},<!!!!'oe!!o!!u!>},<o}!>,<o>}}},{{{<!>!>,<!,a!>!a"}!!{<!>!>!>>},<ou>},{{}},{{{<!>!>},<!>{!!!>!>},<i,,!>},<o>},{{},{{<a!!!><"'!>!>},<!e>},{}}}},{{}}}}},{{{{{{}}},{<!>,<}<,"a!,!a!!!>"!!'>}},{{{{{<'u{a>}}}},<{!!!>!>,<!!!>!!<'u!>},<>},{{<">},{}}},{{{<'!}''"!{,}<ui}e!!!>!>{}">,{}},{{<!!i!!!>!!!>,<u!!!>}!!!>eoio>},{{<!>},<!e!>,<"!>,<!>,<!oo!!o"aiu!>},<>}}},{<u!!!>!>,<>,<o!u}>}},{},{{},{{{},{<a!!!>!!,!!<"'!!!>,!>},<<"!!!!!!!!!!!>,>}},{<a>,{{<!>},<!!!e{!>},<,>}}}},{{{<<<i'"!!!!!!}i!!!>,<'!>!"!!!>e!!!!e}!!!!>},{<",{!>o!>},<,,!!>}},{{<>},<>}}}},{{{{{<u{!!!>!!!>}}}i>,{{<"u<!!!>!!!>!!!!ea{!!!!!!!>u!!!>ie>}}},{<!!!>'!!!>,<i{!!!>>}}},{{{{{{}}},{{{{<{,{a!!!>!o!>,<'{>,{}}},{{{{<!!!!,>},{<e!>,<!!!>!!!e{"',}!,>}},{<!>}!>},<,!oo!>>},{{<!!<'!!!>!!,'!>},<i>},<!>!>},<!>,<ae!>e>}},{{<!!!>!!u!><o!>!!!>!!!>,<>},{<eii!i}!!!!u!{{>}},{{<,uaa!>},<e'!>,<'u!>,<!>!>,<!!>},{{<{}!>},<>}}}},{{},{}}},{<oo!>,<!!i>,<!>},<"}"}!'!!!!u!>},<!>,<!!!>},<eu!!!>>},{{<a!!!>,<!>},<!!}!!!!{!>},<}o!>,<!>},<!!!>},<'a{!!!!!o>,{}},{{{<!>'!>!>"!!!!!>,>}},{<!!<!u!!,>,{}}}}},{{{{{<!!!!u!!!>!>,<!{!!<'""i!!,!>},<,>,<!>,<o!>,<}a!!!>}a!!!!!>'!>a<!!>}},{{<!ea!!!!u!>!>,<!e!!o!>},<'>},{<!{>}}},{{{<}",'!!o}>}},{},{<a!!!!!>!!!>!>,<a!!o!!!>,<'u>,<{!i!!!>},<!!!>{<!>,<'!!!>{ii'iu!"!u!!!>>}},{{{<'!e!!{>}},{{{},{<i!!!!!!}!!!>u!!!>"!>a>}},{{{<"'!!!!!>"uee!!!!!!o!>,<"'!!",>},<{>},{{<!!!!iu}!!!{}!!"!>,<"!>!"oiuo>,<e">},{<!>},<!"!<{a!>!<>,<e'aaa!!!!!>a"!!!>,<!>!!}<>},{<!<}}!>},<a{!!!>},<!>},<!!!!e'i!>u>,<}!!!>!>,<a!<"!>>}},{{{{<}!>,<!>},<!>},<'e}},!!!>},<}!!!><"}<u!!!u>},<"!>},<'a!!!>>},{<,!!!><!>>}}}}},{}}},{<<!!i>,{<'!>!!i{u!}a!!!>,<!<!}!>},<!>e"!!!!!>,<!!o<>}},{{}}}},{{{<!!!>'!>,<!!!>!>,<u!>},<eaa>},{{<<!!!!!!u!>},<}a!<!>,<>}}},{<},"i!!!>!u!>},<<!>},<>,{<<<!>,<!ou!e!>},<>}}}},{{{{},<"io!}'!>},<!u>},{}},{{<!>},<,!>},<>,{{<!!!!ae!>},<!!"!!u!!u">},{<>}}}}},{{{{{{<"!>},<!!!io>},<!>,<'iiaoo<<'!>,<,!!!>e''>}},{{}},{}},{{<'{!>,<!>},<,"u!>},<o!>>},{<!>},<!>},<!!a!,!>},<"!!!>a!!,uu!>e'!>,<"!!!>>,<!>!>,"}!!!>{!>,<e!u!'o!!!!},ui,>},{{<"u!eo{!!!>!>},<"",!'a!!!!o}{e>},{<,<a{!>!o!'{>}}},{{{{<"!>,<{i!!!>},<!>,<o!>o>},{<ie!!!>'<,!!!>,!u"!!!!!!>}},<e{,!!!>!>,!!>},{{{},<{!!!>i>},{<!!<e>,{}},{{{{{<!>,<a{!>o!i{o!>},<!>{oo!!!!{>},{<a{!!!>u!!!>!>,<!>a'!!<i!>,<>}},{<i{!!!>!>aa}e{u!>,<'>}}}}},{}},{{{{<{,<!u!>{!>,<>},<}u!,a{!ei{{o!i!><oo!>},<ea>},{<!}!!!>a!!"!>,<a,!!!>oeuo!!!>">}},{{{<!>,<>,{<u!"!>,<!>,<!!!!}a!!!>!!u"!>,<',"!!!!e!!i!>,<!'>}},{}},{}},{{{},<o,!!'e{eue!>!>!!!!i!>},<'>},{{<u!>},<!o'!!<!>},<i!oui>,{{<",!!!>!!<!!"<a{e!>},<'!!!!,,""u>}}},{<!"!!,<u!>,<!!u,<i!!!!}>}},{<!>},<!!!!}u"!>,<{u!>!!<<a!!'<!ie}!>>,{}}},{{{{{<"!!ou""!>{,!>u"!>!!uo{{a>}}},{<!!u{!,{!i>}},{{{<ia!{!>},<!!!>>}},{{<!!!>!!e}}}{<!>},<!>!<a!!<!{{u'''>},<ui!,o!"i}>},{{{<o!!!>!>!!!>"}!!!!,!!!>'a!>a!{!!>,{{<!a!>,<i{!>},<"!>!!!>}!>,<'>}}},{<}!>,<>,<{!!!>,<}!!!!!>'!!!>!!!>!>,<!>,<uui!!,>}},{{<}"''>},{}}}},{{<!!!>ouo!!!>'o}}"{!!,e!!o>}}}}},{{},{<u,>,<"!!!!!!}!!!>!!!!,uoe>}}}},{{{<!,'}o<u!><<">},{<a!!{!!i!!ou!>,<o"!!!>>}},{{<!>},<!>,<{!!!>!>"oaoa">},<!,,!!{!{<!>},<"u{au>}},{{<>},{<!!!><<!!!>!!!>!!!>!>,<!>{!oaa!!!!e>,<"!!!>!!u!!,!>},<i!>,<>},{<>}}},{{{<!!>,<!o!!ao!>},<!!!>!!i!!>},{<a!<}o',,!!!>,<!>,<<!>},<>,{<!!!!ao!>ua<!>ea,"aa!!!!!>>}},{{<a!}<{!!!>o!">},<"oia!>,<"<'{!i!!ea!!'!>,<!!ui"!!!>,<u>}},{{}},{{<}!!"ieo!!e!"e}!!!>>},<!>,<>}},{{{}}},{}}}},{{{{{{<ua"a'<!>'"a!iu"!{!>},<!!>,{<!>>}},{{},<!>,<}!>},<aaiuu!>,<u!!!>!!!>i!>',>}},{{{}},{{<!!!>'!>a!!!>},<}!!e}!!!!}>},{<,ue,!>},<!ua}!!>}},{{<!!!>>},<a!!!!>}},{{},{{<!a!>a{!!!>}}>},{<!!!i!!!!!>!'!>},<!!!>},<!!ao!!!!<e>}},{{{<i!>!>!>},<!!oa!!!!}!!!>},<oi'<!>!>,<!!">},<'}!{!!!>{>},{<}!>,<o>}}},{{<<!>},<!>,<o>,{{}}},{},{{{<!>i{!!!>o!!!>!>!!aa!>!u!!o!>,<>},<!!oi}a}!!!>},<!!u>},{}}}},{{<au!!!>"u}!>},<"!!!>>},{{}}},{{<!>},<{e!!!><!>!i<>,{{<o!!"i{!}o<!>,<!!"!>!!!>!>},<!!<oo!!>},{{<!!!>!>},<ea'{",ua!>,<!>,<",{!!!>!!!>,<io>}}}},{<!!o!>},<!i!!}!!!>!>,<!!!!!!!!!aa!>!!!!!>>,{{<!>'!!!>a{}!!>}}},{{{<,!!!>!!u},!>},<!!!>,<!<}">},{<!!!,!!'ae!>i!>,<e}e"!>},<"">}}}}},{{{{{<'a,eo<<!>!!!u'u!>eo<o">,{{{<}">}}}},{<!>},<}!!!!{!!>}},{{<}<!>},<}<}i<!!!>!!!>!!!!!>u>}}},{{{{{{<!!>}}},{{<!!ai<!!!e!!!>}!!!>{!e>},{}}},{<{e!'>},{{{<a>},<!!!>''!>!>,<eo!!>},{<!!!>,<!!e!!!!!>}!!!{e!>},<u>,{{<!!",>}}},{<<!!,!>},<!!e!>,<au{!>>,{<"<u{!>},<!!!!i!>},<{,!!!!!>!<<>}}}},{{<!!}!>},<<!!{!!eo!>,<{a!!!!!>},<>},{{<!!!>!!,!!i!!!!!>{!!!!!i!>ee!>},<}!>a'"iu!!i>}},{<!>!>,<<!>,<>,{<}!>,<!!!!!>">}}}},{{{<'!!!>!e!!!>,<!>i!>o!!!>o!!u,!!!!!!!!!>oa"a>},{<{u>},{<!>,<,!!!>!!!>{o!!!>!!ioi!!!!!!}a{u>}}}},{{{{}},{<,!!u'!!!>a<ii"<!>!!<!!!!!>!>,<'!!e{>}},{{},{},{}}},{{}}},{{{{{{},{},{<u!!!>!!e!!!!,!!!>ui>,{<ou{'!>,<,eeoei"!!!>>}}},{{<!>},<{!!,!,eo'!!<!!<!>,<a>,{{<!>},<a,!>},<!>!!i!!}{o<>}}},{}},{{{<>},{}},<ooa<o!!!>!!!><"!>},<!oi"i!!>}}},{{<i"!!!>{!!!>!!!>,>,<!>,<<{!!'e!!!>!!u!>},}"ei!!!><"i>},{{<ia!>!!o}'!>},<!>!"a!>},<u"!!!>},<i{u'>,<!!!>},<a!>},<!>!!!>!>},<'!o,!>,<e<!!{!>,<!!>},{<o<!>>}},{}},{},{{<!!!>!!}oo<"oo!><i!>e,o!!a,a>,{<!>},<>}},{{}},{{{<ie!>},<!e!!{!><e!>},<'!!!>"!{<>},{{{<!>,<e!>!>,<<}{e!!!!!!iu{!!!>!!<<'>},<!!!>!!a<>},{}}},{{<o!>},<<!>},<'!!a{!!">,{}},{{<io!!ioi!>,<!!"ii!>},<o>,{}},<e!>eee!>},<>}},{{<!>,<{!!i>},{{{}},{{{<>}},<<'ueu!<!!!>!>,<>}}}}}},{{{{<!!<o!!!!!!<>},{<{,i}o!!}a!>,<!!iaa!>},<'<{e>,{{<">},<ae<,'!!!!!>u!!>}},{{},<,>}},{{<!>,<!>,!!!>u!!!>ie!>"!"!!!>!!!!!!!!!>>,<'o!!u}!>,<">},{{}}}}},{{{{<<!>!!!>u'!i!>},<a<o!>>}},{{{<}!!>},<aio"!!!>},<>},{<!!!!"{!!{!!'}!{i',o<!"!>'!>,<!u!>},<>,<,e!!'a""o>}},{<"!e<{<e!!i!>{>,<},ai!>},<>}},{{{<!>!>},<!!!>{ie!!!!">,{{},{<!>}o}ai}>}}},{{{},<i!>},<{ui!!!>u"!>,<oa>},{{<,!u!i<'>,{<i!>},<u!{!!!}'!>,<,'!>},<!!!!!>!!a'!}!}e!!!>,<>}},{<,!i}i!!ue>}}},{{{},{{{<!>,<!>,,!}>}},{{<!>,<oui<i{!!uu!'o!>!!!>,!!!i!!>},{}},{{{{{<!>,<!!ie!<ia!>},<a'!!">}}},<i{i!>,i>},{<!!,a'!>,<!>},<ii<i!>,<!!o!"},!!au!!!>!!!>">,{}}}}}}},{{{<!>,<!>},<!!o!!<!!!>!>,<!!!>!>},<a>},{}},{<u<!!eee!!>,<a!>{!>},<!>},<!!!>i">}}},{{{},{<e>}}},{{{{{},{<!!o!>},<o!!uouao!!!>aa!>},<!>},<>}}},{{{}},{<!!!>e!!!>!!!>,<{!!!>{{'ae!>},<e>,<!!!>},<!'a!>,<i{>},{{{<!>},<}!'e<!!!>,<<}uuu>}},{{{<!>,<,}e!!!>>}}}}},{<!!"u">}},{{{<<"">},{<u<"!!{!!,i!>,<!>},<a!!!>!>},<!!!!!>>}},{<u!!!>,<e"e"!{!o<}!>!u!>,<<!>>,{{<!!oa{<a"!!"<!>!>,<a!!"!>},<>}}}},{{{{<"a"e,a,!ao{!'!>},<!>,<!!}!>},<i>},{<!!!>},<o"o>}},{{<o!!ai!!!>{">,<!<,{i!>},<!!aeo!!!>!"o!>{!>,<<>}}},{},{{{<{!!!i!>},<!>},<,>}},{{{<!!!!e}a!!!>},<!>!,u',{<aa!!e>}},{{}}},{{<u}a!>},<>,<!!{}'!!<>},{<!!!>},<!!!!"!a!>},<<>}}}},{{{<}e!!{"!!'!!!>!!i!>!>!>},<!{i>},{{{<i!>,<a!>,<!>},<a<'!!uu!>},<>}}}},{}}}},{{{<!>},<>,{<aue>,{<'>}}},{<!>,<i!<!>,<e!!<i!!!>{io!!o!!!>ea>,{<oiu!},!!{}!"u"!>},<>}},{{<}uoi{'!!"a!>},<!!!>,<a!>,<,u"!a!!!>>,<!!!>oeoe!>,<!>},<>},{{<uo!>,<",<"e!!}!!!!'!>},<!!a!<>}},{<!!!!a!>u!>},<!>},<a'e!>,<o'!!!>!!!!!>>}}},{{{<!>},<!!!>},<i'!oo,<}a!!e!><!a!i!{>}},{{<oo{>}},{{{<!>},<oo{e!!!>,<>}},{<"!{u<i{i!!!>}a"u!e{!>},<>}}}}}},{{},{{{{},{{<u}<{'!!!!!>!!!>o!!!>,<!!o,"i>}},{{{{<}!"}!!ao!!ua,oe!!!>>},{<!!!,!>!>},<>}},{{}},{{{<>}}}},{}},{{<!<<!!!>u!>,<'a{o,u>,{<!>o!>},<!a<!!'!!!!!!!>!>,<o!>,<!>!>>}},{{},{<!u>,{<!!!>ue<ae}!!"e}!>}!>!!!>>}},{<eu"!>!{!!<>,<oo!!',ea!>},<i!>,<!>"!>!>,<{!>},<{!!>}}}},{{{<'!>>,{<!}!!!>},<"e'!!!>},<"o"!><u!>},<u<>}}},{{{{{<}!!!>a!>,<a!>}{!o!{>},{{}}},{}},{{}}},{<u!!!!!>}!!<!!,}ei!>},<!>!!!o!!!!!>!!,e>},{<u{{'!!"<!!,!'oiii>}}},{{{},{}},{{{<!>",e!!!>o{o!>,<!>}!!!>},<!>,<!>,<'o>}},{}}}},{{{{<u!!!!!}}a{!!!><}!a>,{<ou!<!><">}}},{<!i!!<,<,i<'{>,{<aeo<!!'!!!{!!{'!!!>!!!>,<!!!>!!!!!}e!>},<{>}},{{<<a!!"{,a!>,<!!!>!>,<!!!!!>oui!>},<{u,}>},{<e!!oou!!!>u!!!>!>,!>!!!!,!>,<!!!>},<">}}},{{{{<!!o!>,<"'!>,<!<!!!>{>,{<'!!!!!>eu!>},<!>u!!}>}},{{<i!!!a'{oi!}{!!!>"u,!!!>},<>}}},{{{<!!{!!!>ea"!!"!>!!!>!!!>!>,<!a{i>,{{<!>,<!!}'io!>},<i}!>},<!!!e'{!>,<!!!>,<!o!>,<!>,<>,{<!!i!!>}},<aa!!!!'{>}}},{<o!>},<!!i!>,<}!<!!!>!}{}i,,!!o>,<!!!!'!!!>>},{{<!!!>'a!<"!>},<i!>,!>ea,!e{uue>},{<{!>,<i!>o<,i{}u,"<}>,{{<!>,<!!o,!>},<}u>}}}}},{{{}},{{<!>i>},{{<!>,<!>},<!>},<!>},<!>,ee!>,<!!ee!!!!!>!!!!{!>},<<!!!>e>},{<"!>},<u!'!>},<>}}},{}},{{{{},{{<,"a!,ai{"!!!uo!>!!}{>,<o}e!!!!!>'!!!!!>>}}},{{<!>},<!>,{}i"<>}}},{{{<!!<>},{{<!>,<{!!!!!>i!!}o{!!!!i>},<"!!"u!"}",{<ai<e!o<>}}},{{{{{}},{<!'<<!>},<>,<a!>},<}!>,<>}},{{<ui!iu,<!>},<!>},<,!<!a!>"a!!"!>,<!>>,{{<a!!!>,""}!!!>'>,<{!,!>},<"!!!><!!!>,,!>},<">},{}}},{<,i!>},<u"iuu!!"!!>,{<!{!o!ae{!!!'!>'!'!!e!!!>!!<e!!oao!!!!o!">}},{{{<'!>i>,{<!>{''>}},{<<"ui<!>}}!!io<!!a!!!>{!!"a!>},<>,<u>}},{{{<!!!<'>}},<<i!>},<'e!>},<>},{{<!!!>!>i,e>},{{},<!ao!>>},{{<!!}a{!o!>!!!!e{'!!ia!>},<o!>!>!>,<!,u>}}}}},{{<{!!!>!>},<!>},<>,<o!!!>},<!!<!!!e>},{{},{<o>,{{<{!!}!>}!o!>,<!!!>a!>,<!>,<u{!!!!o{!>},<!>,<u>,<<'ii"!!!!!>a,!!!>>},{<!!!>,<<!!!!!>>,{<!!<e<o"!!!>!}}<u!>},<ou"!>!!,}o>}}}}},{<"!>},<!!!>!!!>i!e!><o{!!o!!>,<!>},<>}},{{<{!!!>,<o!>{o!>},<o!>},<>,{}},{}}},{{{{<!!!>ue!!i{!!eu>},{{<u!>!!!>,<<eo!>,<">},{<e,!!<'au{!!"{,!>>}}},{{},{<!>{ue!>,<!{!!ei!>},<!>!>},<!!!>iiie!<>}},{{},<!!!>,<!!!>!<!>!!!><u,!}!>'{!>},<!!!!!>!!>}},{{{},{}},{<!!!!!!!>,<{<i!>u}>}},{{<a!i'!!o!>},<,!!!>!>au!>>},{<a!>,a!'!}a!!a>}}},{{{{},<!>>},{{{{<!oiaa<i'oe!!}a'e,iuaa>}}}}},{{{}},{<!>},<!>!>,<i!>},<,!>,<,e!!!!!>'o!!!>">,<a!!!!!>{"!>,<!!!><u!!!!!>>}},{{{{<o!!u}!>,<au}}o>}},{<!!!>a!>},<!>,<!ao!!'u!!}!!!>,<">}},{<i,'}!!!!eo}!!!>a!>,<<"!!e>,<!<"!!!>>}},{{{<u"!>,<"!!!i!>},<>}},{<"!i!!o{i!i!!!>>,{<!!{!>},iao!>},<o!!!>}{<!!!>},<>}}}}}}},{{{{<!>o!!!>"i!!!">},{{{{<!!!>u!!<a!!!>!>,<'!!uu">}}},{{{<{oo{{!>>}}}}},{{},{<o!!!>,!o!>,<!>},<!>},<!!{}!!!!<!!!>}o!>},<e!>">}},{{{},{<!>},<a}!>},<{e!>o!!<'!>},<!!>}},<'",!i!!!!{!!}"i!!ui>}},{{{<a"o!!!>!{!>},<<!!ua'!>!!<<>}},{{<!!a!!!>!!e,!!{!!!>!>},<a>},{<<!!u,!!!>},<'u!!!!"!>!!>}}},{{{{{{}},{<>}},{}},{{{<!!!>o!'ueo<!>},<i}!>,<e!!!>!!!>},<">,<"!>},<!>>},{{},{}},{{<!>,<!!<,!!!!{aei<>,{}}}},{{<!!!>{!!!!!>},<!!}{!>!!!>>,{<}!>!>"u>}}},{{}}}},{{{<i<!e<>},<!u!!!>,<,!!io!!i}'!!!>e<!>},<{"a{!!!u<>},{<!!aa!>},<e!>ou>}},{{<!""!>}!!{o!>,<!>,<"!>!!<>},{<{!!!>},<!>,<a!>},<!>,<i!!<!>},<!>,<!!"}!!u<!u!!i}!!>},{}}}},{{{{<!>!!!>>}}}},{{{<"!!!!!!"{o<!>'i>,{<a>}},{{<o!i>},{{},{{},<{!>,<}>}}}},{{<!!oae!>,<!!!>!!!>u!!o!>,<u!!<u!!<"<}>},{<!!!>i,!!!!e{!!,{{!!!>},<u<u!!a!!o>,<>}},{{{<o!!!>!"oa!<!!!>'!!!>>}},{{{{{}},<!!"u!>!o!>},<!<!a>},{{<"e!!!>,}e!!!>ii!!"!!!!,i>}}},{}},{{}}},{{{{{<!>},<!>,<eoi!>,<uauu}e!>>},{<e!>,<"a<{,!!!!!!e!e'e"!!!!!>!!!!!!!!,>}},{<}u">},{<i!!o!!u>,{<a,e<!>},<!!!oooo<'!!!>>}}}},{{},{{{{<i>,{<{o!!'<e!!!>'{!,"!!!>},<!>>}}}},{{{<i!!!!u!!>}},{}}},{{<e!'!!!>!>i{!>,"!!!!<'!!!>!!}<>,{}},{<{!>>}},{{{<{,!ui!!!,>,{<ua!>}},{{>}},{{<,'!>!>,}u>},{{{<>,{<ai>,<!!!">}},<!!!!!>!!,,!>},<>},<"}oe'i},!!e!>,<">}},{}},{<!>!!!>},<o,!>},<>}}}}}},{{<!!!>i!!e>},{{<!>,<!!!>}"!!}>},<{!!!>,<{i!{{!'o'}}>}},{{{<!!!>!>,<!!!!!>!>{,'!>},<>},{<!,!!!>!!!!!!!>>}},{<!!!>,<{{"!!!>!>,<!!{}!>,<!>!>!>,<e>},{{<!!u>},{<}!!<i!!!!!!i!!a!!!>u!{!!{!>!!!!!>,<!!<>},{{},{{}}}}}},{{{<!!"!>,<!!!>},<!>,<!>,<{!!!!<!>,<!!!>'>},{{<!>e>},{<!>},<}o{!>'i'!!!!">}},{{<o}i'!!!>ee>},<}e!>,<u<"""!!!e{!>!>,<{'<i>}},{{<{uii!o>,<!>},<!>},<!}{!!!>e,!!ai!>!!!>!>{!!u!!,''>},{{<!!!>a<!!!eu!}o>,<!!,"o"a!>},<a{a!!u>},{}},{{{<u!>},<!!!>'!!!>e!>!>!>,<o>,{}},{{{<'"e!>!!!>"}o!>},<uee!!'o'}'>},<!!!>}!!e!!!!ou!>},<{{}!!!>!!!>,<a}"<>},{<!!!>!!{,,!a!!},'ui{>},{{<u>},{<aa{},o{oo!>},<<e{!!o>}}},{<!>,<}aa,>,{{<'!!!>!!}!!!>,<e!>,<!>},<{!'!!!!o"'"eui>},<!!!i{!!!!!>}{!'{'!>!>!}'<!>,<>}}},{{<a"a!!iau}"!>},<e">,<a!",{!!<!>,<,i>},{{},{}},{{<>},{<ua!,{>}}}}},{{{<!>,<e>},{{}}},{{{<'!!,<!>},<!}ea!>}!>},<!!!"ii,a}{i!>,<>},{<a!>},<ea"{u!!!>!!!>>}},{{{{}},{<!>},<!!!>>}}},{{{}}}},{{<!!!>},<u!><!<!>,!>},<,}!>a,a!!!>"!>,<!!!>!>>},{<{,,,uo>}}},{{<i!>},<!!}ueu,uu!>,<>,{{{{{}}},<!>},<!ioi<!!oee!!e!!>},{<ei!!!!}!>,<"}!u{,!!">,<u!!!>{!'!,!{!!oo!!!>>}}},{{<}!eue,!}!!!>"}!!!!{e!'>},<!>!!!><!!>}}},{{{{<,'!!<>,<<!>},<!!!>!!}!>!!!>}!i{i>},{{<!!!>i,,!!'aa!i''!!!!{<<,!!{!!!eo>,{}}},{<,u!'ouo>}},{{<}!>},<u>,{<}}a!!!!!>},<!>,<!>},<,!>,<!!!>,'i>}},{},{{<!!o>}}},{{<uoou!u!>},<!!!!{!{!>,<o}>,<!a!!!>a{"ei!!!>">},{{<!>,<!!e<!!!!!>!!!>,<u!!o!!!>}!!!<}>,<!>,<}"i}ie!!o{!>>}},{<<!!!!!!!>eee!>,<<>,<,,i!!!!!>!!!>>}}},{{{<a!>},<!!!>>,<,!>!!!i!!!!!><a!>},<">}},{{<!>,<i!!!!!>},<!"!i{io!!!!!>!!'!!!!,!>},<"">}}},{{},{{},{{<!e!>,<!!e}!!!>>},<u"!!!a!>,<o!!u,eea!!"!!'>}}},{{{},<!>},<io!>,<>},{{<a'e!>!!!>ie}e<ao}!!!}!<>}},{{<'o!>},<!>!>>}}}},{{{<a!>!>,<e!>,<!!!>,<{!>},<!>!!u!!>}},{{{<u!>uuu}>}},{{<{!!!!!>!!!!,{!!!!!>!!!!>},<!!!!!>{ua!!,e!}io<i!>},<u!>{,',!!>}},{{},{<a!!,e<ou{oao!!!!}>,{<u!>,<<a!{{,!>,<}!>,<!!u{o!o<!!"!>,<>,<{!!u!!!>u!!<!>,<!!!>},<!!!!e!>}!'!!!>,!!,>}}}}}},{{{{{<ui!!o!!!>,<"o!a!>,<u}>},{<i"'>}},{{{{{{<}!>}!>,<'e!!''}!!!>,<u>}},<!>},<!>},<!>},<!!!}!!!><!>,<,!>},<ao>},{<!>,<!!""!""oe},o!><,!!>,{}},{{{},{{{<!><<!!!ia{e!!!!!>'!>},<<>},{<"!!!>>}},<!!!!o!!!!!a!!i!!!>a">},{<uo!o!>,<{}{!!!>!>>,{<<ioa{a"'!>},<!!!>!uu">}}}}},{{<au!>},<!i!>i,''',!o<!>'>}},{}},{{<"!>,e"'!!!>!!!>,<>,{<o{e{"ee!o!!a!!,!!o!!!>!>,<!!a>}}}},{{<!!!>!>'}!,eo,!!!,!!!>u!!!>!<!<ia>}}},{{{{{<!!!!!>>}}}}},{{},{{{<!!!!!>ae!!ue">},{{{{<}}!!>}},{{},<eo!!!!ee!}'!!!>,{o{!>!>,<{u!!""'>}},<!!!{"eo},!!"oa!}ua>}},<a<,!i!!!>>},{{{}}}}},{{{{{<'!>!!!>!!ee!!u">}},{<i!!!>!!uu}e!>,<!>o!>},<}>,{{<!,!!>}}}},{<!!!!!>,<u}>,{<>}},{{<!!e!!!><!>,<<!!!>''!>},<>},{{<i!!!>{i'!!!>a!!!>'{>},<"<,,e}>}}},{},{{<<",'!>,<a,!!i'!>},<u'"!!ao!!!>,<>},{{<!>},<u!!!!}!}!!!e>},{<!>,<<>}},{}}}},{{{{{<}!>,<!}u!io>,{<!>},<!!!>u>}},{<"!>>}},{<,"i<!>,<'o!>},<!!{}>}},{{<eu!>},<<o}''iu!!!!!>!,,<!!eo!!!!!>>},{},{<!>,<}u!!<!<!a,ea,>,<!!"ou,"a!>!>}a{o>}},{{{<!>,<'!!!>i<!>!<!!',{,!>,<e!>}'!{o'>,{<}!>,<!!!>!>,<!>u!!!>>}},{<!!!!!><oia!!!>},<!a!!!!!>{!!!>!>!ao!!,!>!>,<>}},{{{<!>,<!!oa!}!>},<ue!>},<!<{e!>o!!!!,!!!!!>a!<>,<o!>},<!!oo'a!!!o<!>>},{{}}},<!>},<!!"!>,<{!>!!!>,u!e!u'!>,<e<!}!>,<!!!>o>},{{}}},{{<!!i!>!>},<,!ia!!u!!!!!>},<aa!!!>o!!{{{>,<,e!>'!},!!a!>,<>},{{},{<<a'!!!!!!u<!!!u<a{!!{io!!!>u{i>}},{<,o!!!>},<!>},<iae!!!>!!o'!!!>!!!>,<<<{ao>,{<>}}}}},{{{{{<!{!>,<!>},<!!a!>,<>}}},{{{<!!o!>a!>},<""ei!>,<!!!>!!!!'a>},{<}u,a'!!u!!!>!>,<u>}},{<"!>},<!>,<!!!!!o!>!>},<!!!>i!!i!!u>,<!>,<>}},{{{{{{<!!'"!!!>o!!{o"e!>},<o!!!!e}!>,<<,,>},<!!!>!!!>u,!>},<!>},<!>,<o<!!"u}!!!!u>},{<a!"<{a,!>,<!!!>},<u"o>,<!!'"!!!!!>!>},<>},{{<<{,!>e!aoi!>!!o{!>,<!>},<a'!>,>},{<,i!!'{>}}},{<>,<<i!!!>i!!ii<i{!!'}!!>},{{{<,!>},<eo!"i>},<i<!!{<!!!><'ei!>,<>},<ui}>}},{<!!!!!!,i}!!!>'o{!>,<!!!>},<>,<{!o'e',!!"{u!}e,!>!>,}}>}},{{{<o!!>},{<!ouo!!e'u{>}},{{{{<!>,<!i,{!!!>'!!<""!>!>,<!{"!!!>{!!'"{>,{<!<!!!>,<u,a<{!!!>"!!,!!e!!!!"!<!>!>},<!>>}},{{<!>!>u'!u!!!!!>},<{!>,<}}!!!>a!!e!'{i!!!!"{>}}}},{{}}},{{<!!!>!>},<i!!<!!,!!!<!>,<{!,}!!!!!>a"a'!!>},{<ae"<!>,<i!!!o}'a!>!!!!"ua!!'>}}},{{{{{<!!!>>},<'!!!>},<a!!'e>},{<i!!!>eoe}e!!!>!!,'!!!>a{>}},{{<>,<<>},{<!!}e!!,eo},<o}>,{<{!>,<<{>}},{}}},{{<!>!!<,}e}u,!>,<<!!",,!!!>>},<"!>},<!>,<u!>,<o!!!>!>,<eai!>},<uu!>{,i>}}}},{{{<eea!!!>",a!>},<>,<!!!!!>ue<<!>!!!>!!!>>},{{},{<i!>},<!>,<'!!!!a,'!}>}},{<,u{!>},<ae,!>'u!!!!!>ai!!o>,{{<'e!!i!!!>}<'u!>,<!>,<eo>}}}},{{<u{,o!!!>!,!>},<!!e!!!>o!>'o!>>,<!>,<!!o>}},{{{<a!>,<{,u!>},<!>},<!,!e!!!>,!>,<!<>},<!!uo'o'!eia!!!>,!>,<a!>,<!!!>>},{<,!!!><<i!>,<!>!>},<>,{{}}}}},{{{<!!!!!>aau{<!,ii},!>u{"'>}}},{},{{{{{<{u'!>,<!,!>},<<<!!!>!>,<>}}},{<,!o!!!{>}},{{<!>,<!!!>a"eu!!!>''!i>,{{{<!!i<ui>}}}},{{{},<!!!!!>!>,<!!!>e!!a>},<!>,<!!!!{!>"<!!!>e>},{{<ia{",!!!>,!!!>!>},<>},{<{e<!i{}!!io!!!!e!><i>,<!>},<}!>,<!><!!!{!>},<!}>}}},{{{},{<!>},<,e!>},<i,,'{a!">}},{<!"}{a!!i>,{<!>},<,u!!{a!>},<!!,,!>>}},{}},{{{<!>,<!>},<}!>,{}!>},<a"{,!!i!>,<!!!>,<}o>},<!!<a<!>,<a!!u,u>},{{},{{},{}}},{<!>,<!!!!!>!>},<{u!>,<'!!}!'u>}}}},{{{{},{{{{{{<<"a"!>,<>},<!>i,e!!!!{!<!>e}i!o"!!!!e!>},<!>e>},{}},{{}}}},{{{{{<<>}},{{{{{{{}}},<o!>},<a''{a!}!!!>u!!,!!o!,i!>},<!>},<!!!>>}},{{<'<!>a!>,<,!>{{"a!!!>"!!!>e!!!>>,{<a,,!>!!!>a!>},<!'a>}},{<a!>,<!!o!>,<!'!!!!!>},<}e!o,!>!!!>,<ia!!!>,<e>}},{<,!!!>!!"!!!>!>},<!!!!!>,<,'!!!!!>,<!>i!>a>,{{<!>'a'u!}a!>},<i!>},<!!!>!!!>},<<>}}}},{<!>},<"!>},<>,{{<e">,<!>},<!}u!>},<!!<!!i,!>},<!!!>,<!!!>!>,<"!!!>>},{<!!!>!>!!!>a'>}}},{{<!>o'>},{<!>"a"!!!>!!oeeo!>!>!>},<>},{{{<>},{{<o!i!!!!!>}e{!>},<!>},<i>}}}}}},{{},<>}},{{<!!oo<}"!>'!!!>u},!>},<>},{{<a,ee<!>'!ee!!!>u!>,<o!>},<!<}!{>,{{<!>ea!>,<{'!!!>a<!!"u"!>,<i!!!>!>},<>}}}},{}},{}}},{{<!>!>},<e!!a!>},<!>,<'e!!,u}!!oe>,{<!o!!!!!>},<!!<!>,<oao!!u<o{{!>},<<e<}>,<!a<oeu!>},<e,!!}a>}},{{}}},{{{<!>,!!''!>!!!>o!>"!>,<!!a"!>,<!!o{!!e>},{<!!!><,}o!!!!!>!>,<!a'o<"{!>,'!>!>,<>}},{{<{!>},<!!!!!!{!>,<"'!>},<"!!!>!!!>!!e!!!!!>,<u!>,<'i{>},{}}}},{{{<o!!!>!!,!>,<u}!>},<!!!>},<!!!!!',eo!>},<,'<<>},<!>!!!>!!},!>>}},{{<!',!!oou'}!>},<!>,<!>!>},<}!>},<o!!!!a!>i>,{<<!!a<!>},<,{<!'!>},<>}}}},{{{{<!>,<>,{}}},{{{{{<!>},<<!e!!!!!>!>},<<,'!>,<a!!e>},{<!!!!!>"!!{{<>}}}},{{<!>},<!!!>"<!>,<{{!!!>,<!!}{!!!>!!!>"!eu!!<!!i>},{{<!><!>i!!!!}!!u!>},<<!!u!>,<i!!!!!>,<>,{<!>},<u!!!!}!!!!,,!>'!>}!!}<a!!!!'o!!!>,!!>}},{<"ai!>},<,''>,{<!>}"!!!>}!!!!e!>},<i!!!>,<>,<!!!!u!>,<!,!!!>!!!>!iaae!>i,o!>!!!>>}}},{{}}}},{{<!!!a!!au!>!>,<<{},<!>,<!!,}i!!}o}>},{{<oa<'!,!"a>}}},{{<!<"u!!>},{{<,">},{{{<!!}!>,<!>,<'{,iuoi!>,<{}{!!,'>}},<!!ei!!e!!!!,"!!!!,!>,<!!!>e>}},{<!'}{!,!!!>!!!>'{!!!!,iu!>,<a{!>,<!!i>}}},{{{<!!!>!>},<!!''>},{{<!!{!!!>e!!"<>},{<!!'o,!!}!i>}}},{<<a!!i!!}!>!>,<,!!!>!!!'u<{!!a>,<>},{}},{{{{<,a}!',!>{>}}}}}},{{{{{<!oue}<!!'<i<<!>}}}i>},{{}}},{{{{}},{<a!<!{u<!>},<!>,<!<{,'"!!!>{!!!>,<!>,<}a,>,{}},{{<ia!!}!!'a!i!!<>,{}},{{<!!<!o,!}!>,<!>,<{{!>},<>}},{<<!!}"!}!!!>e!!>}}},{<ei,a!!!>}ua!!!>!!!>>}}},{{{{},{{<!>,<'}!'!!e!>,<!!}o"u!!!>'i<>},{<!>,<{}i!!"!!e!!!a{oe!>},<{'>}},{<,!}!>,<a!!a,''e>,{<"i"!>},<<,a!>},<io!>},<eieiei">}}},{{<>,{}}},{{<<<<i{{!><o!!!>!!!>o!!}!!>},{},{{{<!>},<i<ii>},{},{{<!><<oe<}',u!>}!!<!!o>},{<>}}},{},{<u!>"!>,<!u}!>},<i!>,<}>,{<!>,<u!!!!"'!>,<'>}}}}},{{<!><>,{<"}i!!{<{!>,<!!!>!!'!!'!>,<ui!>},<>,<!!!>,<}}!!!>"!!!>!>},<"!>,<!>,<>}}},{{{<'o>},{{<{!>},<<'o!!o!!!>,<"!!!>>}},{{<{uo}<,!>},<ee<{o<,!>},<<"i>,<!>,<"!!!>},<!}!!!>},<!>>},{},{}}},{<>},{{<}>,{<i{!>!<!!!!!e!!!>!>,<!>},<!>,<o<u>}}}},{{}}},{{{<a<!>},<<u!!,>},{<>,<}u!!o!!!!!i>}},{{{{{<<">,{}},{{{<a}<,}!!<,<>}},{{<e!!"o,"u>}},{{<!>,<,!>,<}"o>},{{<u!!!!!!'!>,<e!!'!>oeiai!!""i>},{<!>!!!!uu!!a>}}}},{{<!>!!!!!>!>!>,<,o!!!!!>{>},{{}}}},{{<!!!>!>},<,!!!!<<!!{!!>}},{{<o!>},<"!>,!><"!!!>},<'!!!>!!!!!>oo>},<!!!>}}!>},<e{}!>!>},<a>}}},{{{{<!!,,",!}!!<i<!i!,eo!a!!!>>,{{<u>}}},{{{{<!!e!!!>!!u!!e!"ei!>},<e<},{''>},<!!!>i!>a!>,<"i">},{}},{{},{<!!!!'i{"o!>},<o!}!!i!!!>a>},{{{<ie,!>},<<<{ue""!>},<!!<,a!>},<!>},<>}},<{!>,<>}}},{{<i!>},<a!!!>>,{<i,{o!a'<u"!>},<ii{"ue>,<!>},<<!!!>!!a!>}!!!>"i!!!>i!!!!!>!!!!ee!>},<!>,<}>}},{<'!>"ao!>,<!>},<{"!>},<,!>!>,<'"}o>}}},{<!>a!>{<!!!!!>'!!!!<!>},<u<"'>,{}},{<<!!}!!!>!>!>!>>}},{{{{<{o!'<a}>},<!>>},<ou!!!>,<!,!>,<>}},{{{<!>,<!>!!!>!!!>,<o!!!>!!!!a<<}>,{}},{<}!!}a!>,<!!!>!!iua}a>}},{{<!>},<!o!>oaa!>}>},{<!i!!!>oa!<!!e{eu<oe!>,<e!>!!!i<!>},<>}},{{<i>},<!>!>},<{!!!>!!{!!!>,<>}},{{<!!ioi!>},<o'}>},{<!e!>,<!!!>{eo!!!!!>!!,'!>},<{>,<,u'a!!!!!>!!!!!>oa>}}}},{{{{{{<!!!>},<!!!>}i!!!>>,{<!!{>}},{<<a<a'!>},<}}i!!!>ie!>!",!!'>,{{{<!!,!!!>,<!uo!!!>,<iu>}}}}},{{}},{<}i!!!>!!!>},<!!!!!>},<e,!>,<oua<!!!>},<>,<!!!>,i>}},{{<>}}}}},{{{{},{<<u!>},<{o}!!!>e!>!>!u"!>,<ea<!>},<>}}},{{<{e{o}""e!i!!{ei!>},<>,{<!!i>}},{{{<!>,,u!>},<,ou}!>},<!!e!!!!!>>},{<!>,<!!u!>,<!!}!!'!!!!!!{!!,!!}!!,!!<e>}},{{}}}},{{{<a!>,<}i!>,<>}},{<!<e!eae>},{{<}''{!>},<u>,{{<<!!!!!!'!!!>},<!>},<{}">}}},{}}}}},{{},{{<i}!>!>i!>},<ai,!!}a!!!>u!>},<",>,<!!!>}!!'{!ee!e!oo!>!>,<!!!}{}">},{{{<!!u!>,<"!!e!!<e<!!>,{{<ou<ui'u!!!!}!>,<!}!">}}},{}}},{{{},{}},{<ai!!!>'!!!<!!!!!!a!!"!>,<!>!ii,!>},<'<!>},<>}}},{{{{{{<>},<}',!!!o<{!!!>!!u!}i<e!!<'>},<}!>},<aoea'!>!>,<!!!!!!}<ou"}>},<!>},<i!>,<euu>},{<}e!!a>,<',>},{}}},{{{{<!!!>{!!!>,<}>,{<o!>,<u!!!<!>>}},{<!!!!!!!>ue<!e{,!>},<o<!>!>i>}}}}},{{{},{{{}},{{<aee>},<!>!!}{{'!!!>!!!>!<!ui"!,o<>},{{<o!!!!i!>!"!>e<e!>},<!>!>,<!!!!}"!!!'!>>},{<"}!!!>!>!!<>}}},{{<!{i>,<"!!!u!!eo!>,<!!!>o!!}!!i!!}iu!>>}}},{{{{<},!!!!!>'{!>},<o"!>,<e",,>},<{e{eu!>,<!!!>,<'!!!>!>,<e<>},{<u<!><!>},<!>!!!!!>>}},{<e!>},<'!!uoi{!>},<!>!"!>u!>,<!!o!},!>},<!>">,<<!>},<!>!!"!!!e>},{{}}}}}},{{{<u!>,<!{!{!>},<ao,!!e!!{<!>,<i'>},{<,!!,{{>,{<,e}',!>,<!!{,e}!!{!>},<{!>,<!!!>>}},{}},{{{{{{<e>},{}},{{<o'u!!{{'!!'!!e"ia>}}},{<>},{{{{<!{!eauie<<<!!!,!!a>},{<<!>u!!!>e'<!{}!{e!!,!}!>!>},<o>}},{{<!!!>i!>},<!>>}}}}},{{{{},<!>!>!!!!}a!>},<{{}e,i'o!>,<!!!!!>},<'>},{{}}},{{<>},{{<!!!>e!!}a'}'!>{eo{o!!!>!!!!!!>},{<!>},<{''}!>},<!>},<,!",oiu>,{<!<!!!!!>e,!<a!>},<>}}}},{{}}},{{{},<'o}}"!>},<!!a}i}"!!!>>},{{{{{<>,{}}}},<o'ea!"!>},<}>}}},{{},{{<io!!!>!>a}!!!!!"u{!>!!!!e">},{{{<ue{}<"'a},{!!!!!>!ue!!!>!!!>!!>,<'"u!!!>ee<!!!>!}!{,!!!!>}},{{{{<"{!!!>},<eo!'o<>}}},<!>!>'eo>}}},{{<!>,!!i'!!!>,<{o{'>},<!>},<!>!!!!<""!!!>i>}}},{{{{{{{<!>,<{!>,<e!!'!>a<!>},<>,<!u!!u{<a>},<!!>}}},{{<!!!!!>a>}}},{{{}},{<!!,iu!}!!''}"i!>!!'o!>},<!>,>}}},{{{{}}},{{},{},{{{<}'u!!!>u!!o>},<!e!u>},{{{<!>,<"!e!!e',"!!!>!>,<!!a!>,<!!!!!>!>},<!<'ua{!!}>},<e!>},<'<!!!>},<!!!>,<,e"!>},<!><>}}}},{{<i!e!!!>!!!!,!>!>,<>,<!>i!!u!>,<<>},{{{<!>,<!>},<!>},<!{!>i!!!!!>i!!!}!!eue">},{<!!!>},<!ie"!<>}},{{},<<ue'u>}}}},{{{<a!>">,{}},{<!!!!!!"a>},{<<!>},<i!>},<!!}u}!!{a!>,<!>},<>,<!>,<!!!!!>!!!>'!!!>}}"o{!!>}},{<,}""a>,<""!>,<!!,>},{}}},{{{<"!!!>!>!>},<,!!!>},<e'!!a>},{<}u<!>,<a!!!>,!!u!>},<u",!>""!>!!>,<i!>ia!>,<<!!<!i!>u!>,<ee}>}},{{<!>},<!!'>}}}}}}},{}}
INPUT
