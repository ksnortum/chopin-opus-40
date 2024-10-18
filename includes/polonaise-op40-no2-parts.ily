%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 4) (0 . 4))
                        ((0 . 4) (3 . 4) (0 . 4) (0 . 0))
                        ) \etc
slurShapeB = \shape #'((0 . -1) (0 . -1) (0 . 0) (0 . 0)) \etc
slurShapeC = \shape #'((0 . 2) (2 . 4.5) (2 . 1) (0 . 0)) \etc
slurShapeD = \shape #'((0 . 2) (4 . 5.5) (3 . 1) (0 . 0)) \etc
slurShapeE = \shape #'((0 . 0) (0 . -1) (0 . -1) (0 . 0)) \etc

beamPositionsA = \once \override Staff.Beam.positions = #'(2.5 . 4)

%%% Music %%%

global = {
  \time 3/4
  \key c \minor
}

rightHandUpper = \relative {
  \slurUp
  <g c ef g>8( q q q q q |
  q8 q q q q q)
  \repeat volta 2 {
    \slurUp \dynamicUp
    q8( q <g c g'> q <g b f' g> q |
    <g c ef g>8 q q q q q |
    <g c g'>8 q <g c ef g> q <b d g b> q |
    <c g' c>8 q <c ef g c> q q q) |
    r8 <c g' c>( <c af' c> <c f c'> <bf f' bf> <bf fs' bf>) |
    r8 <bf g' bf>( q <bf ef bf'>\< <af ef' af> <af e' af>)\! |
    
    \barNumberCheck 9
    <af d! f af>(\> <g d' f g>)\! r <g b d g>( <g c g'> <a c fs a>) |
    \voiceOne a'4( b8[ c ef8. d16] |
    c8)\noBeam \oneVoice <g, ef' g>^( <g c g'> q <g b f' g> q |
    <g c ef g>8 q q q <g bf! ef g> q |
    <bf ef g bf>8 q <bf ef bf'> q <bf d af' bf> q |
    <bf df g bf> q q <df ef g bf> <df ef g b> q) |
    \voiceOne c'4( bf8 af df c) |
    b4( af8 g c bf) |
    
    \barNumberCheck 17
    af4( af8 af af af) |
    \oneVoice \slurUp <c, f af>( <b f' g>) r <g b f' g>[( <g c ef g>]) r |
  }
  \repeat volta 2 {
    \staffDown \voiceOne <df af' df>8-!\noBeam \staffUp \oneVoice
      <df'' af' df>16-. <df bf' df>-. <df af' df>8-. r r c->~( |
    c16 b f <c' ef>  q <b d!> f c'  c b f8) |
    <df af' df>8-!\noBeam <df' af' df>16-. <df bf' df>-. <df af' df>8-. r r
      c->~( |
    c16 b f <c' ef>  q <b d!> f c'  \stemDown c b f) d'->( |
    d16 cs g <d' f>  q <cs e> g d'  d cs g) e'->( |
    e16 ds a) <e' g>->(  q <ds fs> a) <g' b>->(  q <fs a> c) <b' d!>->( |
    
    \barNumberCheck 25
    q16 <a c> c,) <g' b>->(  q <fs a> c) <b' d>->(  q <a c> c,) <a' c>->( |
    q16 <g b> b, <a' c>  q <g b> b, <g' b>  q <fs a> a, <fs' a> |
    q16 <e g> g, <e' g>  q <d fs> g, <d' fs>  <c fs> e a, e') |
    <b e>16( d g, e'  <b e> d g, e'  <b e> d g, e' |
    <c e>16 d fs, e'  <c e> d fs, e'  <b e> d fs, e') |
    <b e>16( d g, c  \stemUp <g c> b d, a'  <d, a'> g b, g' |
    <c, g'>16 fs g, fs'  <c fs> e g, e'  <c e> d a e') |
    <b e>16^( d g, e'  <b e> d g, e'  <b e> d g, e' |
    
    \barNumberCheck 33
    <c e> d fs, e'  <c e> d fs, e'  <b e> d fs, e') |
    s2. |
    \voiceOne r4 r8 g b g |
    b4. d8\rest s4 |
    s2. * 3 |
    % like bar 3
    s8 <g,, c ef g>( <g c g'> q <g b f' g> q |
    
    \barNumberCheck 41
    <g c ef g>8 q q q q q |
    <g c g'>8 q <g c ef g> q <b d g b> q |
    <c g' c>8 q <c ef g c> q q q) |
    r8 <c g' c>( <c af' c> <c f c'> <bf f' bf> <bf fs' bf>) |
    r8 <bf g' bf>( q <bf ef bf'> <af ef' af> <af e' af>) |
    <af d! f af>( <g d' f g>) r <g b d g>( <g c g'> <a c fs a>) |
    \voiceOne a'4( b8[ c ef8. d16] |
    % like 11
    c8)\noBeam \oneVoice <g, ef' g>^( <g c g'> q <g b f' g> q |
     
    \barNumberCheck 49 
    <g c ef g>8 q q q <g bf! ef g> q |
    <bf ef g bf>8 q <bf ef bf'> q <bf d af' bf> q |
    <bf df g bf> q q <df ef g bf> <df ef g b> q) |
    \voiceOne c'4( bf8 af df c) |
    b4( af8 g c bf) |
    af4( af8 af af af) |
    \oneVoice \slurUp <c, f af>( <b f' g>) r <g b f' g>[( <g c ef g>]) r |
  }
  \key af \major
  \voiceOne ef'4( c' df |
  
  \barNumberCheck 57
  \oneVoice <b d>4 <c ef>) \slurUp <cf ff>8.( q16 |
  q4 <c ef>) <gs d'>8( q16 q |
  q8 <a cs>16 q)  <gs e'>8( <gs d'>16 q  q8 q |
  q8 <a cs>16 q)  <bf! df>8( <af c>16 q)  <g ef'!>8( <g df'>16 q |
  q8) q( \acciaccatura { df' } <af c> <g bf> <g c> <f af>|
  <e g>4) <e g c e>( <f g b d>~^\> |
  <e g c>4)\! \voiceOne <af! df!>( <g bf!>) |
  \oneVoice <c, ef>( \voiceOne c' df |
  
  \barNumberCheck 65
  \oneVoice <b d>16 <g' bf!> <f af> <b, f'>  <c ef>4) <b e>8.( q16 |
  \voiceOne e2  f8 ef16 ef |
  \oneVoice <a, ef'>8 <bf! d>16 q) <af f'>8->( <af ef'>16 q  q8 q |
  <a ef'>8 <bf d>16 q)  <b d>8( <a cs>16 q)  <gs e'>8->( <gs d'>16 q |
  q8 <af df>16 q  \acciaccatura { df8 } <g, c> <g bf!> <g c> <f af> |
  \voiceOne ef!8) c'( \oneVoice <df, ef g bf>4 <c af'>8) r |
  <bf e af>8-! <bf e g>-! r q^( \voiceOne g'[ f]) |
  f8( ef!4 ef8  ef[ df]) |
  
  \barNumberCheck 73
  \clef bass df8( c4 <ef, c'>8 <df c'>[\arpeggio bf'] |
  af4~ af8) g~(  g16 c <b d> <c ef>) |
  \clef treble \oneVoice <bf! e af>8-! <bf e g>-! r q^( \voiceOne g'[ f]) |
  f8( ef!4 ef8  ef[ df]) |
  df8.( c16  d cs d ef  e ds e f |
  gf16 f gf g  af g af a  bf a bf b) |
  \oneVoice c16^( e, g <f bf!>  c' e, g <f df'>  c' e, g <f bf> |
  c'16 e, g <f df'>  c' e, g <f bf>  c' e, g <f df'> |
  
  \barNumberCheck 81
  <e c'>4) c'-.(^\slendando c-. |
  c4.\fermata f16 ef! df bf f g) |
  % like 56 (to 69)
  \voiceOne ef4( c' df |
  \oneVoice <b d>4 <c ef>) \slurUp <cf ff>8.( q16 |
  q4 <c ef>) <gs d'>8( q16 q |
  q8 <a cs>16 q)  <gs e'>8( <gs d'>16 q  q8 q |
  q8 <a cs>16 q)  <bf! df>8( <af c>16 q)  <g ef'!>8( <g df'>16 q |
  q8) q( \acciaccatura { df' } <af c> <g bf> <g c> <f af>|
  
  \barNumberCheck 89
  <e g>4) <e g c e>( <f g b d>~^\> |
  <e g c>4)\! \voiceOne <af! df!>( <g bf!>) |
  \oneVoice <c, ef>( \voiceOne c' df |
  \oneVoice <b d>16 <g' bf!> <f af> <b, f'>  <c ef>4) <b e>8.( q16 |
  \voiceOne e2  f8 ef16 ef |
  \oneVoice <a, ef'>8 <bf! d>16 q) <af f'>8->( <af ef'>16 q  q8 q |
  <a ef'>8 <bf d>16 q)  <b d>8( <a cs>16 q)  <gs e'>8->( <gs d'>16 q |
  q8 <af df>16 q  \acciaccatura { df8 } <g, c> <g bf!> <g c> <f af>) |
  
  \barNumberCheck 97
  \voiceOne ef!8 c' bf2-> |
  c,8 c' bf2-> |
  c,8( bf' af4 g)~ |
  g8 bf!( af4 g)~ |
  \key c \minor
  g8 bf!( af4 g)~ |
  g8 bf!( af4 g)~ |
  g8 bf( af4 g)~ |
  g8 bf( af4 g) |
  
  \barNumberCheck 105
  % like 7 (to 15)
  \oneVoice \slurUp r8 <c, g' c>( <c af' c> <c f c'> <bf f' bf> <bf fs' bf>) |
  r8 <bf g' bf>( q <bf ef bf'> <af ef' af> <af e' af>) |
  <af d! f af>( <g d' f g>) r <g b d g>( <g c g'> <a c fs a>) |
  \voiceOne a'4( b8[ c ef8. d16] |
  c8)\noBeam \oneVoice <g, ef' g>^( <g c g'> q <g b f' g> q |
  <g c ef g>8 q q q <g bf! ef g> q |
  <bf ef g bf>8 q <bf ef bf'> q <bf d af' bf> q |
  <bf df g bf> q q <df ef g bf> <df ef g b> q) |
  
  \barNumberCheck 113
  \voiceOne c'4( bf8 af df c) |
  bf8( af \ritSpanner df\startTextSpan c) \acciaccatura { c } bf( af) |
  \oneVoice <f af f'>4 r r |
  r4 <g,! b f' g!^~>2 |
  <g c ef g>2.\stopTextSpan\fermata |
  \bar "|."
}

rightHandLower = \relative {
  s2. * 2 |
  \repeat volta 2 {
    \voiceFour 
    s2. * 6 |
    
    \barNumberCheck 9
    s2. |
    <a c fs>8 q\< <c fs> q\! <f b>\> <f g b>\! |
    <ef g>8 s8 s2 |
    s2. * 3 |
    <c gf'>8 q q q <df f> q |
    <d! f>8 q <b f'> q <c ef> q |
    
    \barNumberCheck 17
    q8 q <b d> <c ef> <b d> <af ef'> |
    s2. |
  }
  \repeat volta 2 {
    s2. * 6 |
    
    \barNumberCheck 25
    s2. * 8 |
    
    \barNumberCheck 33
    s2. |
    \voiceOne e'16-\slurShapeA ( d e d  e d e d  e d e d |
    \voiceFour e16 d e d  e d e d  e d e d |
    e16 d e d  e d e d  e d b) \clef bass d,^( |
    g16 c b d,  g c b d,  g c b d, |
    g16 c b d,  g c b d,  g c b d, |
    g16 fs g fs  f e f e  ef d ef d |
    % like 3
    \stemUp c8) \clef treble s s2 |
    
    \barNumberCheck 41
    s2. * 6 |
    \voiceFour <a' c fs>8 q <c fs> q <f b> <f g b> |
    % like 11
    <ef g>8 s8 s2 |
    
    \barNumberCheck 49
    s2. * 3 |
    <c gf'>8 q q q <df f> q |
    <d! f>8 q <b f'> q <c ef> q |
    q8 q <b d> <c ef> <b d> <af ef'> |
    s2. |
  }
  \key af \major
  s4 af'  g16 f ef bf' |
  
  \barNumberCheck 57
  s2. * 6 |
  s4 df,!2 |
  s4 af'  g16 f ef bf' |
  
  \barNumberCheck 65
  s2. |
  b4 a~  a8 a16 a |
  s2. * 3 |
  ef4~ \hideNoteHead <df ef> s |
  s2 <af df!>4 |
  c2 <f, af>4 |
  
  \barNumberCheck 73
  \clef bass af2 g4 |
  ff4( ef) g |
  s2 <af df!>4 |
  c2 <f, af>4 |
  af4 af8. a16  bf8. b16 |
  c8. df!16  d8. ef16  e8. f16 |
  s2. * 2 |
  
  \barNumberCheck 81
  s2. * 2 |
  % like 56 (to 69)
  s4 af  g16 f ef bf' |
  s2. * 5 |
  
  \barNumberCheck 89
  s2. |
  s4 df,!2 |
  s4 af'  g16 f ef bf' |
  s2. |
  b4 a~  a8 a16 a |
  s2. * 3 |
  
  \barNumberCheck 97
  ef!4*1/2-\slurShapeC ^( \hideNoteHead c'8 <df, g>[ q <c g'> q]) |
  c4*1/2-\slurShapeD ^( \hideNoteHead c'8  <c, g'>[ q <c f> q]) |
  c4 <c d>8 q <b d f> q |
  q8 <b! d f> q q q q |
  \key c \minor 
  <g c ef>8 <bf! c ef> <af c ef> q <g b f'> q |
  <g c ef>8 <bf! c ef> <af c ef> q <g c ef> q |
  <g c ef> <bf c ef> <c ef> q <g b d> q |
  <g c> <bf! c> <af c ef> q <g c ef> q |
  
  \barNumberCheck 105
  % like 7 (to 15)
  s2. * 3 |
  <a c fs>8 q <c fs> q <f b> <f g b> |
  <ef g>8 s8 s2 |
  s2. * 3 |
  
  \barNumberCheck 113
  <c gf'>8 q q q <df f> q |
  <c gf'> q <df f> q <c gf'> q |
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  s2. * 2 |
  \repeat volta 2 {
    \voiceThree 
    s2. * 6 |
    
    \barNumberCheck 9
    s2. * 8 |
    
    \barNumberCheck 17
    s2. * 2 |
  }
  \repeat volta 2 {
    s2. * 6 |
    
    \barNumberCheck 25
    s2. * 3 |
    d''4\rest d, d |
    << 
      { d'4\rest a d\rest | } 
      \new Voice { \voiceOne d,2.*1/3( \hideNoteHead a'4) s | } 
    >>
    \clef bass s2. |
    f,4\rest e fs |
    f4\rest d d |
    
    \barNumberCheck 33
    << 
      { b'4\rest a b\rest | } 
      \new Voice { \voiceOne d,2.*1/3( \hideNoteHead a'4) s | } 
    >>
    \staffUp \voiceFour b4. \staffDown \voiceThree g8_( b g) |
    b2.~\arpeggio |
    b4. s |
    s2. * 4 |
    
    \barNumberCheck 41
    s2. * 8 |
    
    \barNumberCheck 49
    s2. * 7 |
  }
  \key af \major
  s2. |
  
  \barNumberCheck 57
  s2. * 6 |
  s4 f8( g16 f  ef16 df' f, g) |
  af,8 s8 s2 |
  
  \barNumberCheck 65
  s2. |
  s4 a'~ \hideNoteHead a8 s |
  s2. * 6 |
  
  \barNumberCheck 73
  s2. * 8 |
  
  \barNumberCheck 81
  s2. * 2 |
  % like 56 (to 69)
  s2. * 6 |
  
  \barNumberCheck 89
  s2. |
  s4 f8( g16 f  ef16 df' f, g) |
  s2. * 2 |
  s4 a~ \hideNoteHead a8 s |
  s2. * 3 |
  
  \barNumberCheck 97
}

leftHandLower = \relative {
  R2. * 2 |
  \repeat volta 2 {
    \slurDown
    <c,, c'>8[ r16 <g' g'>](  <ef' ef'>4.\< <d d'>8)\! |
    q16(\> <c c'> <b b'> <c c'>\! <g g'>2) |
    <ef' ef'>8.( <c c'>16 <g' g'>4.\< <f f'>8)\! |
    q16(\> <ef ef'> <d d'> <ef ef'>\! <c c'>2) |
    <ef' ef'>4 <ef, ef'>4.(\> <d d'>8\! |
    <d' d'>4) <d, d'>4.->( <df df'>8 |
    
    \barNumberCheck 9
    <c c'>8.\< <b b'>16 <f' f'>4\! <ef ef'>) |
    q8(\> <d d'>)\! r4 r8 <g,  g'>8( |
    <c, c'>8)[ r16 <g' g'>16](  <ef' ef'>4.\< <d d'>8)\! |
    q16(\> <c c'> <b b'> <c c'>\! <g g'>4) <bf bf'>( |
    <ef, ef'>8)[ r16 <bf' bf'>]( <g' g'>4.\< <f f'>8)\! |
    q16(\> <ef ef'> <d! d'!> <ef ef'>\! <ef, ef'>2) |
    <af' af'>4\> <af, af'>4.( q8\! |
    <af' af'>4) <g, g'>4.( q8 |
    
    \barNumberCheck 17
    <g' g'>4 <f f'>8 <ef ef'> <f f'> <c c'>) |
    r8 <g g'>( <d' d'>4 <c c'>8) r |
  }
  \repeat volta 2 {
    \voiceTwo <f, f'>8-!\noBeam \oneVoice <f'' af df f>16-. q-. q8-.
      <af af'>4-> r8 |
    <g, g'>8\noBeam \clef treble <d''! af'> g,-. <d' af'> g,-. <d' af'> |
    \clef bass <f,, f'>8-!\noBeam <f' af df f>16-. q-. q8-. <af af'>4-> r8 |
    <g, g'>8\noBeam \clef treble <d''! af'> g,-. <d' af'> g,-. <d' af'> |
    g,8 <cs e bf'> g[ <cs e bf'>] g <cs e bf'> |
    g8 <ds' fs c'!> g,[ <ds' fs c'>] g, <ds' fs ds'> |
    
    \barNumberCheck 25
    g,8 <ef'! fs ef'!> g,[ <ef' fs ef'>] g, <ef' fs ef'> |
    \clef bass g,,,8( g' d' g a b) |
    c4( e fs) |
    \clef treble \voiceTwo g,2.~ |
    g2. |
    \clef bass \oneVoice \beamPositionsA g,,8_( g' d' g a \staffUp \voiceTwo 
      b) |
    \staffDown g,2.*2/3( \hideNoteHead fs'4) | 
    g,2.~ |
    
    \barNumberCheck 33
    g2. |
    <g d'>2. |
    q2.~\arpeggio |
    q4. \oneVoice  r8 r r16 d( |
    g16) r8 d16[( g]) r8 d16[( g]) r8 d16[( |
    g16]) r8 r16 r8 r16 d16[( g]) r8 d16[( |
    g16]) r8 fs16(  f e f e  ef d ef d |
    % like bar 3
    <c, c'>8) r16 <g' g'>( <ef' ef'>4.\< <d d'>8)\! |
    
    \barNumberCheck 41
    q16(\> <c c'> <b b'> <c c'>\! <g g'>2) |
    <ef' ef'>8.( <c c'>16 <g' g'>4.\< <f f'>8)\! |
    q16(\> <ef ef'> <d d'> <ef ef'>\! <c c'>2) |
    <ef' ef'>4 <ef, ef'>4.(\> <d d'>8\! |
    <d' d'>4) <d, d'>4.->( <df df'>8\< |
    <c c'>8. <b b'>16 <f' f'>4\! <ef ef'>) |
    q8(\> <d d'>)\! r4 r8 <g,  g'>8( |
    % like 11
    <c, c'>8)[ r16 <g' g'>16](  <ef' ef'>4.\< <d d'>8)\! |
    
    \barNumberCheck 49
    q16(\> <c c'> <b b'> <c c'>\! <g g'>4) <bf bf'>( |
    <ef, ef'>8)[ r16 <bf' bf'>]( <g' g'>4.\< <f f'>8)\! |
    q16(\> <ef ef'> <d! d'!> <ef ef'>\! <ef, ef'>2) |
    <af' af'>4\> <af, af'>4.( q8\! |
    <af' af'>4) <g, g'>4.( q8 |
    <g' g'>4 <f f'>8 <ef ef'> <f f'> <c c'>) |
    r8 <g g'>( <d' d'>4 <c c'>8) r |
  }
  \key af \major
  <af af'>8\noBeam ef''( <af c> ef <bf' df> ef, |
  
  \barNumberCheck 57
  <b' d>8 ef, <c' ef> ef,) <af cf ff> d, |
  <af' cf ff>[ d, <af' ef'> ef] <e b'>8 q16 q |
  <e b' e>8 <a e'>16 q  <e b' e>8 q16 q  q8 q |
  q8 <a e'>16 <gs e'>  <g ef'>8 <af ef'>16 q  <ef bf' ef>8 q16 q |
  q8 q <af ef'> <ef df'> <e c'> <f c'> |
  <g c>8-.\noBeam fs,16\((\< g)  c e a fs  g f'! a, b\! |
  c4\) \voiceTwo bf,!( ef! |
  af,8) ef'-\slurShapeB ^( <af c> ef <bf' df> ef, |
  
  \barNumberCheck 65
  <b' d>8 ef, <c' ef> ef,) <gs b e> d |
  <gs b e>8 d e' cs,  <c a' ef'>\arpeggio\noBeam \oneVoice f,16 <f' c' f> |
  q8 <bf f'>16 q  <f c' f>8 q16 q  q8 q |
  q8 <bf f'>16 <a f'>  <gs e'>8 <a e'>16 q  <e b' e>8 q16 q |
  q8 <e bf'>16 q  q8 <e df'!> <e c'> <f c'> |
  r8 ef,->~(  ef16 f d ef  af8) r |
  <c,, c'>8-! q-! r c''~(  c16 df! f af) |
  af16( g ef c  g ef d c)  f( af df! f) |
  
  \barNumberCheck 73
  ef16( d f ef  c af ef ef,  ef') ef'( ff df) |
  df16( c df af  c b c g  f ef d c) |
  <c, c'>8-! q-! r c''~(  c16 df! f af) |
  af16( g ef c  g ef d c)  f( af df! f) |
  ef16_( d ef e  f e f fs  g fs g af! |
  a16 gs a bf!  b as b c  df! c df g,) |
  c,16( g' c df  c c, g' bf  c c, g' df' |
  c16 c, g' bf  c c, g' df'  c c, g' bf) |
  
  \barNumberCheck 81
  <c, g'>4 r r |
  R2. |
  % like 56 (to 69)
  <af, af'>8\noBeam ef''( <af c> ef <bf' df> ef, |
  <b' d>8 ef, <c' ef> ef,) <af cf ff> d, |
  <af' cf ff>[ d, <af' ef'> ef] <e b'>8 q16 q |
  <e b' e>8 <a e'>16 q  <e b' e>8 q16 q  q8 q |
  q8 <a e'>16 <gs e'>  <g ef'>8 <af ef'>16 q  <ef bf' ef>8 q16 q |
  q8 q <af ef'> <ef df'> <e c'> <f c'> |
  
  \barNumberCheck 89
  <g c>8-.\noBeam fs,16\((\< g)  c e a fs  g f'! a, b\! |
  c4\) \voiceTwo bf,!( ef! |
  \oneVoice af,8)\noBeam ef'-\slurShapeB ( <af c> ef <bf' df> ef, |
  <b' d>8 ef, <c' ef> ef,) <gs b e> d |
  <gs b e>8 d e' cs,  <c a' ef'>\arpeggio\noBeam f,16 <f' c' f> |
  q8 <bf f'>16 q  <f c' f>8 q16 q  q8 q |
  q8 <bf f'>16 <a f'>  <gs e'>8 <a e'>16 q  <e b' e>8 q16 q |
  q8 <e bf'>16 q  q8 <e df'!> <e c'> <f c'> |
  
  \barNumberCheck 97
  r8 ef,!( ef16 f d\< ef  e f ds e)\! |
  r4 e16(\< f ds e  f g e f)\! |
  r4 f16(\< g e f  g af fs g)\! |
  g,4 g'16->-\slurShapeE ( af fs g  d-> af' fs g |
  \key c \minor 
  g,8.) <g g'>16( <ef' ef'>4. <d d'>8) |
  q16( <c c'> <b b'> <c c'>  <g g'>2) |
  <ef' ef'>8.( <c c'>16 <g' g'>4. <f f'>8) |
  q16( <ef ef'> <d d'> <ef ef'>  <c c'>2) |
  
  \barNumberCheck 105
  % like 7 (to 15)
  <ef' ef'>4 <ef, ef'>4._(-> <d d'>8 |
  <d' d'>4) <d, d'>4.->( <df df'>8\< |
  <c c'>8. <b b'>16 <f' f'>4\! <ef ef'>) |
  q8(\> <d d'>)\! r4 r8 <g,  g'>8( |
  <c, c'>8)[ r16 <g' g'>16](  <ef' ef'>4.\< <d d'>8)\! |
  q16(\> <c c'> <b b'> <c c'>\! <g g'>4) <bf bf'>( |
  <ef, ef'>8)[ r16 <bf' bf'>]( <g' g'>4.\< <f f'>8)\! |
  q16(\< <ef ef'> <d! d'!> <ef ef'>\! <ef, ef'>2) |
  
  \barNumberCheck 113
  <af' af'>4 <af, af'>4._( q8 |
  <af' af'>4) <af, af'> <af' af'> |
  <df af' df>4 r r |
  r8 <g,,! g'!>( <d'! d'!>2 |
  <c c'>2.)_\fermata |
}

