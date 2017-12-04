\header {
  filename = "bring_a_torch.ly"
  enteredby = "Maia McCormick"
  composer = "16th Century French Carol"
  arranger = "arr. Edward Cuthbert Nunn"
  poet = "Émile Blémont (1839–1927)"
  meter = "trans. Edward Cuthbert Nunn"
  title = "Bring a Torch, Jeanette, Isabella!"
  index_as = "Un flambeau, Jeannette, Isabelle!"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2017/Dec/02"
}

\version "2.14.2"

\include "header.ly"

global= {
  \key f \major
  \time 3/8
}

sop = \context Voice = "sop" {
  \relative c'' {
    \voiceOne
    \tempo "Brightly"
    \slurDotted
    c4 f,8 | f( e) f |
    g( a) bes | a4 g8 |
    c4 f,8 | f( e) f |
    g( a) g | f4 b8\rest |

    c4 c8 | c8( bes) a | a g f | f4( e8) |
    d( e) f | c4 c8 | bes'4 bes8 | a4 g8 \bar "||"

    f4 b8\rest | g4 b8\rest | a8( bes) a | g4 c8 | a4 g8 |
    f4 b8\rest | g4 b8\rest | a( bes) a | g4 c8 |
    f,4.~ | f \bar "|."
  }
}

alto=\context Voice = "alto"   {
  \relative c' {
    \voiceTwo
    \slurDotted
    f4 c8 | d( d) d |
    d( d) d | f4 e8 |
    f4 c8 | d( d) d |
    d( d) e | c4 s8 |

    f4 f8 | f8( f) f | f e d | c4( c8) |
    d( c) d | c4 c8 | d4 d8 | f4 e8 |

    d4 s8 | e4 s8 | f8( f) f | g4 e8 | f4 e8 |
    d4 s8 | d4 s8 | f( f) f | f4 e8 |
    c4.~ | c |
  }
}

tenor = \context Voice = "tenor"   {
  \relative c' {
    \voiceOne
    \slurDotted
    a4 a8 | a( g) a |
    g( fis) g | \slurSolid f( a) c |
    \slurDotted
    c4 f,8 | a( g) a |
    g( g) g | a4 s8 |

    c4 c8 | c8( c) c | b b g | a4( g8) |
    bes( bes) f | f4 f8 | d4 f8 | \slurSolid f( c') bes |

    \slurDotted
    a4 s8 | c4 s8 | c8( c) c | c4 c8 | c4 bes8 |
    a4 s8 | g4 s8 | f( g) f | c'4 bes8 |
    a4.~ | a |
  }

}

bass = \context Voice = "bass"   {
  \relative c {
    \voiceTwo
    \slurDotted
    f4 f8 | d( d) d |
    bes( a) g | c4 bes8 |
    a4 a8 | d( d) d |
    bes( bes) c | f4 d8\rest |

    a'4 a8 | a8( g) f | f f e | c4( c8) |
    bes( bes) bes | a4 a8 | g4 g8 | c4 c8 |

    d4 d8\rest | c4 d8\rest | f8( g) f | e4 c8 | f4 c8 |
    d4 d8\rest | bes4 d8\rest | c( c) c | c4 c8 |
    <<f4.~ \parenthesize f,~ >> | <<\parenthesize f f'>> |
  }
}
accomp=\chordmode {

}
stanzaa = \lyricmode {
  Bring a torch,
  \set ignoreMelismata = ##t
  Jean -- nette, Is -- a -- bel -- la!
  Bring a torch, to the \unset ignoreMelismata cra -- dle, run!

  \set ignoreMelismata = ##t
  It is Je -- sus, good folk of the vil -- lage;
  \unset ignoreMelismata
  Christ is born and Ma -- ry’s call -- ing:
  \set ignoreMelismata = ##t
  Ah! ah! beau -- ti -- ful is the Moth -- er;
  Ah! ah! beau -- ti -- ful is her Son!
}

stanzab = \lyricmode {
  \set ignoreMelismata = ##t
  It is wrong when the \unset ignoreMelismata Child is sleep -- ing,
  It is wrong to talk so loud;

  \set ignoreMelismata = ##t
  Si -- lence, all, \unset ignoreMelismata as you gath -- er a -- round,
  Lest your noise should wak -- en Je -- sus:
  \unset ignoreMelismata
  Hush! hush! see how fast He slum -- bers!
  Hush! hush! see how fast He sleeps!
}
stanzac = \lyricmode {
  Soft -- ly to the lit -- tle sta -- ble,
  Soft -- ly for a mo -- ment come;
  Look and see how
  \set ignoreMelismata = ##t
  charm -- ing is Je -- sus,
  How He is white, His cheeks are ros -- y!
  Hush! hush! see how the Child is sleep -- ing;
  Hush! hush! see how He smiles in dreams.
}
stanzad = \lyricmode {

}
stanzae = \lyricmode {

}
stanzaf = \lyricmode {

}

\score {	%\transpose g f
  \context ChoirStaff <<
    \context ChordNames \accomp
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
                                %	\lyricsto "sop" \context Lyrics = "stanza-4" {
                                %		\set stanza = "4."
                                %			\stanzad }
                                %	\lyricsto "sop" \context Lyrics = "stanza-5" {
                                %		\set stanza = "5."
                                %			\stanzae }
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

