\version "2.14.2"
\header {
  filename = "once_in_royal.ly"
  enteredby = "Maia McCormick"
  composer = "H.J. Gauntlett (1805-76)"
  arranger = "arr. A.H. Mann (1850-1929)"
  poet = "C.F. Alexander (1818-95)"
  title = "Once in Royal David's City"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2017/Dec/2"
}
\include "header.ly"
global = {
  \preamble
  \key g \major
  \time 4/4
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
}

sop = \context Voice = "sop" {
  \relative c' {
    \voiceOne
    \repeat unfold 2 {
      d4 fis g4. g8 | g( fis) g( a) a4 g |
      g b d4. b8 | b( a) g( fis) g2 |
    }

    \slurDotted
    e'4 e d4. g,8 | c4 c b4( b) |
    e e d4. b8 | b( a) g( fis) g4( g) \bar "|."
  }
}

alto = \context Voice = "alto" {
  \relative c' {
    \voiceTwo
    \repeat unfold 2 {
      d4 fis d d | cis cis d8( c) b4 |
      d g d d | e d d2 |
    }

  e8( fis) g( a) d,4 d  | \slurDotted e fis g( fis) |
  \slurSolid
  e8( fis) g( a) d,( fis g) g | \slurDotted e4 d d( d) |
  }
}

tenor = \context Voice = "tenor" {
  \relative c' {
    \voiceOne
    \repeat unfold 2 {
      b4 c d b | a g fis g |
      b d a b8( d) | d( c) b( a) b2 |
    }

    \slurDotted
    g4 c b b | c d d( d) |
    \slurSolid
    c c b8( c d) d | d( c) b( a) b4( b) |
  }
}

bass = \context Voice = "bass" {
  \relative c' {
    \voiceTwo
    \repeat unfold 2 {
      b4 a b g | e a, d g, |
      b' g fis g | c, d g2 |
    }

  c,8( d) e( fis) g4 b  | \slurDotted a d, g( g) |
  \slurSolid
  c,8( d) e( fis) g( a b) g | \tieDotted c,4 d <<g~ \parenthesize g,~>> <<\parenthesize g g'>> |
  }
}

stanzaa = \lyricmode {
  Once in roy -- al Da -- vid’s cit -- y
  Stood a low -- ly cat -- tle shed,
  Where a moth -- er laid her Ba -- by
  In a man -- ger for His bed:

  Ma -- ry was that moth -- er mild,
  Je -- sus Christ her lit -- tle Child.
}
stanzab = \lyricmode {
  He came down to earth from heav -- en,
  Who is God and Lord of all,
  And His shel -- ter was a sta -- ble,
  And His cra -- dle was a stall;

  \set ignoreMelismata = ##t
  With the poor, and mean, and low -- ly,
  Lived on earth our
  \unset ignoreMelismata Sav -- ior
  \set ignoreMelismata = ##t ho -- ly.
}
stanzac = \lyricmode {
  For he is our child -- hood’s pat -- tern,
  Day by day like us He grew;
  He was lit -- tle, weak, and help -- less,
  Tears and smiles, like us, He knew:

  \set ignoreMelismata = ##t
  And He feel -- eth for our sad -- ness,
  And He shar -- eth
  \unset ignoreMelismata in our
  \set ignoreMelismata = ##t glad -- ness.
}
stanzad = \lyricmode {
  And our eyes at last shall see Him,
  Through His own re -- deem -- ing love;
  For that Child so dear and gen -- tle
  Is our Lord in heav’n a -- bove:

  And He leads His chil -- dren on
  To the place where He is gone.
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
      \set stanza = "1."
      \stanzaa }
    \lyricsto "sop" \context Lyrics = "stanza-2" {
      \set stanza = "2."
      \stanzab }
    \lyricsto "sop" \context Lyrics = "stanza-3" {
      \set stanza = "3."
      \stanzac }
    \lyricsto "sop" \context Lyrics = "stanza-4" {
      \set stanza = "4."
      \stanzad }
    %	\lyricsto "sop" \context Lyrics = "stanza-6" {
    %		\set stanza = "6."
    %			\stanzaf }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