leftHand = {
  \global
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override TextScript.Y-offset = -0.5
  s2\p\< s8 s\! |
  s2\> s8 s\! |
  \repeat volta 2 {
    s2.^\firstVoltaSecondVolta |
    s2. * 5 |
    
    \barNumberCheck 9
    s2. * 2 |
    s8 s-\tweak Y-offset -1 -\tweak extra-offset #'(0 . -0.5) \p s2 |
    s4. s-\alterBroken Y-offset #'(-1 1) \cresc |
    s2. |
    s2 s8. s16\! |
    s2.-\tweak Y-offset -1 \f |
    s4 s2-\tweak Y-offset -1 \dim |
    
    \barNumberCheck 17
    s2 s8. s16\! |
    s4\p\< s8\! s\> s4\! |
  }
  \repeat volta 2 {
    s2-\tweak Y-offset 2.5 \ff s8 s\p |
    s2. |
    s2\ff s8 s\p |
    s2. |
    s2.\cresc |
    s2. |
    
    \barNumberCheck 25
    s2 s8. s16\! |
    s4.-\tweak Y-offset -2 \f s\dim |
    s2 s8. s16\! |
    s4 s\< s8. s16\! |
    s4\> s8. s16\! s4 |
    s2.\sempreDim |
    s2. |
    s8 s\! s4\< s8. s16\! |
    
    \barNumberCheck 33
    s4\> s2\! |
    s2.\p |
    s4 s2\perdendosi |
    s2 s4\! |
    s2.\pp |
    s4. s\cresc |
    s2 s8. s16\! |
    s2.\f |
    
    \barNumberCheck 41
    s2. |
    s4 s2\< |
    s2 s8 s\! |
    s4-\tweak Y-offset 1 \rf s4.\> s8\! |
    s8 s\dim s2 |
    s2. * 2 |
    % like 11?
    s8\! s\p s2 |
    
    \barNumberCheck 49
    s4. s\cresc |
    s2. |
    s2 s8. s16\! |
    s2.\f |
    s4 s2\dim |
    s2 s8. s16\! |
    s4\p\< s8\! s\> s4\! |
  }
  % key of af major
  s2^\pEspress s8 s\<
  
  \barNumberCheck 57
  s4 s\! s\> |
  s4 s\! s\pp |
  s2. |
  s8. s16\< s8\! s4. |
  s2.\< |
  s4\! s2\f |
  \override DynamicTextSpanner.style = #'none
  s4 s2\dim 
  s2\!^\dolce s4\< |
  
  \barNumberCheck 65
  s4 s\! s\cresc |
  s2 s4\f |
  s2. |
  s8 s-\tweak Y-offset 1.5 \dim s2 |
  s2. |
  s4\p s\> s\! |
  s4\ff s8 s4.\p |
  s2. |
  
  \barNumberCheck 73
  s16 s8.\pocoCresc s2 |
  s4 s16 s8.\< s8. s16\! |
  s4\ff s8 s4.\p |
  s2. |
  \revert DynamicTextSpanner.style
  s32 s8..\cresc s2 |
  s2 s8. s16\! |
  s2\f s4-\tweak Y-offset 1.5 \dim |
  s2 s8. s16\! |
  
  \barNumberCheck 81
  s4 s\< s\! |
  s2\> s8. s16\! |
  % like 56 (to 69)
  s2^\pEspress s8 s\<
  s4 s\! s\> |
  s4 s\! s\pp |
  s2. |
  s8 s\< s\! s4. |
  s2.\< |
  
  \barNumberCheck 89
  s4\! s2\f |
  \override DynamicTextSpanner.style = #'none
  s4 s2\dim 
  s2\!^\dolce s4\< |
  s4 s\! s\cresc |
  s2 s4\f |
  s2. |
  s8 s\dim s2 |
  s2. |
  
  \barNumberCheck 97
  \revert DynamicTextSpanner.style
  s2\p s4\cresc |
  s2. * 2 |
  s2 s8. s16\! |
  % key of c minor
  s2.\ff |
  s2. * 3 |
  
  \barNumberCheck 105
  s2. * 3 |
  s8 s\< s4. s8\! |
  s2.\f |
  s4. s\cresc |
  s2. * 2 |
  
  \barNumberCheck 113
  s2. |
  s2 s8. s16\! |
  s2.-\tweak Y-offset 1 \ff |
  s8 s\fff\> s2 |
  s2.\! |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \tempo "Allegro maestoso." 4 = 66
  s2. * 2 |
  \repeat volta 2 {
    s2. * 6 |
    
    \barNumberCheck 9
    s2. * 8 |
    
    \barNumberCheck 17
    s2. * 2 |
  }
  \repeat volta 2 {
    \tempo 4 = 80
    s2. * 6 |
    
    \barNumberCheck 25
    s2. * 8 |
    
    \barNumberCheck 33
    s2. * 2 |
    s4 \tempo 4 = 76 s2 |
    \tempo 4 = 72
    s2. |
    \tempo 4 = 69
    s2. |
    \tempo 4 = 66
    s2. |
    \tempo 4 = 63
    s2. |
    \tempo 4 = 66
    s2. |
    
    \barNumberCheck 41
    s2. * 8 |
    
    \barNumberCheck 49
    s2. * 7 |
  }
  % key of af major
  \tempo 4 = 76
  s2. |
  
  \barNumberCheck 57
  s2. * 8 |
  
  \barNumberCheck 65
  s2. * 8 |
  
  \barNumberCheck 73
  s2. * 8 |
  
  \barNumberCheck 81
  s4 \tempo 4 = 60 s2 |
  \tempo 4 = 40
  s4. \tempo 4 = 60 s |
  \tempo 4 = 76
  s2. * 6 |
  
  \barNumberCheck 89
  s2. * 8 |
  
  \barNumberCheck 97
  s2. * 2  |
  \tempo 4 = 72
  s2. |
  \tempo 4 = 69
  s2. |
  % key of c minor
  \tempo 4 = 66
  s2. * 4 |
  
  \barNumberCheck 105
  s2. * 8 |
  
  \barNumberCheck 113
  s2. |
  s4 \tempo 4 = 60 s2 |
  \tempo 4 = 56
  s2. |
  \tempo 4 = 52
  s2. |
  \tempo 4 = 40
  s2. |
}

