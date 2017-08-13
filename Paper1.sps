* Encoding: UTF-8.
****  PROLOG **********************************************************************************************************************************************************.

*** PROJECT:        phssr reproducibility***
*** PURPOSE:       reproducing a published phssr article ***
*** DATA:               #NACCHO data obtained from: http://nacchoprofilestudy.org/data-requests/, "2013 Profile Study"
***                         #RUCA data obtained from lead author and saved in GitHub:
***                         #https://github.com/coding2share/phssr-reproducibility/blob/master/paper1-2017ruca.csv 
*** AUTHOR:          Jenine Harris, Sarah Wondmeneh, Yiqiang Zhao ***
*** LATEST:           August 12, 2017 ***

*** PROLOG   **********************************************************************************************************************************************************.
***RETRIEVE DATABASE ***
***Open NACCHO 2013 Profile data***
***Add file location for RUCA data (see prolog) after /FILE= below***

GET DATA  /TYPE=TXT
  /FILE="file location"
  /ENCODING='UTF8'
  /DELCASE=LINE
  /DELIMITERS=","
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  nacchoid A5
  ruca_3_cat_RC F1.0.
CACHE.
EXECUTE.
DATASET NAME DataSet2 WINDOW=FRONT.

***MERGE RUCA VARIABLES WITH NACCHO DATA ***

