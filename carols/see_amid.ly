\version "2.14.2"
\include "header.ly"
\header {
  title = "See Amid the Winter's Snow"
  poet = "Edward Caswall, 1851"
  composer = "\"Humility\", John Goss, 1870"
  arranger = "From \"The Children's Hymnal, with Tunes\", 1875"
  enteredby = "Maia McCormick"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2019/Dec/10"
}
global = {
  \preamble
  \key g \major
  \time 4/4
}

sopMusic = \relative c'' {
  g4. a8 g4 fis | e4. d8 d2 | g4 a c b | b4. a8 a2 |
  g4. a8 g4 fis | e4. d8 d2 | g4 a b c | a4. g8 g2 |
  d'4. d8 c4 b | a g fis2 | d'4. d8 c4 b | a g g(fis ) |
  g4. a8 g4 fis | e4. d8 d2 | d'4. b8 g4 c | b a g2 \bar "|."
}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  b4 b c d | g, a b( c) | d4. d8 g4 g | g g fis2 |
  d4 b c d | g, a b( a) | b c d e | c c b2 |
  g'4. g8 g4 g | d d d2 | d4. g8 g4 g | e d d2 |
  b4. b8 cis4 d | d cis d2 | d4. d8 e4 g | g fis d2 \bar "|."
}
altoWords = {
  \lyricmode {
    \set stanza = # "1. "
    See a -- mid the win -- ter's snow,
    Born for us on earth be -- low,
    See the gen -- tle Lamb ap -- pears,
    Pro -- mised from e -- ter -- nal years.

    Hail, thou ev -- er -- bless -- ed morn,
    Hail, re -- demp -- tion's hap -- py dawn,
    Sing through all Je -- ru -- sal -- em:
    Christ is born in Beth -- le -- hem!
  }
}
altoWordsII = \lyricmode {
  \set stanza = # "2. "
  Lo, with -- in a man -- ger lies
  He who built the star -- ry skies;
  He who, throned in height sub -- lime,
  Sits a -- mong the cher -- u -- bim.
}

altoWordsIII = \lyricmode {
  \set stanza = # "3. "
  Sac -- red Inf -- ant, all di -- vine,
  What a ten -- der love was Thine,
  Thus to come from high -- est bliss
  Down to such a world as this.
}

tenorMusic = \relative c' {
  g4 g g d | e fis g( a) | b4. b8 e4 d | d cis d2 |
  g,4 g g d | e fis g( a) | g4 g g4. g8 | g4 fis g2 |
  b4. b8 e4 d | c b a2 | g4. g8 e'4 d | c b a2 |
  g4. g8 e4 d | b' a8( g) fis2 | g4. g8 g4 e' | d4. c8 b2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  g4 g a b | c c g2 | g'4 fis e g | d d d( c) |
  b g a b | c4 c g'( fis) | e4. e8 d4 c | d4 d g,2 |
  g'4. g8 g4 g | fis g d2 | b4. b8 c4 g | a b8( c) d2 |
  e4. e8 a,4 b | g a d( c) | b4. b8 c4 a | d d <<g2 g,>> \bar "|."
}
bassWords = \lyricmode {

}

\score {
  \transpose g as
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
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "tenors" \sopWords
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWords
    \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
  >>
  >>
}
