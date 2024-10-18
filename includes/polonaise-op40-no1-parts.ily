%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

#(ly:expect-warning-times 8 "cyclic dependency")

%%% Positions and shapes %%%

slurShapeA = \shape #'((0 . 0) (0 . 0) (8 . 2) (8 . 2)) \etc
slurShapeB = \shape #'((0 . 0) (0 . 0) (4 . -0.5) (4 . -1)) \etc
slurShapeC = \shape #'((0 . 0) (0 . 0) (4 . -0.5) (4 . -1)) \etc
slurShapeD = \shape #'((0 . 0) (0 . 0) (4 . 0) (4 . -1)) \etc
slurShapeE = \shape #'((0 . 0) (0 . 0) (4 . 0) (4 . -1)) \etc
slurShapeF = \shape #'(
                        ((0.25 . 0) (1.5 . 0.5) (0.5 . 3) (0 . 3.5))
                        ((0.25 . 3.25) (-0.75 . 2.75) (-2 . 0.25) (-1.25 . -0.5))
                      ) \etc
slurShapeG = \shape #'(
                        ((0 . 0.5) (0 . 0.25) (0 . 0.25) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                      ) \etc
slurShapeH = \shape #'(
                        ((0.25 . 1) (0.25 . 1.5) (0 . 1.5) (0 . 2))
                        ((0 . 3.25) (-0.5 . 2.75) (-1.5 . 1.25) (-1 . 0.5))
                      ) \etc
slurShapeI = \shape #'(
                        ((1.25 . 0.7) (1.75 . -2.25) (0.25 . -3.25) (-0.25 . -4))
                        ((0.25 . -4) (-0.5 . -3) (-1.5 . -1) (-1 . 0.25))
                        ) \etc

% Control the placement of accidentals in chordA and chordB
moveAccidentalA = \override Accidental.X-offset = -2.5
moveAccidentalB = \override Accidental.X-offset = -1.25
moveAccidentalC = \override Accidental.X-offset = -3.25
moveAccidentalD = \override Accidental.X-offset = -1.5

chordA = {
  <
    cs'
    \single \moveAccidentalA ds 
    \single \moveAccidentalB fss 
    \single \moveAccidentalC as 
    \single \moveAccidentalD ds
  >8
}

chordB = {
  <
    cs
    \single \moveAccidentalA ds 
    \single \moveAccidentalB fss 
    \single \moveAccidentalC as 
    \single \moveAccidentalD ds
  >8
}

%%% Music %%%

global = {
  \time 3/4
  \key a \major
}

