%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"

\include "includes/header-paper.ily"
\include "includes/title-page.ily"
\include "includes/polonaise-op40-no1-parts.ily"
\include "includes/polonaise-op40-no2-parts.ily"

% Title page

\titlePage

% Table of contents

\bookpart {
  \header {
    title = ##f
    subtitle = ##f
    composer = ##f
    arranger = ##f
    copyright = ##f
    tagline = ##f
  }
  \markuplist \table-of-contents
}

% PDFs

\tocItem \markup "No. 1 Allegro con brio in A major" 
\polonaiseOneNotes
\pageBreak

\tocItem \markup "No. 2 Allegro maestoso in C minor"
\polonaiseTwoNotes

% Midi

\polonaiseOneMidi
\polonaiseTwoMidi
