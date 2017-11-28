\header {
  enteredby = "Maia McCormick"
  composer = "Irving Berlin"
  arranger = "arr. Maia McCormick"
  title = "White Christmas"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2017/Nov/29"
}

\version "2.14.2"

\include "header.ly"

global= {
  \preamble
  \key d \major
  \time 4/4
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
}

sop = \context Voice = "sop" \relative c' {
  \tempo "Schmaltzissimo"

  \voiceOne
  \repeat volta 2 {
    % I'm dreaming...
    fis2 g8 fis eis fis | g2 gis8-- a4. |
    % just like the ones...
    b8\rest b cis d e d cis g | a2~ a8-- b\rest d, e |
    % treetops glisten...
    fis4 fis fis8 b4 a8 | d,4 d e8 a4 g8 |
    % hear sleighbells...
    fis2 g8 fis~ \tuplet 3/2 {fis e d} | d2. b'4\rest |

    % I'm dreaming...
    fis2 g8 fis eis fis | g2 gis8-- a4. |
    % With every Christmas card...
    b8\rest b cis d e d cis g | a2~ a8 b\rest d, e |
    % Days be merry...
    fis4 fis fis8 b4 a8 | d2~ d8-- b\rest d, e |
    % All your Christmases...
    fis4 fis b8 a d, e |
  }
  \alternative {
    { d2~ d4. b'8\rest | }
    {
      e,2( d8--) b'\rest d, e |
      fis4 fis b8. b,16 b8 cis | <<cis1 e>> \bar "|."
    }
  }
}

alto= \context Voice = "alto" \relative c' {
  \voiceTwo
  \repeat volta 2 {
    % I'm dreaming...
    d2 e8 d cis d | e2 eis8-- fis4. |
    % just like the ones...
    s8 g g a g g g g | fis2~ fis8-- s d d |
    % treetops glisten...
    d4 cis c8 fis4 fis8 | d4 d d8 d4 d8 |
    % hear sleighbells...
    d2 d8 d~ \tuplet 3/2 { d cis b } | cis2. s4 |

    % I'm dreaming...
    d2 e8 d cis d | e2 eis8-- fis4. |
    % With every Christmas card...
    s8 g g a g g g g | fis2~ fis8 s d d |
    % Days be merry...
    d4 cis c8 fis4 fis8 | d2~ d8-- s d d |
    % All your Christmases...
    d4 d d8 d b bes |
  }
  \alternative {
    { a2~ a4. s8 | }
    {
      cis2( b8--) b'\rest d, d |
      d4 d d8. b16 b8 bes | a1 \bar "|."
    }
  }
}

tenor = \context Voice = "tenor" \relative c' {
  \voiceOne
  \repeat volta 2 {
    % I'm dreaming...
    a2 b8 a gis a | b2 b8-- a4. |
    % just like the ones...
    r8 d d d b b e e | e4( d c8--) s b b |
    % treetops glisten...
    a4 a a8 c4 c8 | b4 b bes8 bes4 bes8 |
    % hear sleighbells...
    a2 b8 a~ \tuplet 3/2 { a a g } | a2. s4 |

    % I'm dreaming...
    a2 b8 a gis a | b2 b8-- a4. |
    % With every Christmas card...
    r8 d d d b b e e | e4( d cis?8) s b bes |
    % Days be merry...
    a4 a a8 c4 c8 | b2( bes8--) s bes bes |
    % All your Christmases... |
    a4 a g8 g g g |
  }
  \alternative {
    { fis2~ fis4. s8 | }
    {
      fis2~ fis8-- s bes bes |
      a4 a g8. g16 g8 g | fis1 \bar "|."
    }
  }
}

bass = \context Voice = "bass" \relative c {
  \voiceTwo
  \repeat volta 2 {
    % I'm dreaming...
    d2 d8 d d d | d2 d8-- d4. |
    % just like the ones...
    g4 g8 fis e e a a | d,2~ d8-- d\rest d d |
    % treetops glisten...
    d4 d d8 d4 d8 | g4 g g8 g4 g8 |
    % hear sleighbells...
    d2 d8 d~ \tuplet 3/2 { d d d } | a'2( a,4) d\rest |

    % I'm dreaming...
    d2 d8 d d d | d2 d8-- d4. |
    % With every Christmas card...
    g4 g8 fis e e a a | d,2~ d8 d\rest d d |
    % Days be merry...
    d4 d d8 d4 d8 | g2~ g8-- d\rest g g |
    % All your Christmases...
    d4 b e8 e a, a |
  }
  \alternative {
    { d2~ d4. d8\rest | }
    {
      fis2( b,8--) d\rest g g |
      d4 b e8. e16 a,8 a | <<d1 \parenthesize d,>> \bar "|."
    }
  }
}

stanzaa = \lyricmode {
  I'm dream -- ing of a white Christ -- mas
  just like the ones I used to know,
  where the tree -- tops glist -- en,
  and child -- ren list -- en
  to hear sleigh bells in the snow.
  I'm dream -- ing of a white Christ -- mas
  with ev -- 'ry Christ -- mas card I write.
  May your days be mer -- ry and bright,
  and may all your Christ -- mas -- es be white.

  white;
  and may all your Christ -- mas -- es be white.
}

\score {
  \context ChoirStaff <<
    \unset ChoirStaff.melismaBusyProperties
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \lyricsto "sop" \context Lyrics = "stanza-1" {
      \stanzaa }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