DATASET ACTIVATE DataSet1.
STAR JOIN
  /SELECT t0.c0population, t0.c0govcat, t0.c0jurisdiction, t0.c0regcount, t0.c0module, t0.c0state, 
    t0.c1q1, t0.c1q6, t0.c1q7, t0.c1q8, t0.c1q9, t0.c1q6a, t0.c2q401dicot, t0.c2q402, t0.c2q301, 
    t0.c2q6a, t0.c2q7a, t0.c2q8a, t0.c2q9a, t0.c2q10a, t0.c2q11a, t0.c2q14a, t0.c2q15a, t0.c2q16a, 
    t0.c2q16atext, t0.c3q301, t0.c3q14, t0.c3q15, t0.c3q16, t0.c3q17p, t0.c3q17qe, t0.c3q17r, 
    t0.c3q17s, t0.c3q17t, t0.c3q302, t0.c3q303, t0.c3q304, t0.c3q305, t0.c3q306, t0.c10q301, 
    t0.c10q301a, t0.c10q301b, t0.c10q303, t0.c4q23text, t0.c4q24, t0.c4q25, t0.c4q26, t0.c4q27a, 
    t0.c4q27b, t0.c4q27c, t0.c4q27d, t0.c4q27e, t0.c4q27f, t0.c4q28, t0.c4q29, t0.c4q30, t0.c4q31a, 
    t0.c4q31b, t0.c4q31c, t0.c4q31ctext, t0.c4q32a, t0.c4q32b, t0.c4q32c, t0.c4q32d, t0.c4q32dtext, 
    t0.c4q33e, t0.c4q33f, t0.c4q33a, t0.c4q33b, t0.c4q33c, t0.c4q33d, t0.c4q33dtext, t0.c4q34a, 
    t0.c4q34b, t0.c4q34c, t0.c4q34d, t0.c4q34e, t0.c4q34f, t0.c4q34g, t0.c4q34h, t0.c4q34htext, 
    t0.c4q34i, t0.c4q34itext, t0.c4q35a, t0.c4q35b, t0.c4q35c, t0.c4q35d, t0.c4q35e, t0.c4q35f, 
    t0.c4q35g, t0.c4q35gtext, t0.c4q301, t0.c4q302, t0.c5q36, t0.c5q37, t0.c5q38, t0.c5q38text, 
    t0.c5q42a, t0.c5q42b, t0.c5q42c, t0.c5q42d, t0.c5q43a, t0.c5q43b, t0.c5q43c, t0.c5q43d, t0.c5q57a, 
    t0.c5q57b, t0.c5q57c, t0.c5q57d, t0.c5q58a, t0.c5q58b, t0.c5q58c, t0.c5q58d, t0.c5q44a, t0.c5q44b, 
    t0.c5q44c, t0.c5q44d, t0.c5q59a, t0.c5q59b, t0.c5q59c, t0.c5q59d, t0.c5q55a, t0.c5q55b, t0.c5q55c, 
    t0.c5q55d, t0.c5q60a, t0.c5q60b, t0.c5q60c, t0.c5q60d, t0.c5q47a, t0.c5q47b, t0.c5q47c, t0.c5q47d, 
    t0.c5q48a, t0.c5q48b, t0.c5q48c, t0.c5q48d, t0.c5q61a, t0.c5q61b, t0.c5q61c, t0.c5q61d, t0.c5q49a, 
    t0.c5q49b, t0.c5q49c, t0.c5q49d, t0.c5q50a, t0.c5q50b, t0.c5q50c, t0.c5q50d, t0.c5q51a, t0.c5q51b, 
    t0.c5q51c, t0.c5q51d, t0.c5q52a, t0.c5q52b, t0.c5q52c, t0.c5q52d, t0.c5q56a, t0.c5q56b, t0.c5q56c, 
    t0.c5q56d, t0.c5q62a, t0.c5q62b, t0.c5q62c, t0.c5q62d, t0.c5q54a, t0.c5q54b, t0.c5q54c, t0.c5q54d, 
    t0.c5q53a, t0.c10q306, t0.c10q307, t0.c10q308, t0.c10q309, t0.c10q401, t0.c10q402, t0.c10q403, 
    t0.c6q55a, t0.c6q55b, t0.c6q55i, t0.c6q55f, t0.c6q55g, t0.c6q56a, t0.c6q56b, t0.c6q56i, t0.c6q56f, 
    t0.c6q56g, t0.c6q57a, t0.c6q57b, t0.c6q57i, t0.c6q57f, t0.c6q57g, t0.c6q58a, t0.c6q58b, t0.c6q58i, 
    t0.c6q58f, t0.c6q58g, t0.c6q59a, t0.c6q59b, t0.c6q59i, t0.c6q59f, t0.c6q59g, t0.c6q60a, t0.c6q60b, 
    t0.c6q60i, t0.c6q60f, t0.c6q60g, t0.c6q61a, t0.c6q61b, t0.c6q61i, t0.c6q61f, t0.c6q61g, t0.c6q62a, 
    t0.c6q62b, t0.c6q62i, t0.c6q62f, t0.c6q62g, t0.c6q63a, t0.c6q63b, t0.c6q63i, t0.c6q63f, t0.c6q63g, 
    t0.c6q64a, t0.c6q64b, t0.c6q64i, t0.c6q64f, t0.c6q64g, t0.c6q65a, t0.c6q65b, t0.c6q65i, t0.c6q65f, 
    t0.c6q65g, t0.c6q66a, t0.c6q66b, t0.c6q66i, t0.c6q66f, t0.c6q66g, t0.c6q67a, t0.c6q67b, t0.c6q67i, 
    t0.c6q67f, t0.c6q67g, t0.c6q68a, t0.c6q68b, t0.c6q68i, t0.c6q68f, t0.c6q68g, t0.c6q69a, t0.c6q69b, 
    t0.c6q69i, t0.c6q69f, t0.c6q69g, t0.c6q70a, t0.c6q70b, t0.c6q70i, t0.c6q70f, t0.c6q70g, t0.c6q71a, 
    t0.c6q71b, t0.c6q71i, t0.c6q71f, t0.c6q71g, t0.c6q72a, t0.c6q72b, t0.c6q72i, t0.c6q72f, t0.c6q72g, 
    t0.c6q73a, t0.c6q73b, t0.c6q73i, t0.c6q73f, t0.c6q73g, t0.c6q74a, t0.c6q74b, t0.c6q74i, t0.c6q74f, 
    t0.c6q74g, t0.c6q75a, t0.c6q75b, t0.c6q75i, t0.c6q75f, t0.c6q75g, t0.c6q76a, t0.c6q76b, t0.c6q76i, 
    t0.c6q76f, t0.c6q76g, t0.c6q77a, t0.c6q77b, t0.c6q77i, t0.c6q77f, t0.c6q77g, t0.c6q78a, t0.c6q78b, 
    t0.c6q78i, t0.c6q78f, t0.c6q78g, t0.c6q79a, t0.c6q79b, t0.c6q79i, t0.c6q79f, t0.c6q79g, t0.c6q80a, 
    t0.c6q80b, t0.c6q80i, t0.c6q80f, t0.c6q80g, t0.c6q81a, t0.c6q81b, t0.c6q81i, t0.c6q81f, t0.c6q81g, 
    t0.c6q82a, t0.c6q82b, t0.c6q82i, t0.c6q82f, t0.c6q82g, t0.c6q83a, t0.c6q83b, t0.c6q83i, t0.c6q83f, 
    t0.c6q83g, t0.c6q84a, t0.c6q84b, t0.c6q84i, t0.c6q84f, t0.c6q84g, t0.c6q85a, t0.c6q85b, t0.c6q85i, 
    t0.c6q85f, t0.c6q85g, t0.c6q86a, t0.c6q86b, t0.c6q86i, t0.c6q86f, t0.c6q86g, t0.c6q87a, t0.c6q87b, 
    t0.c6q87i, t0.c6q87f, t0.c6q87g, t0.c6q88a, t0.c6q88b, t0.c6q88i, t0.c6q88f, t0.c6q88g, t0.c6q89a, 
    t0.c6q89b, t0.c6q89i, t0.c6q89f, t0.c6q89g, t0.c6q90a, t0.c6q90b, t0.c6q90i, t0.c6q90f, t0.c6q90g, 
    t0.c6q91a, t0.c6q91b, t0.c6q91i, t0.c6q91f, t0.c6q91g, t0.c6q92a, t0.c6q92b, t0.c6q92i, t0.c6q92f, 
    t0.c6q92g, t0.c6q93a, t0.c6q93b, t0.c6q93i, t0.c6q93f, t0.c6q93g, t0.c6q94a, t0.c6q94b, t0.c6q94i, 
    t0.c6q94f, t0.c6q94g, t0.c6q95a, t0.c6q95b, t0.c6q95i, t0.c6q95f, t0.c6q95g, t0.c6q96a, t0.c6q96b, 
    t0.c6q96i, t0.c6q96f, t0.c6q96g, t0.c6q97a, t0.c6q97b, t0.c6q97i, t0.c6q97f, t0.c6q97g, t0.c6q98a, 
    t0.c6q98b, t0.c6q98i, t0.c6q98f, t0.c6q98g, t0.c6q99a, t0.c6q99b, t0.c6q99i, t0.c6q99f, t0.c6q99g, 
    t0.c6q100a, t0.c6q100b, t0.c6q100i, t0.c6q100f, t0.c6q100g, t0.c6q101a, t0.c6q101b, t0.c6q101i, 
    t0.c6q101f, t0.c6q101g, t0.c6q102a, t0.c6q102b, t0.c6q102i, t0.c6q102f, t0.c6q102g, t0.c6q103a, 
    t0.c6q103b, t0.c6q103i, t0.c6q103f, t0.c6q103g, t0.c6q104a, t0.c6q104b, t0.c6q104i, t0.c6q104f, 
    t0.c6q104g, t0.c6q105a, t0.c6q105b, t0.c6q105i, t0.c6q105f, t0.c6q105g, t0.c6q106a, t0.c6q106b, 
    t0.c6q106i, t0.c6q106f, t0.c6q106g, t0.c6q107a, t0.c6q107b, t0.c6q107i, t0.c6q107f, t0.c6q107g, 
    t0.c6q108a, t0.c6q108b, t0.c6q108i, t0.c6q108f, t0.c6q108g, t0.c6q109a, t0.c6q109b, t0.c6q109i, 
    t0.c6q109f, t0.c6q109g, t0.c6q110a, t0.c6q110b, t0.c6q110i, t0.c6q110f, t0.c6q110g, t0.c6q111a, 
    t0.c6q111b, t0.c6q111i, t0.c6q111f, t0.c6q111g, t0.c6q112a, t0.c6q112b, t0.c6q112i, t0.c6q112f, 
    t0.c6q112g, t0.c6q113a, t0.c6q113b, t0.c6q113i, t0.c6q113f, t0.c6q113g, t0.c6q114a, t0.c6q114b, 
    t0.c6q114i, t0.c6q114f, t0.c6q114g, t0.c6q115a, t0.c6q115b, t0.c6q115i, t0.c6q115f, t0.c6q115g, 
    t0.c6q116a, t0.c6q116b, t0.c6q116i, t0.c6q116f, t0.c6q116g, t0.c6q117a, t0.c6q117b, t0.c6q117i, 
    t0.c6q117f, t0.c6q117g, t0.c6q118a, t0.c6q118b, t0.c6q118i, t0.c6q118f, t0.c6q118g, t0.c6q119a, 
    t0.c6q119b, t0.c6q119i, t0.c6q119f, t0.c6q119g, t0.c6q120a, t0.c6q120b, t0.c6q120i, t0.c6q120f, 
    t0.c6q120g, t0.c6q121a, t0.c6q121b, t0.c6q121i, t0.c6q121f, t0.c6q121g, t0.c6q122a, t0.c6q122b, 
    t0.c6q122i, t0.c6q122f, t0.c6q122g, t0.c6q123a, t0.c6q123b, t0.c6q123i, t0.c6q123f, t0.c6q123g, 
    t0.c6q124a, t0.c6q124b, t0.c6q124i, t0.c6q124f, t0.c6q124g, t0.c6q125a, t0.c6q125b, t0.c6q125i, 
    t0.c6q125f, t0.c6q125g, t0.c6q126a, t0.c6q126b, t0.c6q126i, t0.c6q126f, t0.c6q126g, t0.c6q127a, 
    t0.c6q127b, t0.c6q127i, t0.c6q127f, t0.c6q127g, t0.c6q128a, t0.c6q128b, t0.c6q128i, t0.c6q128f, 
    t0.c6q128g, t0.c6q129a, t0.c6q129b, t0.c6q129i, t0.c6q129f, t0.c6q129g, t0.c6q130a, t0.c6q130b, 
    t0.c6q130i, t0.c6q130f, t0.c6q130g, t0.c6q131a, t0.c6q131b, t0.c6q131i, t0.c6q131f, t0.c6q131g, 
    t0.c6q132a, t0.c6q132b, t0.c6q132i, t0.c6q132f, t0.c6q132g, t0.c6q133a, t0.c6q133b, t0.c6q133i, 
    t0.c6q133f, t0.c6q133g, t0.c6q134a, t0.c6q134b, t0.c6q134i, t0.c6q134f, t0.c6q134g, t0.c6q135a, 
    t0.c6q135b, t0.c6q135i, t0.c6q135f, t0.c6q135g, t0.c6q136a, t0.c6q136b, t0.c6q136i, t0.c6q136f, 
    t0.c6q136g, t0.c6q137a, t0.c6q137b, t0.c6q137i, t0.c6q137f, t0.c6q137g, t0.c6q138a, t0.c6q138b, 
    t0.c6q138i, t0.c6q138f, t0.c6q138g, t0.c6q139a, t0.c6q139b, t0.c6q139i, t0.c6q139f, t0.c6q139g, 
    t0.c6q140a, t0.c6q140b, t0.c6q140i, t0.c6q140f, t0.c6q140g, t0.c6q141a, t0.c6q141b, t0.c6q141i, 
    t0.c6q141f, t0.c6q141g, t0.c6q301, t0.c6q302text, t0.c6q301a, t0.c10q404a, t0.c10q405a, 
    t0.c10q406a, t0.c10q407a, t0.c10q408a, t0.c10q409a, t0.c10q410a, t0.c10q411a, t0.c10q412a, 
    t0.c10q413a, t0.c10q414a, t0.c10q414atext, t0.c10q404b, t0.c10q404c, t0.c10q404d, t0.c10q404e, 
    t0.c10q405b, t0.c10q405c, t0.c10q405d, t0.c10q405e, t0.c10q406b, t0.c10q406c, t0.c10q406d, 
    t0.c10q406e, t0.c10q407b, t0.c10q407c, t0.c10q407d, t0.c10q407e, t0.c10q408b, t0.c10q408c, 
    t0.c10q408d, t0.c10q408e, t0.c10q409b, t0.c10q409c, t0.c10q409d, t0.c10q409e, t0.c10q410b, 
    t0.c10q410c, t0.c10q410d, t0.c10q410e, t0.c10q411b, t0.c10q411c, t0.c10q411d, t0.c10q411e, 
    t0.c10q412b, t0.c10q412c, t0.c10q412d, t0.c10q412e, t0.c10q413b, t0.c10q413c, t0.c10q413d, 
    t0.c10q413e, t0.c10q414b, t0.c10q414c, t0.c10q414d, t0.c10q414e, t0.c7q147, t0.c7q149, t0.c7q150, 
    t0.c7q151, t0.c7q401a, t0.c7q401b, t0.c7q401c, t0.c7q401d, t0.c7q152a, t0.c7q152b, t0.c7q152c, 
    t0.c7q152d, t0.c7q155a, t0.c7q155b, t0.c7q155c, t0.c7q155d, t0.c7q157a, t0.c7q157b, t0.c7q157c, 
    t0.c7q157d, t0.c7q161a, t0.c7q161b, t0.c7q161c, t0.c7q161d, t0.c7q217, t0.c11q301, t0.c12q255a, 
    t0.c12q255b, t0.c12q255c, t0.c12q255d, t0.c12q256a, t0.c12q256b, t0.c12q256c, t0.c12q256d, 
    t0.c12q257a, t0.c12q257b, t0.c12q257c, t0.c12q257d, t0.c12q258a, t0.c12q258b, t0.c12q258c, 
    t0.c12q258d, t0.c12q259a, t0.c12q259b, t0.c12q259c, t0.c12q259d, t0.c12q260a, t0.c12q260l, 
    t0.c12q260m, t0.c12q260b, t0.c12q260c, t0.c12q260n, t0.c12q260o, t0.c12q260e, t0.c12q260p, 
    t0.c12q260g, t0.c12q260f, t0.c12q260q, t0.c12q260r, t0.c12q260h, t0.c12q260s, t0.c12q260t, 
    t0.c12q260u, t0.c12q260v, t0.c12q260j, t0.c12q260jtext, t0.c12q260k, t0.c12q401a, t0.c12q401b, 
    t0.c12q401c, t0.c12q401d, t0.c12q401e, t0.c12q401f, t0.c12q401g, t0.c12q401h, t0.c12q401i, 
    t0.c12q401itext, t0.c12q402a, t0.c12q402b, t0.c12q402c, t0.c12q402d, t0.c12q402e, t0.c12q402f, 
    t0.c12q402g, t0.c12q402h, t0.c12q402i, t0.c12q402itext, t0.c12q261, t0.c12q262h, t0.c12q262i, 
    t0.c12q262j, t0.c12q262k, t0.c12q262l, t0.c12q262m, t0.c12q262n, t0.c12q262o, t0.c12q262p, 
    t0.c12q262q, t0.c12q262b, t0.c12q262f, t0.c12q262ftext, t0.c12q262g, t0.m1q301, t0.m1q302, 
    t0.m1q302text, t0.m1q303a, t0.m1q303b, t0.m1q303c, t0.m1q303d, t0.m1q303e, t0.m1q303f, t0.m1q303g, 
    t0.m1q303h, t0.m1q401a, t0.m1q401b, t0.m1q401c, t0.m1q401d, t0.m1q401e, t0.m1q401f, t0.m1q401g, 
    t0.m1q401h, t0.m1q401i, t0.m2q401, t0.m2q402, t0.m2q403a, t0.m2q403b, t0.m2q403c, t0.m2q403d, 
    t0.m2q403e, t0.m2q403f, t0.m2q403ftext, t0.m2q404, t0.m8q219, t0.m8q301, t0.m8q401a, t0.m8q401b, 
    t0.m8q401c, t0.m8q402a, t0.m8q402b, t0.m8q402c, t0.m8q403a, t0.m8q403b, t0.m8q403c, t0.m8q404a, 
    t0.m8q404b, t0.m8q404c, t0.m8q405, t0.m8q220a, t0.m8q220b, t0.m8q303h, t0.m8q220g, t0.m8q220h, 
    t0.m8q220i, t0.m8q220j, t0.m8q220k, t0.m8q220c, t0.m8q220l, t0.m8q303i, t0.m8q303a, t0.m8q303b, 
    t0.m8q303c, t0.m8q303d, t0.m8q303e, t0.m8q303f, t0.m8q303ftext, t0.m8q303g, t0.m8q304, t0.m6q196, 
    t0.m6q204e, t0.m6q204g, t0.m6q204c, t0.m6q204d, t0.m6q204f, t0.m6q204ftext, t0.m6q204b, t0.m13q401, 
    t0.m13q402, t0.m13q403, t0.m13q404, t0.m13q405, t0.m13q406, t0.m13q407, t0.m13q408, t0.m13q409, 
    t0.m17q301a, t0.m17q301b, t0.m17q301c, t0.m17q301d, t0.m17q301e, t0.m17q301f, t0.m17q301g, 
    t0.m17q301h, t0.m17q301i, t0.m17q303, t0.m17q306, t0.m17q308, t0.m17q401a, t0.m17q401b, 
    t0.m17q401c, t0.m17q401d, t0.m17q401e, t0.m17q401f, t0.m17q401g, t0.m17q401h, t0.m17q401i, 
    t0.m17q401itext, t0.m17q401j, t0.m17q401k, t0.m17q402a, t0.m17q402b, t0.m17q402c, t0.m17q403a, 
    t0.m17q403b, t0.m17q403c, t0.m17q403d, t0.m17q403e, t0.m17q403f, t0.m17q403g, t0.m17q403h, 
    t0.m17q403i, t0.m17q403j, t0.m17q403k, t0.m17q403l, t0.m17q403m, t0.m17q403n, t0.m17q403o, 
    t0.m17q403p, t0.m17q403q, t0.m17q403r, t0.m17q403s, t0.m17q403t, t0.m17q403u, t0.m17q403v, 
    t0.m17q403w, t0.m17q403x, t0.m17q403y, t0.m17q403z, t0.m17q403aa, t0.m17q403ab, t0.m17q403ac, 
    t0.m17q403ad, t0.m17q403ae, t0.m17q403af, t0.m17q403ag, t0.m17q403ah, t0.m17q403ai, t0.m17q403aj, 
    t0.m17q403ak, t0.m17q403al, t0.m17q403altext, t0.m17q404a, t0.m17q404b, t0.m17q404c, t0.m17q404d, 
    t0.m17q404e, t0.m17q404f, t0.m17q404g, t0.m17q404h, t0.m17q404i, t0.m17q404itext, t0.m5q192a, 
    t0.m5q192b, t0.m5q192g, t0.m5q192c, t0.m5q192d, t0.m5q192e, t0.m5q192f, t0.m5q192ftext, t0.m5q304, 
    t0.m5q305, t0.m5q401, t0.m5q402, t0.m15q142b, t0.m15q142c, t0.m15q142d, t0.m15q142e, t0.m15q142f, 
    t0.m15q142g, t0.m15q142h, t0.m15q142i, t0.m15q142j, t0.m15q142jtext, t0.m15q301, t0.m15q302a, 
    t0.m15q302b, t0.m15q302c, t0.m15q302d, t0.m15q302e, t0.m15q302f, t0.m15q302g, t0.m15q302gtext, 
    t0.m15q303, t0.m15q402, t0.m15q403a, t0.m15q403c, t0.m15q403d, t0.m15q403e, t0.m15q403f, 
    t0.m15q305a, t0.m15q305c, t0.m15q305d, t0.m15q305e, t0.m15q305f, t0.m15q306a, t0.m15q306c, 
    t0.m15q306d, t0.m15q306e, t0.m15q306f, t0.m15q307a, t0.m15q307c, t0.m15q307d, t0.m15q307e, 
    t0.m15q307f, t0.m15q308a, t0.m15q308c, t0.m15q308d, t0.m15q308e, t0.m15q308f, t0.m15q309a, 
    t0.m15q309c, t0.m15q309d, t0.m15q309e, t0.m15q309f, t0.m15q310a, t0.m15q310c, t0.m15q310d, 
    t0.m15q310e, t0.m15q310f, t0.m15q311a, t0.m15q311c, t0.m15q311d, t0.m15q311e, t0.m15q311f, 
    t0.m15q311atext, t0.m15q404a, t0.m15q404c, t0.m15q404d, t0.m15q404e, t0.m15q404f, t0.m15q405a, 
    t0.m15q405c, t0.m15q405d, t0.m15q405e, t0.m15q405f, t0.m15q406a, t0.m15q406c, t0.m15q406d, 
    t0.m15q406e, t0.m15q406f, t0.m15q407a, t0.m15q407c, t0.m15q407d, t0.m15q407e, t0.m15q407f, 
    t0.m15q408a, t0.m15q408c, t0.m15q408d, t0.m15q408e, t0.m15q408f, t0.m15q409a, t0.m15q409c, 
    t0.m15q409d, t0.m15q409e, t0.m15q409f, t0.m15q410a, t0.m15q410c, t0.m15q410d, t0.m15q410e, 
    t0.m15q410f, t0.m15q411a, t0.m15q411c, t0.m15q411d, t0.m15q411e, t0.m15q411f, t0.m15q411atext, 
    t0.m15q312g, t0.m15q312h, t0.m15q312f, t0.m15q312a, t0.m15q312b, t0.m15q312c, t0.m15q312d, 
    t0.m15q412a, t0.m15q412b, t0.m15q313, t0.m15q313text, t0.m4q301, t0.m4q302, t0.m4q304, t0.m4q401, 
    t0.m4q402, t0.m4q306, t0.m4q307a, t0.m4q307b, t0.m4q307c, t0.m4q307d, t0.m4q307e, t0.m4q307f, 
    t0.m4q307g, t0.m4q307h, t0.m4q307htext, t0.m4q308a, t0.m4q308b, t0.m4q308c, t0.m4q308e, t0.m4q308f, 
    t0.m4q308h, t0.m4q308htext, t0.m4q308k, t0.m4q308l, t0.m4q308m, t0.m4q308n, t0.m4q308i, t0.m4q308j, 
    t0.m4q403a, t0.m4q403b, t0.m4q404a, t0.m4q404b, t0.m4q405a, t0.m4q405b, t0.m4q406a, t0.m4q406b, 
    t0.m4q407a, t0.m4q407b, t0.m4q408a, t0.m4q408b, t0.m4q409a, t0.m4q409b, t0.m4q410a, t0.m4q410b, 
    t0.m4q411a, t0.m4q411b, t0.m4q412a, t0.m4q412b, t0.m4q413, t0.m4q414a, t0.m4q414b, t0.m4q414c, 
    t0.m4q414ctext, t0.m14q301a, t0.m14q301b, t0.m14q301c, t0.m14q301d, t0.m14q302a, t0.m14q302b, 
    t0.m14q302c, t0.m14q302d, t0.m14q303a, t0.m14q303b, t0.m14q303c, t0.m14q303d, t0.m14q304a, 
    t0.m14q304b, t0.m14q304c, t0.m14q304d, t0.m14q401a, t0.m14q401b, t0.m14q401c, t0.m14q401d, 
    t0.m18q146a, t0.m18q146b, t0.m18q146c, t0.m18q146d, t0.m18q146j, t0.m18q146e, t0.m18q146f, 
    t0.m18q146g, t0.m18q146h, t0.m18q146i, t0.c0coreweight_s, t0.c0coreweight_p, t0.c0moduleweight1, 
    t0.c0moduleweight2, t1.ruca_3_cat_RC
  /FROM * AS t0
  /JOIN 'DataSet2' AS t1
    ON t0.nacchoid=t1.nacchoid
  /OUTFILE FILE=*.

