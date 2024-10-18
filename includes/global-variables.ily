%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....
\version "2.24.0"

%
% Scheme functions
%

% ly:expect-warning only works to supress once.  This function allows
% you to specify the number of times a warning appears.
#(define ly:expect-warning-times (lambda args
   (for-each (lambda _ (apply ly:expect-warning (cdr args)))
             (iota (car args)))))

makeSpanner =
#(define-music-function (mrkup) (markup?)
  #{
    \override TextSpanner.bound-details.left.text = #mrkup
    \override TextSpanner.bound-details.left.stencil-align-dir-y = 0.25
    \override TextSpanner.bound-details.left-broken.text = ##f
  #})

sempreDim =
  #(make-music 'DecrescendoEvent 'span-direction START 'span-type 'text
               'span-text "sempre dim.")
  
perdendosi =
  #(make-music 'DecrescendoEvent 'span-direction START 'span-type 'text
               'span-text "perdendosi")

pocoCresc =
  #(make-music 'CrescendoEvent 'span-direction START 'span-type 'text
               'span-text "poco cresc.")

ffz = #(make-dynamic-script "ffz")
rf = #(make-dynamic-script "rf")

%
% Redefine
%

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

sd = \sustainOn
su = \sustainOff

hideNoteHead = \once {
  \omit Stem
  \omit Dots
  \omit Flag
  \hideNotes
  \override NoteColumn.ignore-collision = ##t
}

%
% Markup
%

dolce = \markup \large \italic dolce
slendando = \markup \large \italic slendando
pocoRit = \markup \large \italic "poco rit."
aTempo = \markup \large \italic "a tempo"
piuF = \markup { \large più \dynamic f }
secondVolta = \markup \bold "2nd volta"
ffEnergico = \markup { \dynamic ff \normal-text \large \italic energico }
pEspress = \markup { \dynamic p \normal-text \large \italic espress. }
ritenEMoltoCresc = \markup \large \italic "riten. e molto cresc."
firstVoltaSecondVolta = \markup {
  \whiteout { \pad-markup #0.25 { \large { \normal-text { "1st volta:" }
  "soto voce," \normal-text{ "2nd volta:" } forte } } }
}

ritSpanner = \makeSpanner \markup \large \italic rit.
