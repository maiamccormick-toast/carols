\header {
  filename = "lo.ly"
  enteredby = "Gordon Gilbert, Ben Kuhn, Maia McCormick"
  composer = "14th cent. German Melody"
  arranger = "Michael Praetorius, 1571-1621"
  poet = "St. Germanus, 634-734"
  date=""
  title = "Es Ist Ein Ros' Entsprungen"
  metre = "Lo, How a Rose E'er Blooming"
  index_as = "Lo, How a Rose E'er Blooming"
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2017/Nov/28"
}

\version "2.14.2"

\include "header.ly"

global= {
  \time 2/2
  \key f \major
}

sop = \context Voice = "sop"    {
  \voiceOne
  \relative c' {
  \partial 2 c'2 |
	c4 c d c | c2 a |
  bes a4 g~ | g f2 e4 | f2 c'2 |

  c4 c d c | c2 a |
  bes a4 g~ | g f2 e4 | f2 b4 \rest a |

  g e f d | c2 b'4 \rest c |
  c c d c | c2 a |
  bes a4 g~ | g f2 e4 | \time 1/2 f2 \bar "|."
  }}

alto=\context Voice = "alto"   {
  \voiceTwo
  \relative c' {
	a'2 a4 f f f e2 d d
	c4 c d4.( a8 c4) c c2
	a'2 a4 f f f e2 d d
	c4 c d4.( a8 c4) c c2
	s4 f d c c b c8( d e4) s
	e4 g f f f e2 d d
	f4 d e( f g) c, c2
  }}

tenor = \context Voice = "tenor"   {
  \voiceOne
  \relative c' {
	c2 c4 a bes a g2 f f
	a4 c bes( a2) g4 a2
	c2 c4 a bes a g2 f f
	a4 c bes( a2) g4 a2
	d,4 \rest c'4 bes a a g g2 d4 \rest
	g4 g a bes a g2 fis g
	c4 bes a2 g a
  }}

bass = \context Voice = "bass"   {
  \voiceTwo
  \relative c' {
	f,2 f4 f bes f c2 d bes
	f'4 e d2 c f
	f2 f4 f bes f c2 d bes
	f'4 e d2 c f
	s4 f g a f g c,2 s4
	c4 e f bes, f' c2 d g,
	a4 bes c2 c <<f f,>>
  }}

stanzaa = \lyricmode {
  \set stanza = #"1. "
  Es ist ein Ros ent -- sprung -- en,
  aus ein -- er Wur -- zel zart,
  wie uns die Alt -- en sung -- en,
  von Jes -- se kam __ die Art
  \set associatedVoice = "tenors"
  Und hat ein Blüm -- lein bracht
  \unset associatedVoice
  mit -- ten im kalt -- en Win -- ter,
  wohl zu der hal -- ben Nacht.
}

stanzab = \lyricmode {
  \set stanza = #"2. "
  Das Rös -- lein, das ich mein -- e,
  da -- von Je -- sai -- a sagt,
  ist Ma -- ri -- a die rei -- ne
  die uns das Blüm -- lein bracht.
  \set associatedVoice = "tenors"
  Aus Got -- tes ew’ -- gem Rat
  \unset associatedVoice
  hat sie ein Kind ge -- bor -- en
  und blieb ein rei -- ne Magd.
}

stanzac = \lyricmode {
  \set stanza = #"3. "
  Das Blüm -- e -- lein, so klein -- e,
  das duf -- tet uns __ so süß,
  mit sein -- em hel -- len Schein -- e
  ver -- treibt’s die Fin -- ster -- nis.
  \set associatedVoice = "tenors"
  Wahr Mensch und wahr -- er Gott,
  \unset associatedVoice
  hilft uns aus al -- lem Leid -- e,
  ret -- tet von Sünd und Tod.
}

bassWordsa = \lyricmode {
  \repeat unfold 10 { \skip 1 }
  Wur -- zel zart,
  \repeat unfold 10 { \skip 1 }
  kam die Art
  \repeat unfold 16 { \skip 1 }
  hal -- ben Nacht.
}
bassWordsb = \lyricmode {
  \repeat unfold 10 { \skip 1 }
  -sai -- a sagt,
  \repeat unfold 10 { \skip 1 }
  Blüm -- lein bracht.
  \repeat unfold 16 { \skip 1 }
  rei -- ne Magd.
}
bassWordsc = \lyricmode {
  \repeat unfold 10 { \skip 1 }
  uns so süß,
  \repeat unfold 10 { \skip 1 }
  Fin -- ster -- nis.
  \repeat unfold 16 { \skip 1 }
  Sünd und Tod.
}

verses = \markup{
  \fill-line {
    \column{
      \line { \bold "English - Verse 1:" }
      \line{ Lo, how a Rose e’er blooming }
      \line{ from tender stem hath sprung! }
      \line{ Of Jesse’s lineage coming, }
      \line{ as men of old have sung. }
      \line{ It came, a floweret bright, }
      \line{ Amid the cold of winter, }
      \line{ when half spent was the night. }
    }
    \column{
      \line { \bold "Verse 2:" }
      \line { Isaiah ’twas foretold it, }
      \line { the Rose I have in mind; }
      \line { With Mary we behold it, }
      \line { the virgin mother kind. }
      \line { To show God’s love aright, }
      \line { She bore to men a Saviour, }
      \line { when half spent was the night. }
    }
  }
}

\score {	%\transpose d c
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
    % \lyricsto "bass" \context Lyrics = "bass-a" {
      % \bassWordsa }
    % \lyricsto "bass" \context Lyrics = "bass-b" {
      % \bassWordsb }
    % \lyricsto "bass" \context Lyrics = "bass-c" {
      % \bassWordsc }
  >>
  \layout {
    indent = 0.0\pt
    \context {
      \ChordNames
      \override ChordName  #'style = #'american
      chordChanges = ##t
    }
    \context {
      \Staff
      \remove Time_signature_engraver
    }
  }
}
\verses
