\version "2.14.2"

\header {
  title = "Jesus Christ the Apple Tree"
  poet = "Words from \"Divine Hymns or Spiritual Songs\", compiled Joshua Smith" % italics?
  composer = "Elizabeth Poston (1905-87)"
  enteredby = "Maia McCormick"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2019/Dec/12"
}

\include "header.ly"

global = {
  \preamble
  \key c \major
  \time 4/4
}

sopMusic = \relative c' {
  \partial 8
  c4 | c e g g | b b c4. c8 | b4 b c c | b c g e |
  e d g c, | c c d e | g g c c | a d g % break
  g 
  

  \bar "|."

}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  c4 | c e e e | g g g4. g8 | g4 g g g | g g e  e |
  e d c c | c c d e | e d c e | e d d
  e |

  \bar "|."
}

altoWords = \lyricmode {
  the tree of life my soul hath seen
}

tenorMusic = \relative c' {
  c4 | c c c c | d d e4. e8 | d4 d e e | d e c c |
  c b c c | c b c b | c b a c | c d b
  c 
  \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  
  \bar "|."
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
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
  >>
  >>
}