pedal = {
  s2.-\tweak Y-offset 5 \sd |
  s2. |
  \repeat volta 2 {
    \tag layout { s4 } \tag midi { s4\sd } s8 s4.\su |
    s4 s2\sd |
    s8 s\su s2 |
    s4 s2\sd |
    s8 s\su s4. s8\sd |
    s8 s\su s2 |
    
    \barNumberCheck 9
    s2. * 2 |
    s4.-\tweak Y-offset -1 \sd s\su |
    s2 s4-\tweak Y-offset 1 \sd |
    s4. s\su |
    s4 s8-\tweak X-offset 0.5 -\tweak Y-offset 1 \sd s4.-\tweak X-offset 1
      -\tweak Y-offset 1 \su |
    s4.\sd s\su |
    s2. |
    
    \barNumberCheck 17
    s2. * 2 |
  }
  \repeat volta 2 {
    s2-\tweak X-offset -4 -\tweak Y-offset -3 \sd s8 s\su |
    s8.\sd s16\su s2 |
    s2\sd s8 s\su |
    s8.\sd s16\su s2 |
    s4\sd s8. s16\su s4 |
    s2\sd s16 s8.\su |
    
    \barNumberCheck 25
    s2\sd s16 s8.\su |
    s4-\tweak Y-offset -4 \sd s16 s8.-\tweak Y-offset -3 \su s4 |
    s4\sd s16 s8.\su s4 |
    s2-\tweak Y-offset -4 \sd s8. s16-\tweak Y-offset -3 \su |
    s4.-\tweak Y-offset -2 \sd s\su |
    s4.-\tweak Y-offset -2 \sd s\su |
    s4.\sd s\su |
    s2\sd s4\su |
    
    \barNumberCheck 33
    s4.\sd s\su |
    s2.\sd |
    s2. |
    s2 s8 s\su |
    s2. * 3 |
    % like bar 3
    s8. s16\sd s8 s\su s4 |
    
    \barNumberCheck 41
    s4 s2\sd |
    s8 s-\tweak Y-offset 2 \su s2 |
    s4 s2-\tweak Y-offset 1 \sd |
    s8 s\su s4. s8\sd |
    s8 s\su s2 |
    s2. * 2 |
    % like 11?
    s4.-\tweak Y-offset -1 \sd s\su |
    
    \barNumberCheck 49
    s2 s4-\tweak Y-offset 1 \sd |
    s4. s-\tweak Y-offset 1 \su |
    s4 s8\sd s4.\su |
    s2. * 4 |
  }
  % key of af major
  s4-\tweak Y-offset -2 \sd s16 s8.\su s8\sd s\su |
  
  \barNumberCheck 57
  s8\sd s\su s\sd s\su s4\sd |
  s8 s\su s4 s\sd |
  s4\su s2\sd |
  s8\su s4. s4\sd |
  s8 s\su s2 |
  s2. * 2 |
  s4.\sd s\su |
  
  \barNumberCheck 65
  s2 s4\sd |
  s8 s\su s\sd s\su s4\sd |
  s4\su s2\sd |
  s2\su s4\sd |
  s2.\su |
  s2. * 3 |
  
  \barNumberCheck 73
  s2. * 8 |
  
  \barNumberCheck 81
  s2.\sd |
  s8 s\su s2 |
  % like 56 (to 69)
  s4-\tweak Y-offset -2 \sd s16 s8.\su s8\sd s\su |
  s8\sd s\su s\sd s\su s4\sd |
  s8 s\su s4 s\sd |
  s4\su s2\sd |
  s8\su s4. s4\sd |
  s8 s\su s2 |
  
  \barNumberCheck 89
  s2. * 2 |
  s4.\sd s\su |
  s2 s4\sd |
  s8 s\su s\sd s\su s4\sd |
  s4\su s2\sd |
  s2\su s4\sd |
  s2.\su |
  
  \barNumberCheck 97
  s2. * 4 |
  % key of c minor
  s8 s4\sd s4.\su |
  s4 s2\sd |
  s2.-\tweak Y-offset 2 \su |
  s4 s2-\tweak Y-offset 1 \sd |
  
  \barNumberCheck 105
  % like 7? (to 15)
  s8 s\su s4. s8\sd |
  s8 s\su s2 |
  s2. * 3 |
  s2 s4\sd |
  s4. s\su |
  s4 s8-\tweak X-offset 0 \sd s4.-\tweak X-offset 0 \su |
  
  \barNumberCheck 113
  s4.\sd s\su |
  s2. * 2 |
  s8 s\sd s8 s4.\su |
  s2. |
}

forceBreaks = {
  % page 1
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 4 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 4 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 2
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 3
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 4
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 5
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 4 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 6
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
}

polonaiseTwoNotes =
\score {
  \header {
    title = "Polonaise Two"
    composer = "Frédéric Chopin"
    opus = "Opus 40, No. 2"
  }
  \keepWithTag layout  
  \new PianoStaff \with {
    \consists Span_arpeggio_engraver
    connectArpeggios = ##t
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
    \new Dynamics \tempi
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

polonaiseTwoMidi =
\book {
  \bookOutputName "polonaise-op40-no2"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
