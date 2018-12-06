\header {
  filename = "away_in_a_manger_2.ly"
  poet = "19th cen. American"
  title  = "Away in a Manger (Normandy)"
  composer = "Trad. Normandy Melody"
  arranger = "arr. Reginald Jacques"
  enteredby = "Maia McCormick"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2017/Dec/01"
}

\version "2.14.2"
\include "header.ly"

global= {
  \preamble
  \time 3/4
  \key a \minor
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
}

sop = \context Voice = "sop" \relative c' {
  \voiceOne
  \partial 4 e4 |
  a a a8( b) | c4 c c8( b) | a4 a g | e2 e8( g) |
  a4 a g | e e e8( g) | a4 a g | e2 e4 |
  a a a8( b) | c4 c c8( b) | c4 c d | e2 e8( d ) |
  c4 c c8( b) | a4 a g | f f d | e2 \bar "|."
}

alto=\context Voice = "alto" \relative c' {
  \voiceTwo
  \partial 4 e4 |
  c8( d) e4 e8( g) | g4 g g | g f8( e) d4 | e2 c8( d) |
  e4 e d | b b e8( d) | e4 e d | c2 e4 |
  c g' f | g g e8( d) | c4 a' a | gis2 e4 |
  b' a g | g f e | f d a | b2
}

tenor = \context Voice = "tenor" \relative c' {
  \voiceOne
  \partial 4 b4 |
  a8( b) c4 c8( d) | e4 e c | c a b | c2 g4 |
  c c b | a g g | c8( b) c4 g | g2 c4 |
  a c d | f e c | e e a, | b2 b4 |
  e e c | c c c8( b) | a4 a a | gis2
}

bass = \context Voice = "bass" \relative c {
  \voiceTwo
  \partial 4 e4 |
  a8( b) a4 a8( g) | c4 c e, | f f g | c,2 c8( b) |
  a4 a b | e e c8( b) | a4 a b | c2 c4 |
  f e d | c c c' | a g f | e2 gis4 |
  a a e | f f c | d d8( e) f4 | e2
}

stanzaa = \lyricmode {
  A -- way in a man -- ger,
  no crib for a bed,
  The lit -- tle Lord Je -- sus
  laid down his sweet head;
  The stars in the bright sky looked
  down where he lay,
  The lit -- tle Lord Je -- sus
  a -- sleep on the hay.
}

stanzab = \lyricmode {
  The cat -- tle are low -- ing,
  the ba -- by a -- wakes,
  But lit -- tle Lord Je -- sus
  no cry -- ing he makes.
  I love thee, Lord Je -- sus!
  Look down from the sky,
  and stay by my side un -- til
  morn -- ing is nigh.
}

stanzac = \lyricmode {
  Be near me, Lord Je -- sus;
  I ask thee to stay
  Close by me for ev -- er,
  and love me, I pray.
  Bless all the dear child -- ren
  in thy ten -- der care,
  and fit us for hea -- ven,
  to live with thee there.
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

    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