***FILTER ROWS FOR MODULE1***

FILTER OFF.
USE ALL.
SELECT IF (c0module = 1).
EXECUTE.

***SAVE THE DATASET***
***ADD THE LOCATION WHERE YOU WOULD LIKE TO SAVE THE FILE***
***IN PLACE OF THE "FILELOCATION" IN THE COMMAND BELOW***

SAVE OUTFILE='FILELOCATION\final.sav'
  /DROP= c0jurisdiction c0regcount c0module c0state c1q1 c1q6 c1q7 c1q8 c1q9 c1q6a c2q401dicot c2q402 c2q6a c2q7a c2q9a c2q10a c2q11a c2q14a c2q15a c2q16a c2q16atext c3q301 c3q14 c3q15 c3q17p c3q17qe c3q17r c3q17s c3q17t c3q302 c3q303 c3q304 c3q305 c3q306 c10q301 c10q301a c10q301b c10q303 c4q23text c4q24 c4q25 c4q26 c4q27a c4q27b c4q27c c4q27d c4q27e c4q27f c4q28 c4q29 c4q30 c4q31c c4q31ctext c4q32dtext c4q33d c4q33dtext c4q34htext c4q34i c4q34itext c4q35a c4q35b c4q35c c4q35d c4q35e c4q35f c4q35g c4q35gtext c4q301 c4q302 c5q36 c5q38 c5q38text c5q42a c5q42b c5q42c c5q42d c5q43a c5q43b c5q43c c5q43d c5q57a c5q57b c5q57c c5q57d c5q58a c5q58b c5q58c c5q58d c5q44b c5q44c c5q44d c5q59a c5q59b c5q59c c5q59d c5q55a c5q55b c5q55c c5q55d c5q60a c5q60b c5q60c c5q60d c5q47b c5q47c c5q47d c5q48a c5q48b c5q48c c5q48d c5q61a c5q61b c5q61c c5q61d c5q49a c5q49b c5q49c c5q49d c5q50b c5q50c c5q50d c5q51a c5q51b c5q51c c5q51d c5q52a c5q52b c5q52c c5q52d c5q56a c5q56b c5q56c c5q56d c5q62a c5q62b c5q62c c5q62d c5q54a c5q54b c5q54c c5q54d c5q53a c10q306 c10q307 c10q308 c10q309 c10q401 c10q402 c10q403 c6q55a c6q55b c6q55i c6q55f c6q55g c6q56a c6q56b c6q56i c6q56f c6q56g c6q57a c6q57b c6q57i c6q57f c6q57g c6q58a c6q58b c6q58i c6q58f c6q58g c6q59a c6q59b c6q59i c6q59f c6q59g c6q60a c6q60b c6q60i c6q60f c6q60g c6q61a c6q61b c6q61i c6q61f c6q61g c6q62a c6q62b c6q62i c6q62f c6q62g c6q63a c6q63b c6q63i c6q63f c6q63g c6q64a c6q64b c6q64i c6q64f c6q64g c6q65a c6q65b c6q65i c6q65f c6q65g c6q66a c6q66b c6q66i c6q66f c6q66g c6q67a c6q67b c6q67i c6q67f c6q67g c6q68a c6q68b c6q68i c6q68f c6q68g c6q69a c6q69b c6q69i c6q69f c6q69g c6q70a c6q70b c6q70i c6q70f c6q70g c6q71a c6q71b c6q71i c6q71f c6q71g c6q72a c6q72b c6q72i c6q72f c6q72g c6q73a c6q73b c6q73i c6q73f c6q73g c6q74a c6q74b c6q74i c6q74f c6q74g c6q75a c6q75b c6q75i c6q75f c6q75g c6q76a c6q76b c6q76i c6q76f c6q76g c6q77a c6q77b c6q77i c6q77f c6q77g c6q78a c6q78b c6q78i c6q78f c6q78g c6q79a c6q79b c6q79i c6q79f c6q79g c6q80a c6q80b c6q80i c6q80f c6q80g c6q81a c6q81b c6q81i c6q81f c6q81g c6q82a c6q82b c6q82i c6q82f c6q82g c6q83a c6q83b c6q83i c6q83f c6q83g c6q84a c6q84b c6q84i c6q84f c6q84g c6q85a c6q85b c6q85i c6q85f c6q85g c6q86a c6q86b c6q86i c6q86f c6q86g c6q87a c6q87b c6q87i c6q87f c6q87g c6q88a c6q88b c6q88i c6q88f c6q88g c6q89a c6q89b c6q89i c6q89f c6q89g c6q90a c6q90b c6q90i c6q90f c6q90g c6q91a c6q91b c6q91i c6q91f c6q91g c6q92a c6q92b c6q92i c6q92f c6q92g c6q93a c6q93b c6q93i c6q93f c6q93g c6q94a c6q94b c6q94i c6q94f c6q94g c6q95a c6q95b c6q95i c6q95f c6q95g c6q96a c6q96b c6q96i c6q96f c6q96g c6q97a c6q97b c6q97i c6q97f c6q97g c6q98a c6q98b c6q98i c6q98f c6q98g c6q99a c6q99b c6q99i c6q99f c6q99g c6q100a c6q100b c6q100i c6q100f c6q100g c6q101a c6q101b c6q101i c6q101f c6q101g c6q102a c6q102b c6q102i c6q102f c6q102g c6q103a c6q103b c6q103i c6q103f c6q103g c6q104a c6q104b c6q104i c6q104f c6q104g c6q105a c6q105b c6q105i c6q105f c6q105g c6q106a c6q106b c6q106i c6q106f c6q106g c6q107a c6q107b c6q107i c6q107f c6q107g c6q108a c6q108b c6q108i c6q108f c6q108g c6q109a c6q109b c6q109i c6q109f c6q109g c6q110a c6q110b c6q110i c6q110f c6q110g c6q111a c6q111b c6q111i c6q111f c6q111g c6q112a c6q112b c6q112i c6q112f c6q112g c6q113a c6q113b c6q113i c6q113f c6q113g c6q114a c6q114b c6q114i c6q114f c6q114g c6q115a c6q115b c6q115i c6q115f c6q115g c6q116a c6q116b c6q116i c6q116f c6q116g c6q117a c6q117b c6q117i c6q117f c6q117g c6q118a c6q118b c6q118i c6q118f c6q118g c6q119a c6q119b c6q119i c6q119f c6q119g c6q120a c6q120b c6q120i c6q120f c6q120g c6q121a c6q121b c6q121i c6q121f c6q121g c6q122a c6q122b c6q122i c6q122f c6q122g c6q123a c6q123b c6q123i c6q123f c6q123g c6q124a c6q124b c6q124i c6q124f c6q124g c6q125a c6q125b c6q125i c6q125f c6q125g c6q126a c6q126b c6q126i c6q126f c6q126g c6q127a c6q127b c6q127i c6q127f c6q127g c6q128a c6q128b c6q128i c6q128f c6q128g c6q129a c6q129b c6q129i c6q129f c6q129g c6q130a c6q130b c6q130i c6q130f c6q130g c6q131a c6q131b c6q131i c6q131f c6q131g c6q132a c6q132b c6q132i c6q132f c6q132g c6q133a c6q133b c6q133i c6q133f c6q133g c6q134a c6q134b c6q134i c6q134f c6q134g c6q135a c6q135b c6q135i c6q135f c6q135g c6q136a c6q136b c6q136i c6q136f c6q136g c6q137a c6q137b c6q137i c6q137f c6q137g c6q138a c6q138b c6q138i c6q138f c6q138g c6q139a c6q139b c6q139i c6q139f c6q139g c6q140a c6q140b c6q140i c6q140f c6q140g c6q141a c6q141b c6q141i c6q141f c6q141g c6q301 c6q302text c6q301a c10q404a c10q405a c10q406a c10q407a c10q408a c10q409a c10q410a c10q411a c10q412a c10q413a c10q414a c10q414atext c10q404b c10q404c c10q404d c10q404e c10q405b c10q405c c10q405d c10q405e c10q406b c10q406c c10q406d c10q406e c10q407b c10q407c c10q407d c10q407e c10q408b c10q408c c10q408d c10q408e c10q409b c10q409c c10q409d c10q409e c10q410b c10q410c c10q410d c10q410e c10q411b c10q411c c10q411d c10q411e c10q412b c10q412c c10q412d c10q412e c10q413b c10q413c c10q413d c10q413e c10q414b c10q414c c10q414d c10q414e c7q150 c7q151 c7q401a c7q401b c7q401c c7q401d c7q152a c7q152b c7q152c c7q152d c7q155a c7q155b c7q155c c7q155d c7q157a c7q157b c7q157c c7q157d c7q161a c7q161b c7q161c c7q161d c11q301 c12q255a c12q255b c12q255c c12q255d c12q256a c12q256b c12q256c c12q256d c12q257a c12q257b c12q257c c12q257d c12q258a c12q258b c12q258c c12q258d c12q259a c12q259b c12q259c c12q259d c12q260a c12q260l c12q260m c12q260b c12q260c c12q260n c12q260o c12q260e c12q260p c12q260g c12q260f c12q260q c12q260r c12q260h c12q260s c12q260t c12q260u c12q260v c12q260j c12q260jtext c12q260k c12q401a c12q401b c12q401c c12q401d c12q401e c12q401f c12q401g c12q401h c12q401i c12q401itext c12q402a c12q402b c12q402c c12q402d c12q402e c12q402f c12q402g c12q402h c12q402i c12q402itext c12q261 c12q262h c12q262i c12q262j c12q262k c12q262l c12q262m c12q262n c12q262o c12q262p c12q262q c12q262b c12q262f c12q262ftext c12q262g m1q302 m1q302text m1q303a m1q303b m1q303c m1q303d m1q303e m1q303f m1q303g m1q303h m1q401a m1q401b m1q401c m1q401d m1q401e m1q401f m1q401g m1q401h m1q401i m2q402  m2q403f m2q403ftext m2q404 m8q219 m8q301 m8q401a m8q401b m8q401c m8q402a m8q402b m8q402c m8q403a m8q403b m8q403c m8q404a m8q404b m8q404c m8q405 m8q220a m8q220b m8q303h m8q220g m8q220h m8q220i m8q220j m8q220k m8q220c m8q220l m8q303i m8q303a m8q303b m8q303c m8q303d m8q303e m8q303f m8q303ftext m8q303g m8q304 m6q196 m6q204e m6q204g m6q204c m6q204d m6q204f m6q204ftext m6q204b m13q401 m13q402 m13q403 m13q404 m13q405 m13q406 m13q407 m13q408 m13q409 m17q301a m17q301b m17q301c m17q301d m17q301e m17q301f m17q301g m17q301h m17q301i m17q303 m17q306 m17q308 m17q401a m17q401b m17q401c m17q401d m17q401e m17q401f m17q401g m17q401h m17q401i m17q401itext m17q401j m17q401k m17q402a m17q402b m17q402c m17q403a m17q403b m17q403c m17q403d m17q403e m17q403f m17q403g m17q403h m17q403i m17q403j m17q403k m17q403l m17q403m m17q403n m17q403o m17q403p m17q403q m17q403r m17q403s m17q403t m17q403u m17q403v m17q403w m17q403x m17q403y m17q403z m17q403aa m17q403ab m17q403ac m17q403ad m17q403ae m17q403af m17q403ag m17q403ah m17q403ai m17q403aj m17q403ak m17q403al m17q403altext m17q404a m17q404b m17q404c m17q404d m17q404e m17q404f m17q404g m17q404h m17q404i m17q404itext m5q192a m5q192b m5q192g m5q192c m5q192d m5q192e m5q192f m5q192ftext m5q304 m5q305 m5q401 m5q402 m15q142b m15q142c m15q142d m15q142e m15q142f m15q142g m15q142h m15q142i m15q142j m15q142jtext m15q301 m15q302a m15q302b m15q302c m15q302d m15q302e m15q302f m15q302g m15q302gtext m15q303 m15q402 m15q403a m15q403c m15q403d m15q403e m15q403f m15q305a m15q305c m15q305d m15q305e m15q305f m15q306a m15q306c m15q306d m15q306e m15q306f m15q307a m15q307c m15q307d m15q307e m15q307f m15q308a m15q308c m15q308d m15q308e m15q308f m15q309a m15q309c m15q309d m15q309e m15q309f m15q310a m15q310c m15q310d m15q310e m15q310f m15q311a m15q311c m15q311d m15q311e m15q311f m15q311atext m15q404a m15q404c m15q404d m15q404e m15q404f m15q405a m15q405c m15q405d m15q405e m15q405f m15q406a m15q406c m15q406d m15q406e m15q406f m15q407a m15q407c m15q407d m15q407e m15q407f m15q408a m15q408c m15q408d m15q408e m15q408f m15q409a m15q409c m15q409d m15q409e m15q409f m15q410a m15q410c m15q410d m15q410e m15q410f m15q411a m15q411c m15q411d m15q411e m15q411f m15q411atext m15q312g m15q312h m15q312f m15q312a m15q312b m15q312c m15q312d m15q412a m15q412b m15q313 m15q313text m4q301 m4q302 m4q304 m4q401 m4q402 m4q306 m4q307a m4q307b m4q307c m4q307d m4q307e m4q307f m4q307g m4q307h m4q307htext m4q308a m4q308b m4q308c m4q308e m4q308f m4q308h m4q308htext m4q308k m4q308l m4q308m m4q308n m4q308i m4q308j m4q403a m4q403b m4q404a m4q404b m4q405a m4q405b m4q406a m4q406b m4q407a m4q407b m4q408a m4q408b m4q409a m4q409b m4q410a m4q410b m4q411a m4q411b m4q412a m4q412b m4q413 m4q414a m4q414b m4q414c m4q414ctext m14q301a m14q301b m14q301c m14q301d m14q302a m14q302b m14q302c m14q302d m14q303a m14q303b m14q303c m14q303d m14q304a m14q304b m14q304c m14q304d m14q401a m14q401b m14q401c m14q401d m18q146a m18q146b m18q146c m18q146d m18q146j m18q146e m18q146f m18q146g m18q146h m18q146i c0coreweight_s c0coreweight_p c0moduleweight2
  /COMPRESSED.

