\version "2.14.2"
\include "header.ly"
\header {
  title = "The Wexford Carol"
  poet = "Traditional, 16th Century or earlier"
  composer = "Traditional"
  % arranger = \markup\oldStyleNum"Edited by Benjamin Bloomfield (1984–)"
}

global = {
  \preamble
  \key g \major
  \time 3/4
  \slurSolid
  #(set-global-staff-size 12)
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
}

sopMusic = \relative c' {
  \partial 8 d8 |
  g8 g16( fis) g4. a8 |
  b c d4 b8\rest d |
  c b g( d4) e8 |
  f g f4 \bar"" b8\rest d, |

  g g16( fis) g4. a8 |
  b c d4 b8\rest b |
  c d b( g4) a8 |
  g g g4 \bar"" b8\rest

  g |
  g8 f' d( c4) a8 |
  bes c bes4. d16( c) |
  \times 2/3 {bes8( a) g} g( d4) e8 |
  f g f4 \bar"" b8\rest d, |

  g8 g16( fis) g4. a8 |
  b c d4 b8\rest b |
  c d b8( g4) a8 |
  g g g4. \bar "|."
}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  d8 |
  g d d8.( c16 b8) d |
  g g fis4 s8 d |
  e fis g( d4) e8 |
  c c d4 s8 d |

  g d d8.( c16 b8) d |
  g g fis4 s8 e |
  e8 d d( f4) e8 |
  d c d4 s8 |

  g |
  g a g( e4) f8 |
  g8 c, d4. d8 |
  d d g( d4) e8 |
  d e d4 s8 d |

  g d d8.( c16 b8) d |
  g g fis4 s8 e |
  e8 d d( f4) e8 |
  e d b4.
}

altoWords = \lyricmode {
  \set stanza = #"1. "
  \set associatedVoice = "tenors"
  Good peo -- ple all, this Christ -- mas time,
  Con -- sid -- er well, and bear in mind,
  What our good God for us has done,
  In send -- ing His be -- lov -- ed Son.

  With Ma -- ry ho -- ly, we should pray
  To God with love this Christ -- mas day;
  In Beth -- le -- hem up -- on that morn,
  There was a bless'd Mes -- si -- ah born.
}

altoWordsII = \lyricmode {
  \set stanza = #"2. "
  \set associatedVoice = "tenors"
  The night be -- fore that hap -- py tide,
  The no -- ble Vir -- gin and her guide
  Were long time seek -- ing up and down
  To find a lodg -- ing in the town.
  But mark how all things came to pass:
  From ev -- ’ry door re -- pelled A -- las!
  As long fore -- told their ref -- uge all
  Was but a hum -- ble ox -- ’s stall.
}

altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \set associatedVoice = "tenors"
  Near Beth -- le -- hem did shep -- herds keep
  Their flocks of lambs and feed -- ing sheep;
  To whom God’s an -- gels did ap -- pear,
  Which put the shep -- herds in great fear.
  “Pre -- pare and go,” the an -- gels said,
  “To Beth -- le -- hem. Be not a -- fraid
  For there you’ll find this hap -- py morn
  A prince -- ly babe sweet Je -- sus born.”
}

altoWordsIV = \lyricmode {
  \set stanza = #"4. "
  \set associatedVoice = "tenors"
  See how the Lord of Heav’n and earth,
  Show’d Him -- self low -- ly in His birth;
  A sweet ex -- am -- ple for man -- kind,
  To learn to bear a hum -- ble mind.
  If choirs of An -- gels did re -- joice,
  Well may man -- kind with heart and voice
  Sing prais -- es to the God of Heav’n,
  That un -- to us His Son has giv’n.
}

tenorMusic = \relative c {
  d8 |
  g a b8.( c16 d8) d |
  b g a4 s8 b |
  a fis b( a c) b |
  a g a4 s8 d, |

  g a b8.( c16 d8) d |
  b g a4 s8 g |
  g g g4 c |
  b8 c b4 s8 |

  g |
  g c b( a4) c8 |
  d8 a f4. g8 |
  \times 2/3 {g( a) bes} bes( a) bes( c) |
  a c a4 r8 d, |

  g a b8.( c16 d8) d |
  b g a4 s8 g |
  g g g8( g4) c8 |
  b c d4.
}

bassMusic = \relative c {
  d8 |
  g d b8.( a16 g8) fis' |
  e e d4 d8\rest b |
  c d e( fis g4) |
  f8 e d4 d8\rest d |

  g d b8.( a16 g8) fis' |
  e e d4 d8\rest e |
  c b b( d ) c4 |
  g'8 e g4 d8\rest

  g |
  g f g( a4) f8 |
  g f bes,4. g8 |
  g' g g( f) g( a) |
  d, c d4 g, |

  g'8 d b8.( a16 g8) fis' |
  e e d4 d8\rest e |
  c b b( d4) c8 |
  e g g4.
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff = women <<
        \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
        \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
      >>
      \new Staff = men <<
        \clef bass
        \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
        \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
      >>
      \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsIV
      \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsIII
      \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsII
      \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWords
    >>
  >>
}
