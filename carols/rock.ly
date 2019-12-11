\version "2.14.2"

\header {
  title = "Rock of Ages"
  subtitle = "(Ma'oz Tzur)"
  arranger = "arr. Sarah Riskind (ed. McCormick)"
  index_as = "Ma'oz Tzur"
}

\include "header.ly"

global = {
  \preamble
  \key es \major
  \time 4/4
}

sopMusic = \relative c' {
  \repeat unfold 2 {
    es4 bes es as | g f es2 | bes'4 c f, g8( as) | g4( f) es2 |
  }
  bes'4. bes8 c4 d | es2 bes | es4 d c bes | bes8( as g as) f2 |
  g4. as8 bes2 | f4. g8 as2 | g4 f es as | g( as) bes2 |
  g4. as8 bes2 | f4. g8 as2 | g4 f es as | g( f) es2 \bar "|."

}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  \repeat unfold 2 {
    bes4 bes c es | es d bes2 | es4 es es es | es( d) bes2 |
  }
  bes'4. bes8 bes4 bes | g2 g | es4 es es es | es2 es4( d) |
  es4. es8 es4( c) | d4. es8 f2 | es4 d c es | es( f) g2 |
  es4. f8 g4( es) | d4. es8 f2 | es4 d c es | es( d) bes2  \bar "|."
}

altoWords = \lyricmode {
  Rock of a -- ges, let our song
  praise Your sav -- ing pow -- er:
  You, a -- midst the rag -- ing foes,
  were our shel -- t'ring tow -- er.

  Fur -- ious they as -- sailed us,
  but Your arm a -- vailed us,
  and your word broke their sword
  when our own strength failed us,

  and your word broke their sword
  when our own strength failed us.
}

tenorMusic = \relative c' {
  \repeat unfold 2 {
    g4 g g c | bes as g2 | g4 g c c  | bes2 g2 |
  }
  bes4. bes8 c4 d | es2 bes | c4 bes as bes | g( c) bes2 |
  bes4. bes8 bes4( g8 as) | bes4. bes8 bes2 | bes4 bes g c | bes2 bes |
  bes4. bes8 c4( bes) | as4. as8 as4( bes) | bes bes g c | bes4( as) g2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  \repeat unfold 2 {
    es4 es c as | bes bes es2 | es4 es as, as  | bes2 es2 |
  }
  bes4. bes8 bes4 bes | es2 es | g4 g as g | c, ( as) bes2 |
  es4. f8 g4( es) | bes4. bes8 bes2 | es4 bes c as | bes2 es4( d) |
  c4. c8 c2 | bes4. bes8 bes2 | es4 bes c as | bes2 es | \bar "|."
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