***open the saved final.sav***
***close other data sets***

**Rename variables for easier interpretation of results**

RENAME VARIABLES 
(c0moduleweight1 = weight01)
(nacchoid = id)
(m2q403a = notappropriate)
(m2q403b = highfees)
(m2q403c = exceedcapacity)
(m2q403d = exceedbene)
(m2q403e = directednot)
(c2q301 = LBH)
(c5q47a = epidemiologist)
(c5q50a = ITspecialist)
(c5q44a = PHphysician)
(m1q301 = QI)
(c0population = population)
(ruca_3_cat_RC = rurality)
(c0govcat = goverance)

***Label Variables***

VALUE LABELS rurality
1 'rural'
2 'micropolitan'
3 'urban'.
EXECUTE.

**PHAB**

RECODE m2q401 (5=0) (4=0) (6=0) (2=1) (3=1) (7=SYSMIS) (ELSE=SYSMIS) INTO PHAB.
VARIABLE LABELS  PHAB 'Decision to seek PHAB accreditation'.
VALUE LABELS PHAB 
1 'seeking'
0 'not seeking'.
EXECUTE.

**Completion of CHA**

RECODE c7q147 (1=1) (2=1) (3=1) (4=0) (5=0) INTO CHA.
VARIABLE LABELS  CHA 'Completion of CHA'.
VALUE LABELS CHA
1 'Yes'
0 'No'.
EXECUTE.

