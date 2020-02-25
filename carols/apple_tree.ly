\version "2.14.2"

\header {
  title = "Jesus Christ the Apple Tree"
  poet = "Words from \"Divine Hymns or Spiritual Songs\"" % italics?
  composer = "Elizabeth Poston (1905–87)"
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
  \revert Stem.direction
  \partial 4
  c4^\markup {" "}^\markup {" "}^\markup {" "}^\markup {" "} % space between verse instructions and canon mark
  ^\markup { \italic\bold"v5: unis. or canon (enter at *)" }^\markup { \italic\bold"v1: solo or unis." } |
  c e g^\markup {"     *"} g | b b c4. c8 | b4 b c c | b c g e |
  e d g c, | c c d e | g g c c | a f g c | % break
  d c c g | g' e d e | g, g c c | a f g\fermata \bar"" \break

  \override Stem.direction = #UP
  c,^\markup { \italic\bold"SSAA" } |
  c e g g | b b c4. c8 | b4 b c c | b c g e |
  e d g c, | c c d e | g g c c | a f g c | % break
  d c c g | g' e d e | g, g c c | a f g\fermata \bar"" \pageBreak

  c,^\markup { \italic\bold"SATB" } |
  c e g g | b b c4. c8 | b4 b c c | b c g e |
  e d g c, | c c d e | g g c c | a f g c | % break
  d c c g | g' e d e | g, g c c | a f g\fermata


  \bar "|."

}

altoMusic = \relative c' {
  \repeat unfold 48 { s4 }
  c4 | c e e e | g g g4. g8 | g4 g g g | g g e  e |
  e d c c | c c d e | e d c e | e d d e |
  f f e f | g a a g | e d c c | e d d

  c | c e g e | g g g4. g8 | g4 g g g | g g e e |
  e d c c | c c c e | e d c e | e d d
  g | a a g g | g g a g | e d c e | e d d

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

  \set stanza = #"2."
  \repeat unfold 2 {
    His beau -- ty doth all things ex -- cel:
    By faith I know, but ne'er can tell
  }
  The glo -- ry which I now can see
  In Je -- sus Christ the ap -- ple tree.
}

stanzaII = \lyricmode {
  \repeat unfold 48 { \skip 1 }
  \repeat unfold 48 { \skip 1 }
  \set stanza = #"3."
  \repeat unfold 2 {
    For hap -- pi -- ness I long have sought,
    And pleas -- ure dear -- ly I have bought:
  }
  I missed of all; but now I see
  'Tis found in Christ the ap -- ple tree.
}

stanzaIII = \lyricmode {
  \repeat unfold 48 { \skip 1 }
  \repeat unfold 48 { \skip 1 }
  \set stanza = #"4."
  \repeat unfold 2 {
    I'm wear -- y with my for -- mer toil,
    Here I will sit and rest a -- while:
  }
  Und -- er the sha -- dow I will be
  of Je -- sus Christ the ap -- ple tree.
}

stanzaIV = \lyricmode {
  \set stanza = #"5."
  \repeat unfold 2 {
    This fruit doth make my soul to thrive,
    It keeps my dy -- ing faith a -- live;
  }
  Which makes my soul in haste to be
  With Je -- sus Christ the ap -- ple tree.
}

tenorMusic = \relative c' {
  \repeat unfold 48 { s4 }
  c4 | c c c c | d d e4. e8 | d4 d e e | d e c c |
  c b c c | c b c b | c b a c | c d b c |
  c d g d | e f f e | c b a c | c c b\fermata \bar""
  \clef bass \set Staff.explicitClefVisibility = #end-of-line-invisible

  c, | c e g c | d d e4. e8 | d4 d c e | d e c c |
  c b a a | a b a b | c b a g | a c b
  e | f f e e | c c f e | c b a a | a c b\fermata
  \bar "|."
}

bassMusic = \relative c' {
  \repeat unfold 48 { s4 }
  c4 | c c c c | c c c4. c8 | c4 c c c | c c c c |
  c b a a | a g a g | c b a a | c d b c |
  a a b c | c c c b | c b a a | c c g \bar""
  \clef bass \set Staff.explicitClefVisibility = #end-of-line-invisible

  c, | c e g c, | c c c4. c8 | g'4 g e c | g' c c c |
  c b a a | a g f g | c b a g | d d g
  c | c d b b | a a c b | c b a g | d d g
  \bar "|."
}

\layout {
  \context {
    \Staff \RemoveEmptyStaves
    \override VerticalAxisGroup.remove-first = ##t
  }
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

