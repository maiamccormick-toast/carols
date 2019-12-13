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
  \partial 4
  c4 | c e g g | b b c4. c8 | b4 b c c | b c g e |
  e d g c, | c c d e | g g c c | a d, g c | % break
  d c c g | g' e d e | g, g c c | a f g \bar"" \break
  c, |
  c e g g | b b c4. c8 | b4 b c c | b c g e |
  e d g c, | c c d e | g g c c | a d, g c | % break
  d c c g | g' e d e | g, g c c | a f g


  \bar "|."

}

altoMusic = \relative c' {
  c4 | c e e e | g g g4. g8 | g4 g g g | g g e  e |
  e d c c | c c d e | e d c e | e d d e |
  f f e f | g a a g | e d c c | e d d \bar""
  c |

  \bar "|."
}

stanzaI = \lyricmode {
  \set stanza = #"1."
  \repeat unfold 2 {
    The tree of life my soul hath seen,
    La -- den with fruit and al -- ways green:
  }
  The trees of na -- ture fruit -- less be
  Com -- pared with Christ the ap -- ple tree.
}

stanzaII = \lyricmode {
  \set stanza = #"2."
  \repeat unfold 2 {
    His beau -- ty doth all things ex -- cel:
    By faith I know, but ne'er can tell
  }
  The glo -- ry which I now can see
  In Je -- sus Christ the ap -- ple tree.
}

stanzaIII = \lyricmode {
  \repeat unfold 48 { \skip 1 }
  \set stanza = #"3."
  \repeat unfold 2 {
    For hap -- pi -- ness I long have sought,
    And pleas -- ure dear -- ly I have bought:
  }
  I missed of all; but now I see
  'Tis found in Christ the ap -- ple tree.
}

stanzaIV = \lyricmode {
  \repeat unfold 48 { \skip 1 }
  \set stanza = #"4."
  \repeat unfold 2 {
    I'm wear -- y with my for -- mer toil,
    Here I will sit and rest a -- while:
  }
  Und -- er the sha -- dow I will be
  of Je -- sus Christ the ap -- ple tree.
}

tenorMusic = \relative c' {
  c4 | c c c c | d d e4. e8 | d4 d e e | d e c c |
  c b c c | c b c b | c b a c | c d b c |
  c d g d | e f f e | c b a c | c c b \bar""
  \clef bass \set Staff.explicitClefVisibility = #end-of-line-invisible

  c,
  \bar "|."
}

bassMusic = \relative c' {
  c4 | c c c c | c c c4. c8 | c4 c c c | c c c c |
  c b a a | a g a g | c b a a | c d b c |
  a a b c | c c c b | c b a a | c c g \bar""
  \clef bass \set Staff.explicitClefVisibility = #end-of-line-invisible

  c,
  \bar "|."
}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics = "stanzaIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \stanzaIV
    \new Lyrics = "stanzaIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \stanzaIII
    \new Lyrics = "stanzaII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \stanzaII
    \new Lyrics = "stanzaI"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \stanzaI
   \new Staff = men <<
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
  >>
  >>
}