**Completion of Community health improvement plan**

RECODE c7q149 (1=1) (2=1) (3=1) (4=0) (5=SYSMIS) INTO CHIP.
VARIABLE LABELS  CHIP 'Completion of CHIP'.
VALUE LABELS CHIP
1 'Yes'
0 'No'.
EXECUTE.

**agency wide strategic plan**

RECODE c7q217 (1=1) (2=1) (3=1) (4=0) (5=0) INTO stplan.
VARIABLE LABELS  stplan 'agency wide strategic plan'.
VALUE LABELS stplan
1 'Yes'
0 'No'.
EXECUTE.

**LBH adopt regulations**

RECODE c2q8a (1=1) (0=0) (SYSMIS=SYSMIS) INTO LBHadoptreg.
VARIABLE LABELS  LBHadoptreg 'LBH adopt regulations'.
VALUE LABELS LBHadoptreg 
1 'Yes'
0 'No'.
EXECUTE.


**agency admin highest degree**

DO IF  (c4q31b  =  1).
RECODE c4q31b (1=1) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q31a  =  1).
RECODE c4q31a (1=1) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q32a  =  1).
RECODE c4q32a (1=2) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q32b  =  1).
RECODE c4q32b (1=2) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q32c  =  1).
RECODE c4q32c (1=2) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q32d  =  1).
RECODE c4q32d (1=2) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q33e  =  1).
RECODE c4q33e (1=3) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q33f  =  1).
RECODE c4q33f (1=3) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q33a  =  1).
RECODE c4q33a (1=3) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q33b  =  1).
RECODE c4q33b (1=3) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q33c  =  1).
RECODE c4q33c (1=3) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q34a  =  1).
RECODE c4q34a (1=4) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q34b  =  1).
RECODE c4q34b (1=4) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q34c  =  1).
RECODE c4q34c (1=4) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q34d  =  1).
RECODE c4q34d (1=4) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q34e  =  1).
RECODE c4q34e (1=4) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q34f  =  1).
RECODE c4q34f (1=4) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q34g  =  1).
RECODE c4q34g (1=4) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

