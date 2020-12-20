\version "2.14.2"
\include "header.ly"

\header {
  enteredby = "Maia McCormick"
  composer = "William Billings (1746 – 1800)"
  date=""
  title = "Judea (A Virgin Unspotted)"
  toc_as = "A Virgin Unspotted"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2019/Dec/10"
}

global = {
  \preamble
  \key es \major
  \time 6/8
}

sopMusic = \relative c' {
  \partial 8 es8 |
  g bes g as c as | bes bes as g4 bes8 |
  bes bes bes bes g as | bes es d es4 es8 |
  es es es es c bes | c c c c4 bes8 |
  bes c c c c bes | <bes g> <bes g> <bes g> <bes g>4 bes16( as) \break

  \repeat volta 2 {
    g8 g as bes bes es | d c bes bes4 bes16( as) |
    g8 as g f g f |
  }
  \alternative {
    { es g bes bes4 bes16( as) | }
    { es8 g bes bes4. \bar "|." }
  }



}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  \partial 8 es8 |
  g bes g as c as | bes bes as g4 es8 |
  d d d es bes c | es g f g4 g8 |
  g g g g f es | f f f f4 f8 |
  es g es f es d | es es es es4 es8 |


  \repeat volta 2 {
    es es f g g f | g f f g4 f8 |
    g es es f es d |
  }
  \alternative {
    { es es d es4 es8 | }
    { es8 es d es4. \bar "|." }
  }



}

tenorMusic = \relative c {
  \partial 8 es8 |
  es g es f as f | g es f es4 g8 |
  f f f g es f | g bes as bes4 bes8 |
  bes bes bes bes as g | as as as as4 f8 |
  g g g as g f | es es es es4 g16( as) |

  \repeat volta 2 {
    bes8 bes c16( d) es8 d c | bes c d es4 d8 |
    c as c bes g bes |
  }
  \alternative {
    { as g f es4 g16( as) | }
    { as8 g f es4. \bar "|." }
  }

}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  \partial 8 es8 |
  es g es f as f | g es f es4 es8 |
  bes bes bes es bes' as | g es f es4 es8 |
  es es es es f g | f f f f4 bes,8 |
  es c c as as bes | es es es es4 es8

  \repeat volta 2 {
    es g f es g as | g as bes es,4 bes8 |
    c c c bes bes bes |
  }
  \alternative {
    { c as bes es4 es8 | }
    { c8 as bes es4. \bar "|." }
  }


}
bassWords = \lyricmode {

}

altoWords = \lyricmode {
  \set stanza = #"  1. "
  A vir -- gin un -- spot -- ted by Pro -- phet fore -- told,
  Should bring forth  the Sav -- ior which now we be -- hold,
  To be our Re -- deem -- er from death, hell, and sin,
  Which A -- dam's trans -- gres -- sions in -- vol -- ved us in.

  Then let us be mer -- ry, put sor -- row a -- way,
  Our Sav -- ior, Christ Je -- sus was born on this day. Then
  born on this day
}
altoWordsII = \lyricmode {
  \set stanza = #"  2. "
  Then God sent an an -- gel from Hea -- ven so high,
  To cer -- tain poor shep -- herds in fields where they lie,
  And bade them no long -- er in sor -- row to stay,
  Be -- cause that our Sav -- iour was born on this day. Then
}

moreverses = \markup{
  \fill-line {
    \column{
      \line { \bold "Verse 3:" }
      \smaller {
        \line{ Then presently after the shepherds did spy }
        \line{ Vast numbers of angels to stand in the sky; }
        \line{ They joyfully talkèd and sweetly did sing, }
        \line{ To God be all glory, our heavenly King. }
      }
    }

    \column{
      \line { \bold "Verse 4:" }
      \smaller {
        \line{ To teach us humility all this was done, }
        \line{ And learn we from thence haughty pride for to shun: }
        \line{ A manger His cradle who came from above, }
        \line{ The great God of mercy, of peace, and of love. }
      }
    }
  }
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff = women <<
        \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
        \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
      >>
      \new Lyrics \with { alignAboveContext = #"women"} \lyricsto "sopranos" \sopWords
      \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
      \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
      \new Staff = men <<
        \clef bass
        \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
        \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
      >>
      \new Lyrics \with { alignAboveContext = #"men"} \lyricsto "tenors" \tenorWords
      \new Lyrics \with { alignBelowContext = #"men"} \lyricsto "basses" \bassWords
    >>
  >>
  \layout {
    \context {
      \Staff
      \remove Time_signature_engraver
    }
  }
}
\moreverses
