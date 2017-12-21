\version "2.14.2"
\header {
  filename = "o_come_o_come.ly"
  enteredby = "Gordon Gilbert and Ben Kuhn"
  composer = "Ancient plainsong"
  arranger = "arr. Thomas Helmore"
  poet = "trans. John M. Neale and Henry Sloane Coffin"
  date=""
  title = "Veni, Veni Emmanuel"
  index_as = "O Come O Come Emmanuel"
  metre = "8.8.8.8.8.8. with Refrain"
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2017/Dec/2"
}
\include "header.ly"
global = {
  \preamble
  \key e \minor
  \time 4/4
  \partial 4
}

sop = \context Voice = "sop" {
  \relative c' {
    \voiceOne
    e4 |
    g b b b |
    a( c b) a |
    g2. a4 |
    b g e g |

    a( fis e) d |
    e2. a4 |
    a e e fis |
    g2( fis4) e |

    d2. g4 |
    a b b b |
    a( c b) a |
    g2. \bar "||" \break

    d'4 |
    d2. b4 |
    b2. b4 |
    a( c b) a |
    g2. a4 |
    b g e g |
    a( fis e) d |
    e2. \bar "|."
  }
}

alto = \context Voice = "alto" {
  \relative c' {
    \voiceTwo
    b4 |
    e b d g |
    g2. fis4 |
    g2. d4 |
    d d c b |

    c2(  b4) b |
    b2. e8[ d] |
    c4 c e dis |
    e2( d4) cis |

    d2. b4 |
    d d d g |
    g2. fis4 |
    g2. |

    g4 |
    fis2. g4 |
    fis2. g4 |
    g2. fis4 |
    g2. fis4 |
    g d e e |
    e( c b) b |
    b2.
  }
}

tenor = \context Voice = "tenor" {
  \relative c' {
    \voiceOne
    g4 |
    b fis g d' |
    e2( d4) c |
    b2. fis4 |
    g g g g |

    e( a g) fis |
    g2. a4 |
    a a b a |
    b( a a) g |

    fis2. g4 |
    fis fis g d' |
    e2( d4) c |
    b2. |

    b4 |
    a2. e'4 |
    d2. d4 |
    e2( d4) c |
    b2. d4 |
    d d c b |
    a2( g4) fis |
    g2.
  }
}

bass = \context Voice = "bass" {
  \relative c {
    \voiceTwo
    e4 |
    e d b g |
    c( a b) d |
    e2. d4 |
    g, b c e |

    a,2( b4) b |
    e2. c8[ b] |
    a4 a' g fis |
    e( cis d) a |

    d2. e4 |
    d b g b |
    c( a b) d |
    g,2. |

    g'4 |
    d2. e4 |
    b2. g4 |
    c( a b) d |
    e2. d4 |
    g b, c e |
    c( a b) b |
    e2.
  }
}

stanzaa = \lyricmode {
  Ve -- ni, ve -- ni Em -- man -- u -- el!
  Cap -- ti -- vum sol -- ve Is -- ra -- el!
  Qui ge -- mit in ex -- i -- li -- o,
  Pri -- va -- tus De -- i Fi -- li -- o,
  Gau -- de, gau -- de, Em -- man -- u -- el
  Na -- sce -- tur pro te, Is -- ra -- el.
}
stanzab = \lyricmode {
  Ve -- ni, O Sap -- i -- en -- ti -- a,
  quae hic dis -- po -- nis om -- ni -- a,
  ve -- ni, vi -- am pru -- den -- ti -- ae
  ut do -- ce -- as et glo -- ri -- ae.
}
stanzac = \lyricmode {
  Ve -- ni, ve -- ni, A -- do -- na -- i,
  qui pop -- u -- lo in Si -- na -- i
  le -- gem de -- dis -- ti ver -- ti -- ce
  in ma -- jes -- ta -- te glo -- ri -- ae.
}
stanzad = \lyricmode {
  Ve -- ni, O Jess -- e vir -- gu -- la,
  ex host -- is tu -- os un -- gu -- la,
  de spec -- u tu -- os tar -- tar -- i
  e -- duc et an -- tro bar -- a -- thri.
}

verses = \markup{
  \fill-line {
    \column {
      \line { \huge \bold "5." }
      \line { \huge "Veni, Clavis Davidica," }
      \line { \huge "regna reclude caelica," }
      \line { \huge "fac iter tutum superum," }
      \line { \huge "et claude vias inferum." }
    }
    \column {
      \line { \huge \bold "6." }
      \line { \huge "Veni, veni O Oriens," }
      \line { \huge "solare nos adveniens," }
      \line { \huge "noctis depelle nebulas," }
      \line { \huge "dirasque mortis tenebras." }
    }
    \column {
      \line { \huge \bold "7." }
      \line { \huge "Veni, veni, Rex Gentium," }
      \line { \huge "veni, Redemptor omnium," }
      \line { \huge "ut salvas tuos famulos" }
      \line { \huge "peccati sibi conscios." }
    }
  }
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
\verses