DO IF  (c4q34h  =  1).
RECODE c4q34h (1=4) INTO degree.
END IF.
VARIABLE LABELS  degree 'agency admin highest degree'.
EXECUTE.

VALUE LABELS degree
1 'Associates'
2 'Bachelors'
3 'Masters'
4 'Professional/Doctoral'.
EXECUTE.

***Recode Revenue/ Revenue Per Capital/ FTE***

COMPUTE revenue=c3q16 / 1000000.
VARIABLE LABELS  revenue 'revenue'.
EXECUTE.

COMPUTE PerCaprevenue=c3q16 / population.
VARIABLE LABELS  PerCaprevenue 'revenue PerCap'.
EXECUTE.

COMPUTE FTE=c5q37/ (population/10000).
VARIABLE LABELS  FTE 'FTE'.
EXECUTE.

***turn on weight before conducting analyses***

WEIGHT BY weight01.

***Exclude LHDs pursing accreditation via state***

FILTER OFF.
USE ALL.
SELECT IF (PHAB  =  1  |  PHAB  = 0).
EXECUTE.

***Create Table 1***

FREQUENCIES VARIABLES=rurality CHA CHIP stplan LBH LBHadoptreg goverance epidemiologist PHphysician 
    ITspecialist degree QI
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=population revenue FTE
  /STATISTICS=MEAN STDDEV.


