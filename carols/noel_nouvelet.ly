\version "2.14.2"
\include "header.ly"
\header {
  title = "Noël Nouvelet"
  composer = "15th Century French Carol"
}

global = {
  \preamble
  \key f \major
  \time 2/4
}

sopMusic = \relative c'' {
  \slurDotted
  g8( d') e c |
  \slurSolid
  d4 bes |
  c8 c16( d) bes8 a |
  g2 | \break

  \slurDotted
  g8( d') e c |
  \slurSolid
  d4 bes |
  c8 c16( d) bes8 a |
  g2 | \break

  bes4 a8 g |
  a4. d,8 |
  bes' bes a g |
  a2 | \break

  g8 d' e c |
  d4 bes |
  c8 c16( d) bes8 a |
  g2 \bar "|."
}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  \slurDotted
  g'8( d) g g |
  \slurSolid
  d4 g |
  e8 e g fis |
  d2 |

  \slurDotted
  g8( d) g g |
  \slurSolid
  d4 g |
  e8 e g fis |
  d2 |

  d4 e8 e |
  d4. d8 |
  d d e e |
  d2 |

  g8 d g g |
  d4 g |
  e8 e g fis |
  d2 \bar "|."
}
altoWords = \lyricmode {
  \set stanza = "1. "
  \set ignoreMelismata = ##t
  No -- ël nou -- ve -- let,
  \unset ignoreMelismata
  No -- ël chan -- tons i -- ci,
  Dé -- vo -- tes gens,
  cri -- ons à Dieu mer -- ci!

  Chan -- tons No -- ël
  pour le Roi nou -- ve -- let!
  No -- ël nou -- ve -- let,
  No -- ël chan -- tons i -- ci!
}

altoWordsII = \lyricmode {
  \set stanza = "2. "
  En Beth -- lé -- em‚
  Ma -- rie et  Jo -- seph vy‚
  l'âne et le boeuf,
  l’en -- fant cou  -- ché au lit
  La crèche é -- tait
  au lieu d’un ber -- cel -- et;
}

altoWordsIII = \lyricmode {
  \set stanza = "3. "
  Bien -- tôt les rois,
  par l'é -- toile é -- clair -- cis,
  De l'O -- ri -- ent dont
  ils é -- taient sor -- tis.
  A Beth -- lé -- em
  vin -- rent un ma -- ti -- net;
}

altoWordsIV = \lyricmode {
}

tenorMusic = \relative c' {
  \slurDotted
  g8( bes) c c |
  \slurSolid
  bes4 d |
  c8 g d' d |
  bes2 |

  \slurDotted
  g8( bes) c c |
  \slurSolid
  bes4 d |
  c8 g d' d |
  bes2 |

  bes4 c8 c |
  a g fis d |
  bes' bes c c |
  fis,( g a4) |

  g8 bes c c |
  bes4 d |
  c8 g d' c |
  bes2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c' {
  \slurDotted
  g8( g) c, e |
  \slurSolid
  g4 g |
  c,8 c d d |
  g2 |

  \slurDotted
  g8( g) c,8 e |
  \slurSolid
  g4 g |
  c,8 c d d |
  g2 |

  g4 a8 a |
  fis8 e d d8 |
  g g a a |
  d,( e fis4) |

  g8 g c, e |
  g4 g |
  c,8 c d d |
  g,2 \bar "|."
}
bassWords = \lyricmode {

}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women"  } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men"  } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men"  } \lyricsto "basses" \bassWords
  >>
  >>
}
