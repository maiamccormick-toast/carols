\header {
  composer = "Trad. English, adapted by Arthur Sullivan"
  poet = "Edmund Hamilton Sears, 1810-1876"
  title = "It Came Upon the Midnight Clear (Sullivan)"
  enteredby = "Maia McCormick"
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2019/Dec/12"
}

\version "2.14.2"

\include "header.ly"

global= {
  \preamble
  \time 4/4
  \key f \major

  \partial 4
}

sop = \context Voice = "sop"    {
  \voiceOne
  \relative c' {
    f8( g) |
    a4 g f g8( a) | bes4 a g c | c a bes8( c) d4 | c2. \bar""
    a8( bes) | c4 c a f | bes a g  f8( g) | a( bes) c4 a g | f2. \bar""
    f4 | e d e g | f4. e8 d4 a' | g f e d | c2. \bar""
    c4 | c' bes a g8( a) | bes4 a g f8( g) | a( bes) c4 a g f2.
   \bar "|."
  }}

alto=\context Voice = "alto"   {
  \voiceTwo
  \relative c' {
    f4 |
    f e f d8( f) | e4 f e e | f4 f f f | f2.
    f4 | e e f f | f f e f | f c f e | c2.
    d4 | cis d d cis | d4. cis8 d4 f | e d c? b | c2.
    c4 | a'4 g fis e8( fis) | g( e) f?4 e f | f8( g) a4 f e | c2.
  }}

tenor = \context Voice = "tenor"   {
  \voiceOne
  \relative c' {
    a8( bes) |
    c4 c a d8( c) | bes4 c c c | c c bes bes | a2.
    c4 | c g f a | d c c a | f f c' bes | a2.
    f4 | g a bes a | a4. g8 f4 b | c a g f | e2.
    c4 | c' c c bes8( a) | g4 c c a | c4. c8 c4 bes | a2.
  }}

bass = \context Voice = "bass"   {
  \voiceTwo
  \relative c {
    f4 |
    f c f bes8( a) | g4 f c bes' | a f d bes | f'2.
    f4 | c c d d | bes f' c f | d a8( bes) c4 c | f2.
    d4 | e f g a | d,4. d8 d4 d | e f g g, | c2.
    c4 | a bes8( c) d4 d | g, a8( bes) c4 d | a' g8( f) c4 c | <<f2. f, >>
  }}

stanzaa = \lyricmode {
  It came up -- on the mid -- night clear,
  That glor -- ious song of old,
  From an -- gels bend -- ing near the earth
  To touch their harps of gold:
  'Peace on the earth, good -- will to men
  From Heav'n's all -- grac -- ious King!'
  The world in sol -- emn still -- ness lay
  To hear the an -- gels sing!
}

stanzab = \lyricmode {
  Still through the clo -- ven skies they come
  With peace -- ful wings un -- furl'd;
  And still their heav'n -- ly mu -- sic floats
  O'er all the wea -- ry world;
  A -- bove its sad and low -- ly plains
  They bend on hov'r -- ing wing,
  And ev -- er o'er its Ba -- bel sounds
  The bless -- ed an -- gels sing!
}

stanzac = \lyricmode {
  And ye, be -- neath life's crush -- ing load,
  Whose forms are bend -- ing low,
  Who toil a -- long the climb -- ing way
  With pain -- ful steps and slow,
  Look now! for glad and gold -- en hours
  Come swift -- ly on the wing;
  O rest be -- side the wea -- ry road,
  And hear the an -- gels sing!
}

stanzad = \lyricmode {
  For lo! the days are has -- t'ning on,
  By pro -- phet bards fore -- told,
  When with the ev -- er cir -- cling years
  Comes round the age of gold;
  When peace shall o -- ver all the earth
  Its an -- cient splen -- dors fling,
  And the whole world send back the song
  Which now the an -- gels sing!
}
stanzae = \lyricmode {

}
stanzaf = \lyricmode {

}

\score {
  \transpose f g
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
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