rightHand = \relative {
  \global
  \repeat volta 2 {
    <a cs a'>8[ r16 <cs e>]  q8[ r16 q]-.  <d fs>-. <d gs>-. <d a'>-. 
      <d b'>-. |
    <cs cs'>8.->( <cs a'>16)  q8-.\noBeam \staffDown \voiceOne \tuplet 3/2 { 
      gs16( a b } a8-.) e-. |
    \staffUp \oneVoice <cs' cs'>8[ r16 <cs a'>]  q8[ r16 <cs gs'>]-.  <cs a'>-.
      <cs a' b>-. <cs a' cs>-. <d a' d>-. |
    <ds a' fs'>8.->( <e a e'>16) q8-.\noBeam \staffDown \voiceOne \tuplet 3/2 {
      gs,16( a b! } a8-.) e-. |
    \staffUp \oneVoice <cs'' es cs'>8-.\noBeam \tuplet 3/2 { <gs cs gs'>16-.(
      q-. q-. } q8-. q-.)  <as ds as'>16-. <bs bs'>-. <cs gs' cs>-.
      <ds ds'>-. |
    <es cs' es>8.->( <cs cs'>16)  q8-. q16-. q-.  q-. q-. q-. q-. |
    q8-! <b fs' b>16.( q32  q8 <cs cs'>)  <e a e'>8( <d d'>16 <cs cs'>) |
    <b b'>8-. <b e b'>16.( <cs cs'>32)  <b e b'>4( <a a'>8) r |
  }
  
  \barNumberCheck 9
  \repeat volta 2 {
    \omit TupletBracket
    <a b ds fs b>8[-> r16 <a b ds fs>]  q8-. \staffDown \voiceOne
      \tuplet 3/2 { as,16[( b cs } b8-.]) \staffUp \oneVoice <gs' e' gs>-. |
    <a b ds fs b>8-.-> \tuplet 3/2 { <a b ds fs>16-.[( q-. q-.] }  q8-.)
      \staffDown \voiceOne \tuplet 3/2 { as,16[( b cs } b8-.]) \staffUp
      \oneVoice <gs' ds' gs>( |
    <e gs cs e>8-.) q16-. q-.  <a cs a'>8( <gs cs gs'> <fs cs' fs>)
      <fs gs bs ds gs>-> |
    <e gs cs e>8-> \chordB -> <bs ds gs bs>->\noBeam <ds ds'>16-. q-.
      q-. q-. q-. q-. |
    \chordA [ r16 <as cs ds as'>]  q8-. \tuplet 3/2 { css,16[( ds
      es } ds8-.])  <bs' ds gs bs>-. |
    \chordB -.-> \tuplet 3/2 { <as cs ds as'>16-.[( q-. q-.] } q8-.)
      \tuplet 3/2 { css,16[( ds es } ds8-.])  <bs' ds gs bs>-. |
    <cs! fs cs'!>8-. \tuplet 3/2 { <fs, cs' fs>16-.[( q-. q-.] } q8)
      <gs cs e gs>( <a! cs e a!> <a b ds b'>) |
    \stemDown <e gs e'>8-. <e a e'>16. <e e'>32 
      <<
        { 
          s8 \slurUp \acciaccatura { e' } <d,! d'!>16( <cs cs'>) s8
            \acciaccatura { d' } cs16( b) 
        }
        \\
        { <e, a e'>8 a <d, e gs d'> <d e gs> }
      >> |
      
    \barNumberCheck 17
    % like bar 1 (8 bars)
    \stemNeutral
    <a cs a'>8[^\aTempo r16 <cs e>]  q8[ r16 q]-.  <d fs>-. <d gs>-. <d a'>-. 
      <d b'>-. |
    <cs cs'>8.->( <cs a'>16)  q8-.\noBeam \staffDown \voiceOne \tuplet 3/2 { 
      gs16( a b } a8-.) e-. |
    \staffUp \oneVoice <cs' cs'>8[ r16 <cs a'>]  q8[ r16 <cs gs'>]-.  <cs a'>-.
      <cs a' b>-. <cs a' cs>-. <d a' d>-. |
    <ds a' fs'>8.->( <e a e'>16) q8-.\noBeam \staffDown \voiceOne \tuplet 3/2 {
      gs,16( a b! } a8-.) e-. |
    \staffUp \oneVoice <cs'' es cs'>8-.\noBeam \tuplet 3/2 { <gs cs gs'>16-.(
      q-. q-. } q8-. q-.)  <as ds as'>16-. <bs bs'>-. <cs gs' cs>-.
      <ds ds'>-. |
    <es cs' es>8.->( <cs cs'>16)  q8-. q16-. q-.  q-. q-. q-. q-. |
    q8-! <b fs' b>16.( q32  q8 <cs cs'>)  <e a e'>8( <d d'>16 <cs cs'>) |
    <b b'>8-. <b e b'>16.( <cs cs'>32)  <b e b'>4( <a a'>8) r |
  }
  
  \barNumberCheck 25
  \key d \major
  \repeat volta 2 {
    \grace { s8 }
    <<
      { \grace { s8 } d2->( a4 | }
      
      % ossia
      \new Staff \with {
        \remove Time_signature_engraver
        \override BarLine.allow-span-bar = ##f
        alignAboveContext = "upper"
        \magnifyStaff #2/3
        firstClef = ##f
        \override VerticalAxisGroup.staff-staff-spacing = 
          #'((basic-distance . 0) 
            (minimum-distance . 0)
            (padding . 1)
            (stretchability . 0))
      }
      { \slurUp \acciaccatura { d,8 } d'2->-\slurShapeA (^\secondVolta a4) | }
    >>
    d,8)[ r16 a](  d2) |
    a'2->( e4 |
    \clef bass a,8-.)[ r16 e16]( a2) |
    \clef treble b8-. \tuplet 3/2 { <d g b>16[( b <d g b>]~ } <b d g b>8-.)
      <cs fs as cs> <d fs b d> <e a cs e> |
    \tupletUp <fs a d fs>8-. \tuplet 3/2 { <a d fs>16[( fs <a d fs>]~ }
      <fs a d fs>8-.) <gs cs es gs> <a cs fs a> <b e gs b> \tupletNeutral |
    <cs g'! a cs>8-.\noBeam <cs g' cs>16-. q-.  q8-. <cs g' b>16-. < cs g' a>-.
      <d fs d'>8-. <ds\=1_( a' ds\=2(>->~ |
    <e\=1) a e'\=2)>8-.\noBeam \ottava 1 <a a'>16-. q-.  q8-. <gs gs'>16-.
      < a a'>-.  <as as'>-. <b b'>-. <bs bs'>-. <cs cs'>-. |
      
    \barNumberCheck 33
    <d d'>2->( <a a'>4 |
    \ottava 0 <d, d'>8)[ r16 <a a'>](  <d d'>2) |
    <a' a'>2->( <e e'>4 |
    <a, a'>8)[ r16 <e e'>]( <a a'>2) |
    <a ef' a>8-. q16-. q-.  q8-. <a ef' g>16( <a ef' a> 
      << { \voiceOne  bf'4) } \new Voice { \voiceFour <bf, d>8 q } >> |
    \oneVoice <b! f' b!>8-. q16-. q-.  q8-. <b f' a>16( <b f' b>
      << { \voiceOne c'4) } \new Voice { \voiceFour <c, e>8 q } >> |
    \oneVoice <cs! g' cs!>8-. q16( <d g d'>)  <e g e'>8-. <cs g' cs>16( <d d'>
      <e e'> <fs fs'> <g g'> <gs gs'> |
    \ottava 1 <a a'>16 <as as'> <b b'> <cs cs'>)  <e a e'>4( <d d'>8)
      \ottava 0 r |
  }
  
  \barNumberCheck 41
  \repeat volta 2 {
    \staffDown \voiceOne cs,,,2~\startTrillSpan  cs8-\slurShapeB (
      \stopTrillSpan bs32 cs d e) |
    \staffUp \oneVoice r8 <d'' g d'>16-. q-.  q8-. q-. q-. q-. |
    \staffDown \voiceOne d,,2~\startTrillSpan  d8-\slurShapeC (\stopTrillSpan
      cs32 d e f) |
    \staffUp \oneVoice r8 <d'' gs d'>16-. q-.  q8-. q-. q-. q-. |
    \staffDown \voiceOne d,,2-\slurShapeD (\startTrillSpan  cs16\stopTrillSpan
      d es fs) |
    \staffUp \oneVoice r8 <d'' fs d'>16-. q-.  q8-. q-. \staffDown \voiceOne 
      cs,,16-\slurShapeE ( d fs g) |
    \staffUp \oneVoice r8 <d'' g d'>16-. q-. q8-.\noBeam <d e gs d' e>16( q
      q8 q) |
    <a' cs a'>8-.\noBeam \clef bass b,,!->\startTrillSpan a-> g!-> fs->
      \afterGrace e-> { d16(\stopTrillSpan e) } |
    
    \barNumberCheck 49
    % like 25 (8 bars)
    \clef treble \acciaccatura { \slurUp d'8*1/4 } d'2->( a4 |
    d,8)[ r16 a](  d2) |
    a'2->( e4 |
    \clef bass a,8-.)[ r16 e16]( a2) |
    \clef treble b8-. \tuplet 3/2 { <d g b>16[( b <d g b>]~ } <b d g b>8-.)
      <cs fs as cs> <d fs b d> <e a cs e> |
    <fs a d fs>8-. \tuplet 3/2 { <a d fs>16[( fs <a d fs>]~ } <fs a d fs>8-.)
      <gs cs es gs> <a cs fs a> <b e gs b> |
    <cs g'! a cs>8-.\noBeam <cs g' cs>16-. q-.  q8-. <cs g' b>16-. < cs g' a>-.
      <d fs d'>8-. <ds\=1 -\slurShapeF _( a' ds -\slurShapeG \=2(>->~ |
    <e\=1) a e'\=2)>8-.\noBeam \ottava 1 <a a'>16-. q-.  q8-. <gs gs'>16-.
      < a a'>-.  <as as'>-. <b b'>-. <bs bs'>-. <cs cs'>-. |
      
    \barNumberCheck 57
    % like 33 (8 bars)
    <d d'>2->( <a a'>4 |
    \ottava 0 <d, d'>8)[ r16 <a a'>](  <d d'>2) |
    <a' a'>2->( <e e'>4 |
    <a, a'>8)[ r16 <e e'>]( <a a'>2) |
    <a ef' a>8-. q16-. q-.  q8-. <a ef' g>16( <a ef' a> 
      << { \voiceOne  bf'4) } \new Voice { \voiceFour <bf, d>8 q } >> |
    \oneVoice <b! f' b!>8-. q16-. q-.  q8-. <b f' a>16( <b f' b>
      << { \voiceOne c'4) } \new Voice { \voiceFour <c, e>8 q } >> |
    \oneVoice <cs! g' cs!>8-. q16( <d g d'>)  <e g e'>8-. <cs g' cs>16( <d d'>
      <e e'> <fs fs'> <g g'> <gs gs'> |
    \ottava 1 <a a'>16 <as as'> <b b'> <cs cs'>)  <e a e'>4( <d d'>8)
      \ottava 0 r |
  }
        
  \barNumberCheck 65
  % like bar 1 (8 bars)
  \key a \major
  <a,, cs a'>8[ r16 <cs e>]  q8[ r16 q]-.  <d fs>-. <d gs>-. <d a'>-. 
    <d b'>-. |
  <cs cs'>8.->( <cs a'>16)  q8-.\noBeam \staffDown \voiceOne \tuplet 3/2 { 
    gs16( a b } a8-.) e-. |
  \staffUp \oneVoice <cs' cs'>8[ r16 <cs a'>]  q8[ r16 <cs gs'>]-.  <cs a'>-.
    <cs a' b>-. <cs a' cs>-. <d a' d>-. |
  <ds a' fs'>8.->( <e a e'>16) q8-.\noBeam \staffDown \voiceOne \tuplet 3/2 {
    gs,16( a b! } a8-.) e-. |
  \staffUp \oneVoice <cs'' es cs'>8-.\noBeam \tuplet 3/2 { <gs cs gs'>16-.(
    q-. q-. } q8-. q-.)  <as ds as'>16-. <bs bs'>-. <cs gs' cs>-.
    <ds ds'>-. |
  <es cs' es>8.->( <cs cs'>16)  q8-. q16-. q-.  q-. q-. q-. q-. |
  q8-! <b fs' b>16.( q32  q8 <cs cs'>)  <e a e'>8( <d d'>16 <cs cs'>) |
  <b b'>8-. <b e b'>16.( <cs cs'>32)  <b e b'>4( <a a'>8) r |
  \bar "||"
  
  \barNumberCheck 73
  % like 9 (8 bars)
  <a b ds fs b>8[-> r16 <a b ds fs>]  q8-. \staffDown \voiceOne
    \tuplet 3/2 { as,16[( b cs } b8-.]) \staffUp \oneVoice <gs' e' gs>-. |
  <a b ds fs b>8-.-> \tuplet 3/2 { <a b ds fs>16-.[( q-. q-.] }  q8-.)
    \staffDown \voiceOne \tuplet 3/2 { as,16[( b cs } b8-.]) \staffUp
    \oneVoice <gs' ds' gs>( |
  <e gs cs e>8-.) q16-. q-.  <a cs a'>8( <gs cs gs'> <fs cs' fs>)
    <fs gs bs ds gs>-> |
  <e gs cs e>8-> \chordB -> <bs ds gs bs>->\noBeam <ds ds'>16-. q-.
    q-. q-. q-. q-. |
  \chordA [ r16 <as cs ds as'>]  q8-. \tuplet 3/2 { css,16[( ds
    es } ds8-.])  <bs' ds gs bs>-. |
  \chordB -.-> \tuplet 3/2 { <as cs ds as'>16-.[( q-. q-.] } q8-.)
    \tuplet 3/2 { css,16[( ds es } ds8-.])  <bs' ds gs bs>-. |
  <cs! fs cs'!>8-. \tuplet 3/2 { <fs, cs' fs>16-.[( q-. q-.] } q8)
    <gs cs e gs>( <a! cs e a!> <a b ds b'>) |
  \stemDown <e gs e'>8-. <e a e'>16. <e e'>32 
    <<
      { 
        s8 \slurUp \acciaccatura { e' } <d,! d'!>16( <cs cs'>) s8
          \acciaccatura { d' } cs16( b) 
      }
      \\
      { <e, a e'>8 a <d, e gs d'> <d e gs> }
    >> |
  
  \barNumberCheck 81
  % like 17 (8 bars)
  \stemNeutral
  <a cs a'>8[^\aTempo r16 <cs e>]  q8[ r16 q]-.  <d fs>-. <d gs>-. <d a'>-. 
    <d b'>-. |
  <cs cs'>8.->( <cs a'>16)  q8-.\noBeam \staffDown \voiceOne \tuplet 3/2 { 
    gs16( a b } a8-.) e-. |
  \staffUp \oneVoice <cs' cs'>8[ r16 <cs a'>]  q8[ r16 <cs gs'>]-.  <cs a'>-.
    <cs a' b>-. <cs a' cs>-. <d a' d>-. |
  <ds a' fs'>8.->( <e a e'>16) q8-.\noBeam \staffDown \voiceOne \tuplet 3/2 {
    gs,16( a b! } a8-.) e-. |
  \staffUp \oneVoice <cs'' es cs'>8-.\noBeam \tuplet 3/2 { <gs cs gs'>16-.(
    q-. q-. } q8-. q-.)  <as ds as'>16-. <bs bs'>-. <cs gs' cs>-.
    <ds ds'>-. |
  <es cs' es>8.->( <cs cs'>16)  q8-. q16-. q-.  q-. q-. q-. q-. |
  q8-! <b fs' b>16.( q32  q8 <cs cs'>)  <e a e'>8( <d d'>16 <cs cs'>) |
  <b b'>8-. <b e b'>16.( <cs cs'>32)  <b e b'>4( <a a'>8) r |
  \bar "|."
}

leftHand = \relative {
  \global
  \clef bass
  \repeat volta 2 {
    <a,, a'>8[ r16 <a' e' a>]  q8[ r16 q]-.  <a e' b'>-. q-. q-. q-. |
    <a e' a>8.-> q16  q8-.\noBeam \voiceTwo \tuplet 3/2 { gs16( a b } a8-.)
      e-. |
    \oneVoice <a, a'>8[ r16 <a' e' a>]  q8[ r16 q]-.  q-. q-. q-. <a e' b'>-. |
    <a ds fs bs>8.->(\arpeggio <e' a cs>16)  q8-.\noBeam \voiceTwo 
      \tuplet 3/2 { gs,16( a b! } a8-.) e-. |
    \oneVoice <gs, gs'>8-.\noBeam \tuplet 3/2 { <es'' gs cs es>16-.( q-. q-. }
      q8-. q8-.)  <fs gs bs ds>[ <gs,, gs'>] |
    <cs, cs'>8.-> <cs'' cs'>16  q8-. q16-. q-.  q-. q-. q-. q-. |
    q8-! <d fs b>16.( q32  q8 <e gs cs>) << { e'( d) } \\ { <fs, a>4 } >> |
    <e gs d'>8-. <e gs d' e>-.  q4( <a cs e>8) r |
  }
  
  \barNumberCheck 9
  \repeat volta 2 {
    \omit TupletBracket    
    <b,, b'>8[-> r16 <b' b'>]  q8-. \voiceTwo \tuplet 3/2 { as16[( b cs } 
      b8-.])  \oneVoice <e, e'>-. |
    <b b'>8-.-> \tuplet 3/2 { <b' b'>16-.[( q-. q-.] }  q8-.) \voiceTwo 
    \tuplet 3/2 { as16[( b cs }  b8-.]) \oneVoice <b, b'>( |
    <cs cs'>8-.) q16-. q-.  <fs, fs'>8( <gs gs'> <a a'>) <gs gs'>-> |
    <cs cs'>8-> <ds ds'>-> <gs ds' gs>->\noBeam <ds ds'>16-. q-.  q-. q-. q-.
      q-. |
    <ds, ds'>8[ r16 <fss'' as cs ds fss>]  q8-. \tuplet 3/2 { css16[( ds es }
      ds8-.])  <gs,, gs'>-. |
    <ds ds'>-.-> \tuplet 3/2 { <fss'' as cs ds fss>16-.[( q-. q-.] } q8-.)
      \tuplet 3/2 { css16[( ds es } ds8-.])  <gs,, gs'>-. |
    <a! a'!>8 \tuplet 3/2 { <a' a'>16-.[( q-. q-.] }  q8-.) <gs gs'>( <fs fs'>
      <b, b'>) |
    <e e'>-. <cs cs'> <fs fs'> <b, b'> <e e'> <e, e'> |
    
    \barNumberCheck 17
    % like bar 1 (8 bars)
    <a a'>8[ r16 <a' e' a>]  q8[ r16 q]-.  <a e' b'>-. q-. q-. q-. |
    <a e' a>8.-> q16  q8-.\noBeam \voiceTwo \tuplet 3/2 { gs16( a b } a8-.)
      e-. |
    \oneVoice <a, a'>8[ r16 <a' e' a>]  q8[ r16 q]-.  q-. q-. q-. <a e' b'>-. |
    <a ds fs bs>8.->(\arpeggio <e' a cs>16)  q8-.\noBeam \voiceTwo
      \tuplet 3/2 { gs,16( a b! } a8-.) e-. |
    \oneVoice <gs, gs'>8-.\noBeam \tuplet 3/2 { <es'' gs cs es>16-.( q-. q-. }
      q8-. q8-.)  <fs gs bs ds>[ <gs,, gs'>] |
    <cs, cs'>8.-> <cs'' cs'>16  q8-. q16-. q-.  q-. q-. q-. q-. |
    q8-! <d fs b>16.( q32  q8 <e gs cs>) << { e'( d) } \\ { <fs, a>4 } >> |
    <e gs d'>8-. <e gs d' e>-.  q4~_( <a cs e>8) r |
  }
  
  \barNumberCheck 25
  \key d \major
  \repeat volta 2 {
    \grace { s4 }
    <d,,, d'>8-.\noBeam <fs'' a d>16-. q-.  q8-. q-. <g a cs>-. q-. |
    <d,, d'>8-.\noBeam <d'' fs>16-. q-.  q8-. <fs a>-._\> < e g a>-. 
      <d fs a>-.\! |
    <a, a'>8-.\noBeam <cs' e a>16-. q-.  q8-. q-. <b d a'>-. q-. |
    <a, a'>8-.\noBeam <a' cs>16-. q-.  q8-. <cs e>-. <b d e>-. <a cs e>-. |
    <g, g'>8-.\noBeam <g' g'>16 q  q8-. <fs fs'> <b, b'> <a a'> |
    <d, d'>8-.\noBeam <d'' d'>16 q  q8-. <cs cs'> <fs, fs'> <e e'> |
    <a, a'>8-.\noBeam \clef treble <a'' e' g a>16-. q-.  q8-. q16-. q-.
      <a fs' a>8-. <a\=1( bs\=2( fs'\=3^( a\=4^(>-> |
    <a\=1) cs\=2) g'\=3) a\=4)>8-.\noBeam \clef bass <a,, a'>16-. q16-.  q8-.
      <bf bf'>16-. <a a'>-.  <gs gs'>-. <g g'>-. <fs fs'>-. <e e'>-. |
      
    \barNumberCheck 33
    <d d'>8-.\noBeam <fs'' a d>16-. q-.  q8-. q <g a cs>-. q-. |
    <d, d'>-.\noBeam <d' fs d'>16-. q-.  q8-. <fs a d>-._\> <e g d'>-.
      <d fs d'>-.\! |
    <a, a'>8-.\noBeam <cs' e a>16-. q-.  q8-. q-. <d e gs>-. q-. |
    <a, a'>8-.\noBeam <cs' e a>16-. q-.  q8-. q-._\> <b d a'>-. <a cs a'>-.\! |
    <f, f'>8-.\noBeam <f'' c' f>16-. q-.  q8-. q16 q  <bf f'>8-. <bf,, bf'> |
    <g g'>8-.\noBeam <g'' d' g>16-. q-.  q8-. q16 q  <c g'>8-. <c,, c'> |
    <a a'>8-.\noBeam \clef treble <a'' cs e g a>16 q  q8-. q16 q  q8-. q16 q |
    q8-. <a e' g a>-.  q4^~( <d fs a>8) r |
  }
  
  \barNumberCheck 41
  \repeat volta 2 {
    \clef bass \voiceTwo cs,,2~\startTrillSpan cs8(\stopTrillSpan bs32 cs d e |
    \oneVoice <bf bf'>8-!)\noBeam <d' g d'>16-. q-.  q8-. q-. q-. q-. |
    \voiceTwo d,2~\stopTrillSpan d8(\stopTrillSpan cs32 d e f |
    \oneVoice <b, b'>8-!)\noBeam <d' gs d'>16-. q-.  q8-. q-. q-. q-. |
    \voiceTwo d,2(\startTrillSpan cs16\stopTrillSpan d es fs |
    \oneVoice <c c'>8-!)\noBeam <d' fs d'>16-. q-.  q8-. q-.  \voiceTwo cs,16(
      d fs g |
    \oneVoice <b, b'>8-!)\noBeam <d' g d'>16-. q-. q8\noBeam <bf, bf'>16 q
      q8 q |
    <a a'>8-.\noBeam <b! b'!>-> <a a'>-> <g! g'!>-> <fs fs'>-> <e e'>-> |
    
    \barNumberCheck 49
    % like 25 (8 bars)
    <d d'>8-.\noBeam <fs'' a d>16-. q-.  q8-. q-. <g a cs>-. q-. |
    <d,, d'>8-.\noBeam <d'' fs>16-. q-.  q8-. <fs a>-._\> < e g a>-. 
      <d fs a>-.\! |
    <a, a'>8-.\noBeam <cs' e a>16-. q-.  q8-. q-. <b d a'>-. q-. |
    <a, a'>8-.\noBeam <a' cs>16-. q-.  q8-. <cs e>-. <b d e>-. <a cs e>-. |
    <g, g'>8-.\noBeam <g' g'>16 q  q8-. <fs fs'> <b, b'> <a a'> |
    <d, d'>8-.\noBeam <d'' d'>16 q  q8-. <cs cs'> <fs, fs'> <e e'> |
    <a, a'>8-.\noBeam \clef treble <a'' e' g a>16-. q-.  q8-. q16-. q-.
      <a fs' a>8-. <a bs\=1 -\slurShapeH ( fs'\=2 -\slurShapeI ^( a>~-> |
    <a cs\=1) g'\=2) a>8-.\noBeam \clef bass <a,, a'>16-. q16-.  q8-. 
      <bf bf'>16-. <a a'>-.  <gs gs'>-. <g g'>-. <fs fs'>-. <e e'>-. |
      
    \barNumberCheck 57
    % like 33 (8 bars)
    <d d'>8-.\noBeam <fs'' a d>16-. q-.  q8-. q <g a cs>-. q-. |
    <d, d'>-.\noBeam <d' fs d'>16-. q-.  q8-. <fs a d>-._\> <e g d'>-.
      <d fs d'>-.\! |
    <a, a'>8-.\noBeam <cs' e a>16-. q-.  q8-. q-. <d e gs>-. q-. |
    <a, a'>8-.\noBeam <cs' e a>16-. q-.  q8-. q-._\> <b d a'>-. <a cs a'>-.\! |
    <f, f'>8-.\noBeam <f'' c' f>16-. q-.  q8-. q16 q  <bf f'>8-. <bf,, bf'> |
    <g g'>8-.\noBeam <g'' d' g>16-. q-.  q8-. q16 q  <c g'>8-. <c,, c'> |
    <a a'>8-.\noBeam \clef treble <a'' cs e g a>16 q  q8-. q16 q  q8-. q16 q |
    q8-. <a e' g a>-.  q4^~( <d fs a>8) r |
  }
  
  \barNumberCheck 65
  % like bar 1 (8 bars)
  \key a \major
  \clef bass <a,, a'>8[ r16 <a' e' a>]  q8[ r16 q]-.  <a e' b'>-. q-. q-. q-. |
  <a e' a>8.-> q16  q8-.\noBeam \voiceTwo \tuplet 3/2 { gs16( a b } a8-.)
    e-. |
  \oneVoice <a, a'>8[ r16 <a' e' a>]  q8[ r16 q]-.  q-. q-. q-. <a e' b'>-. |
  <a ds fs bs>8.->(\arpeggio <e' a cs>16)  q8-.\noBeam \voiceTwo 
    \tuplet 3/2 { gs,16( a b! } a8-.) e-. |
  \oneVoice <gs, gs'>8-.\noBeam \tuplet 3/2 { <es'' gs cs es>16-.( q-. q-. }
    q8-. q8-.)  <fs gs bs ds>[ <gs,, gs'>] |
  <cs, cs'>8.-> <cs'' cs'>16  q8-. q16-. q-.  q-. q-. q-. q-. |
  q8-! <d fs b>16.( q32  q8 <e gs cs>) << { e'( d) } \\ { <fs, a>4 } >> |
  <e gs d'>8-. <e gs d' e>-.  q4~_( <a cs e>8) r |
  
  \barNumberCheck 73
  % like 9 (8 bars)
  <b,, b'>8[-> r16 <b' b'>]  q8-. \voiceTwo \tuplet 3/2 { as16[( b cs } 
    b8-.])  \oneVoice <e, e'>-. |
  <b b'>8-.-> \tuplet 3/2 { <b' b'>16-.[( q-. q-.] }  q8-.) \voiceTwo 
  \tuplet 3/2 { as16[( b cs }  b8-.]) \oneVoice <b, b'>( |
  <cs cs'>8-.) q16-. q-.  <fs, fs'>8( <gs gs'> <a a'>) <gs gs'>-> |
  <cs cs'>8-> <ds ds'>-> <gs ds' gs>->\noBeam <ds ds'>16-. q-.  q-. q-. q-.
    q-. |
  <ds, ds'>8[ r16 <fss'' as cs ds fss>]  q8-. \tuplet 3/2 { css16[( ds es }
    ds8-.])  <gs,, gs'>-. |
  <ds ds'>-.-> \tuplet 3/2 { <fss'' as cs ds fss>16-.[( q-. q-.] } q8-.)
    \tuplet 3/2 { css16[( ds es } ds8-.])  <gs,, gs'>-. |
  <a! a'!>8 \tuplet 3/2 { <a' a'>16-.[( q-. q-.] }  q8-.) <gs gs'>( <fs fs'>
    <b, b'>) |
  <e e'>-. <cs cs'> <fs fs'> <b, b'> <e e'> <e, e'> |
  
  \barNumberCheck 81
  % like 17 (8 bars)
  <a a'>8[ r16 <a' e' a>]  q8[ r16 q]-.  <a e' b'>-. q-. q-. q-. |
  <a e' a>8.-> q16  q8-.\noBeam \voiceTwo \tuplet 3/2 { gs16( a b } a8-.)
    e-. |
  \oneVoice <a, a'>8[ r16 <a' e' a>]  q8[ r16 q]-.  q-. q-. q-. <a e' b'>-. |
  <a ds fs bs>8.->(\arpeggio <e' a cs>16)  q8-.\noBeam \voiceTwo
    \tuplet 3/2 { gs,16( a b! } a8-.) e-. |
  \oneVoice <gs, gs'>8-.\noBeam \tuplet 3/2 { <es'' gs cs es>16-.( q-. q-. }
    q8-. q8-.)  <fs gs bs ds>[ <gs,, gs'>] |
  <cs, cs'>8.-> <cs'' cs'>16  q8-. q16-. q-.  q-. q-. q-. q-. |
  q8-! <d fs b>16.( q32  q8 <e gs cs>) << { e'( d) } \\ { <fs, a>4 } >> |
  <e gs d'>8-. <e gs d' e>-.  q4~_( <a cs e>8) r |
}

dynamics = {
  \override TextScript.Y-offset = -0.5
  \override Hairpin.to-barline = ##f
  \override Hairpin.after-line-breaking = ##f
  \repeat volta 2 {
    s4\f s8. s16\< s8. s16\! |
    s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
    s4\f s8. s16\< s8. s16\! |
    s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
    s2\ffz s4\< |
    s8.\! s16 s8 s\< s8. s16\! |
    s8 s\< s s\!  s8.-\tweak Y-offset 2 \> s16\! |
    s4 s\> s\! |
  }
  
  \barNumberCheck 9
  \repeat volta 2 {
    s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
    s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
    s8 s\< s4 s\! |
    s4. s8\< s8. s16\! |
    s4.\ffz \tuplet 3/2 { s8\> s16\! } s4 |
    s4. \tuplet 3/2 { s8\> s16\! } s4 |
    s8 s\< s4. s8\! |
    s4. s^\pocoRit |
    
    \barNumberCheck 17
    % like bar 1 (8 bars)
    s4\f s8. s16\< s8. s16\! |
    s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
    s4\f s8. s16\< s8. s16\! |
    s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
    s2\ffz s4\< |
    s8.\! s16 s8 s\< s8. s16\! |
    s8 s\< s s\!  s8.-\tweak Y-offset 2 \> s16\! |
    s4 s\> s\! |
  }
    
  \barNumberCheck 25
  \repeat volta 2 {
    \grace { s4 }
    s2.^\ffEnergico |
    s2. * 3 | 
    s4.\p s\< |
    s8\! s4\p s4.\< |
    s8\! s^\piuF s2 |
    s4. s8\< s8. s16\! |
    
    \barNumberCheck 33
    s2.\fff |
    s2. * 3 |
    s4\p s2\cresc |
    s2 s8. s16\! |
    s8\f s\< s\! s\p s4\< |
    s8. s16\! s4\fz\> s\! |
  }
  
  \barNumberCheck 41
  \repeat volta 2 {
    s2\f s8 s\< |
    s8\! s\< s4. s8\! |
    \tag layout { s2 } \tag midi { s2\f } s8 s\< |
    s8\! s\< s4. s8\! |
    \tag layout { s2 } \tag midi { s2\f } s8.\< s16\! |
    s8 s\< s s\! s4 |
    s8 s\< s4. s8\! |
    s8\fz s^\ritenEMoltoCresc s2 |
    
    \barNumberCheck 49
    % like 25 (8 bars)
    s2.^\ff |
    s2. * 3 | 
    s4.\p s\< |
    s8\! s4 s4.\< |
    s8\! s^\piuF s2 |
    s4. s8\< s8. s16\! |
    
    \barNumberCheck 57
    % like 33 (8 bars)
    s2.\fff |
    s2. * 3 |
    s4\p s2\cresc |
    s2 s8. s16\! |
    s8\f s\< s\! s\p s4\< |
    s8. s16\! s4\fz\> s\! |
  }
  
  \barNumberCheck 65
  % like bar 1 (8 bars)
  s4\f s8. s16\< s8. s16\! |
  s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
  s4\f s8. s16\< s8. s16\! |
  s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
  s2\ffz s4\< |
  s8.\! s16 s8 s\< s8. s16\! |
  s8 s\< s s\!  s8.-\tweak Y-offset 2 \> s16\! |
  s4 s\> s\! |
  
  \barNumberCheck 73
  % like 9 (8 bars)
  s4. \tuplet 3/2 { s8-\tweak Y-offset 1 \> s16\! } s4 |
  s4. \tuplet 3/2 { s8-\tweak Y-offset 1 \> s16\! } s4 |
  s8 s\< s4 s\! |
  s4. s8\< s8. s16\! |
  s4.\ffz \tuplet 3/2 { s8\> s16\! } s4 |
  s4. \tuplet 3/2 { s8\> s16\! } s4 |
  s8 s\< s4. s8\! |
  s4. s^\pocoRit |
  
  \barNumberCheck 81
  % like 17 (8 bars)
  s4\f s8. s16\< s8. s16\! |
  s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
  s4 s8. s16\< s8. s16\! |
  s4. \tuplet 3/2 { s8-\tweak Y-offset 2 \> s16\! } s4 |
  s2\ffz s4\< |
  s8.\! s16 s8 s\< s8. s16\! |
  s8 s\< s s\!  s8.-\tweak Y-offset 2 \> s16\! |
  s4 s\> s\! |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \repeat volta 2 {
    \tempo "Allegro con brio." 4 = 80
    s2. * 8 |
  }
  
  \barNumberCheck 9
  \repeat volta 2 {
    s2. * 7 |
    s4 \tempo 4 = 72 s \tempo 4 = 66 s |
    
    \barNumberCheck 17
    \tempo 4 = 80
    s2. * 8 |
  }
    
  \barNumberCheck 25
  \repeat volta 2 {
    \grace { s4 } 
    s2. * 8 |
    
    \barNumberCheck 33
    s2. * 8 |
  }
  
  \barNumberCheck 41
  \repeat volta 2 {
    s2. * 7 |
    \tempo 4 = 72
    s4 \tempo 4 = 66 s \tempo 4 = 60 s |
    
    \barNumberCheck 49
    \tempo 4 = 80
    s2. * 8 |
    
    \barNumberCheck 57
    s2. * 8 |
  }
  
  \barNumberCheck 65
  s2. * 8 |
  
  \barNumberCheck 73
  s2. * 7 |
  s4 \tempo 4 = 72 s \tempo 4 = 66 s |
  
  \barNumberCheck 81
  \tempo 4 = 80
  s2. * 8 |
}

pedal = {
  \repeat volta 2 {
    s4\sd s16 s8.\su s4 |
    s4\sd s2\su |
    s4\sd s16 s8.\su s4 |
    s8.\sd s16\su s2 |
    s4.-\tweak Y-offset -1 \sd s8\su s8.\sd s16\su |
    s2-\tweak X-offset -3 -\tweak Y-offset -3 \sd s8. s16\su |
    s8 s\sd s2\su |
    s4\sd s2\su |
  }
  
  \barNumberCheck 9
  \repeat volta 2 {
    s4-\tweak X-offset -3 \sd s2\su |
    s4-\tweak X-offset -3 \sd s2\su |
    s2. |
    s4 s\sd s8. s16\su |
    s4-\tweak Y-offset -3 -\tweak X-offset -4 \sd s2\su |
    s4-\tweak Y-offset -3 -\tweak X-offset -4 \sd s2\su |
    s4\sd s2\su |
    s2. |
    
    \barNumberCheck 17
    % like bar 1 (8 bars)
    s4\sd s16 s8.\su s4 |
    s4\sd s2\su |
    s4\sd s16 s8.\su s4 |
    s8.\sd s16\su s2 |
    s4.\sd s8\su s8.\sd s16\su |
    s2-\tweak Y-offset -2 \sd s8. s16\su |
    s8 s\sd s2\su |
    s4\sd s2\su |
  }
    
  \barNumberCheck 25
  \repeat volta 2 {
    \grace { s4 }
    s4-\tweak Y-offset -3 \sd s2\su |
    s4-\tweak Y-offset -3 \sd s2\su |
    s4\sd s2\su |
    s4\sd s2\su |
    s4\sd s2\su |
    s4-\tweak X-offset -3 \sd s2\su |
    s4.\sd s\su |
    s4\sd s2\su |
    
    \barNumberCheck 33
    s4\sd s2\su |
    s4\sd s2\su |
    s4\sd s2\su |
    s4\sd s2\su |
    s4-\tweak Y-offset -1 \sd s8. s16\su s8\sd s-\tweak Y-offset -1 \su |
    s4-\tweak Y-offset -1 \sd s8. s16\su s8\sd s-\tweak Y-offset -1 \su |
    s2.\sd |
    s4 s2\su |
  }
  
  \barNumberCheck 41
  \repeat volta 2 {
    s2. |
    s2\sd s8 s\su |
    s2. |
    s2\sd s8 s\su |
    s2. |
    s4.\sd s8\su s4 |
    s4\sd s8\su s\sd s s\su |
    s8\sd s\su s2 |
    
    \barNumberCheck 49
    % like 25 (8 bars)
    s4-\tweak Y-offset -2 \sd s2\su |
    s4-\tweak Y-offset -2 \sd s2\su |
    s4\sd s2\su |
    s4\sd s2\su |
    s4\sd s2\su |
    s4-\tweak Y-offset -1 \sd s2\su |
    s4.\sd s\su |
    s4\sd s2\su |
    
    \barNumberCheck 57
    % like 33 (8 bars)
    s4-\tweak Y-offset -2 \sd s2\su |
    s4\sd s2\su |
    s4\sd s2\su |
    s4\sd s2\su |
    s4-\tweak Y-offset -1 \sd s8. s16\su s8\sd s-\tweak Y-offset -1 \su |
    s4\sd s8. s16\su s8\sd s-\tweak Y-offset -1 \su |
    s2.\sd |
    s4 s2\su |
  }
  
  \barNumberCheck 65
  % like bar 1 (8 bars)
  s4\sd s16 s8.\su s4 |
  s4\sd s2\su |
  s4\sd s16 s8.\su s4 |
  s8.\sd s16\su s2 |
  s4.\sd s8\su s8.\sd s16\su |
  s2-\tweak Y-offset -2 \sd s8. s16\su |
  s8 s\sd s2\su |
  s4\sd s2\su |
  
  \barNumberCheck 73
  % like 9 (8 bars)
  s4-\tweak Y-offset -2 \sd s2\su |
  s4-\tweak Y-offset -2 \sd s2\su |
  s2. |
  s4 s\sd s8. s16\su |
  s4-\tweak Y-offset -2 \sd s2\su |
  s4-\tweak Y-offset -2 \sd s2\su |
  s4\sd s2\su |
  s2. |
  
  \barNumberCheck 81
  % like 17 (8 bars)
  s4\sd s16 s8.\su s4 |
  s4\sd s2\su |
  s4\sd s16 s8.\su s4 |
  s8.\sd s16\su s2 |
  s4.-\tweak Y-offset -1 \sd s8\su s8.\sd s16\su |
  s2-\tweak Y-offset -3 \sd s8. s16\su |
  s8 s\sd s2\su |
  s4\sd s2\su |
}

forceBreaks = {
  % page 1
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 2
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 3
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \grace { s8*1/4 } \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 4
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 5
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  
}

polonaiseOneNotes =
\score {
  \header {
    title = "Polonaise One"
    composer = "Frédéric Chopin"
    opus = "Opus 40, No. 1"
  }
  \keepWithTag layout  
  \new PianoStaff <<
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

polonaiseOneMidi =
\book {
  \bookOutputName "polonaise-op40-no1"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
