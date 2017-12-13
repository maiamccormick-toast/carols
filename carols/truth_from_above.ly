\version "2.14.2"
\include "header.ly"

\header {
  title = "The Truth From Above"
  subtitle = "(Herefordshire Carol)"
  composer = "harm. Ralph Vaughan Williams"
  poet = "Traditional English"
  enteredby = "Benjamin Bloomfield (Collection of Christmas Carols)"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2017/Dec/07"
}

global = {
  \key c \major
  \time 5/4
}

sopMusic = \relative c' {
  \repeat volta 3 {
    \partial 2 e2 |
    \time 5/4 a4 b c( b) a |
    \time 3/2 g a e2. \breathe b'4 | \break

    \time 5/4 c c b( a) g |
    \time 3/2 a b c2. \breathe c8( d) | \break

    e4 e d2 c4( b) |
    \time 5/4 \slurDashed a a e2 \breathe e8( g) | \break

    \slurSolid
    \time 3/2 a4 b c( d) e( d) |
    \time 2/2 c8( a) b4 a2
  }
}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  e2 |
  a4 a a( g) f |
  e d b2. e4 |

  e a g( f) e |
  f f f( e2) a4 |

  g g8[ a] d,4( g) c,( d) |
  \slurDashed e fis b,2 e8( e) |

  \slurSolid e4 e a8([ g] fis4) e( fis) |
  g8( a) g[ fis] e2
}

altoWords = \lyricmode {
  \set stanza = #"  1. "
  This is the truth sent from a -- bove,
  The truth of God, the God of love.
  There -- fore don’t turn me from your door,
  But __ heark -- en all __ both rich and poor.
}
altoWordsII = \lyricmode {
  \set stanza = #"  2. "
  The first thing which I do re -- late
  \skip1
  Is that God did man cre -- ate;
  The next thing which to you I’ll tell
  Wo -- man was made with man to dwell.
}
altoWordsIII = \lyricmode {
  \set stanza = #"  3. "
  Then, af -- ter this, ’twas God’s own choice
  To place them both in Pa -- ra -- dise,
  There to re -- main, from e -- vil free,
  Ex -- cept they ate __ of such a tree.
}
altoWordsIV = \lyricmode {
  \set stanza = #"  4. "
  But they did eat, which was a sin,
  And thus their ru -- in did be -- gin.
  Ru -- ined them -- selves, both you and me,
  And all of their pos -- ter -- i -- ty.
}
altoWordsV = \lyricmode {
  \set stanza = #"  5. "
  Thus we were heirs to end -- less woes,
  Till God the Lord did in -- ter -- pose;
  And so a prom -- ise soon did run
  \set ignoreMelismata = ##t
  That He
  \unset ignoreMelismata
  would re -- deem us by His Son.

}
altoWordsVI = \lyricmode {
  \set stanza = #" 6. "
  \set ignoreMelismata = ##t
}
tenorMusic = \relative c' {
  e2 |
  c4 d e2 c4 |
  c a a( g2) \breathe b4 |

  a e' e( c) c |
  c d g,2. \breathe a4 |

  b c b2 e4( d) |
  c a g( fis!) \slurDashed \breathe g8( b) |

  \slurSolid c4 b a4.( b8) c4( a) |
  e' d cis2
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  e2 |
  a4 a a( e) f |
  c f e2. g4 |

  a4 a e( f) c4 |
  f8[ e] d4 c2. f4 |

  e e8[ fis] g4( g,) a( b) |
  c4 d e2 \slurDashed e8( e) |

  a4 g \slurSolid f8([ e] d4) c( d) |
  e8( fis) g4 a2
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
    \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "basses" \bassWords
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
  \layout {
  \context {
    \Lyrics
    \override LyricText #'font-size = #1.3
  }
    \context {
      \Staff
      \remove Time_signature_engraver
    }
    \context {
      \Score
      \override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 2)
      \override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 2)
    }
    \context {
      % Remove all empty staves
      % \Staff \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t
    }
    \context {
      \Lyrics
    }
  }
}