***Create Table 2***

CROSSTABS
  /TABLES=rurality CHA CHIP stplan LBH LBHadoptreg goverance epidemiologist PHphysician 
    ITspecialist degree QI BY PHAB
  /FORMAT=AVALUE TABLES
  /STATISTICS=BTAU 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

MEANS TABLES=population revenue FTE BY PHAB
  /CELLS=MEAN STDDEV.

NPAR TESTS
  /M-W= population revenue FTE BY PHAB(0 1)
  /STATISTICS=DESCRIPTIVES 
  /MISSING ANALYSIS.

***Create Table 3***

CROSSTABS
  /TABLES=notappropriate highfees exceedcapacity exceedbene directednot BY rurality
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ BTAU 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

***Recode Dummy Variables for logistic regression***

RECODE rurality (2=1) (ELSE=0) INTO rurality_micropolitan.
EXECUTE.

RECODE rurality (3=1) (ELSE=0) INTO rurality_urban.
EXECUTE.

RECODE goverance (1=1) (ELSE=0) INTO goverance_state.
EXECUTE.

RECODE goverance (2=1) (ELSE=0) INTO goverance_local.
EXECUTE.

***Table 4***

LOGISTIC REGRESSION VARIABLES=PHAB WITH rurality_micropolitan rurality_urban PerCaprevenue stplan goverance_state 
    goverance_local LBH epidemiologist PHphysician ITspecialist
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).









