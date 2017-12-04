\header {
  enteredby = "Gordon Gilbert/Maia McCormick"
  composer = "Franz Gruber, 1818"
  poet = "Rev. Joseph Mohr, 1818"
  date="trans 1863 by Jane Campbell"
  title = "Stille Nacht"
  index_as = "Silent Night"
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Maia McCormick"
  maintainerEmail = "maia.mcc@gmail.com"
  lastupdated = "2017/Nov/29"
}

\version "2.14.2"

\include "header.ly"

global= {
  \preamble

  \time 6/8
  \key bes \major
}

sop = \context Voice = "sop"    {
  \voiceOne
  f'8.( g'16) f'8 d'4.
  f'8. g'16 f'8 d'4.
  c''4 c''8 a'4. bes'4 bes'8 f'4.
  \slurDashed
  g'4 g'8 bes'8.( a'16) g'8 f'8. g'16 f'8 d'4.
  g'4 g'8 bes'8.( a'16) g'8 f'8.( g'16) f'8 d'4.
  \slurSolid
  c''4 c''8 ees''8. c''16 a'8 bes'4.( d'')
  bes'8( f') d' f'8. ees'16 c'8 bes2. \bar "|."
}

alto=\context Voice = "alto"   {
  \voiceTwo
  d'8.( ees'16) d'8 bes4.
  d'8. ees'16 d'8 bes4.
  ees'4 ees'8 ees'4. d'4 d'8 d'4.
  \slurDashed
  ees'4 ees'8 g'8.( f'16) ees'8 d'8. ees'16 d'8 bes4.
  ees'4 ees'8 g'8.( f'16) ees'8 d'8.( ees'16) d'8 bes4.
  \slurSolid
  ees'4 ees'8 ees'8. ees'16 c'8 d'4.( f')
  d'4 bes8 a8. a16 a8 bes2.
}

tenor = \context Voice = "tenor"   {
  \voiceOne
  bes4 bes8 f4.
  bes4 bes8 f4.
  a4 a8 c'4. bes4 bes8 bes4.
  \slurDashed
  bes4 bes8 g8.( a16) bes8 bes8. bes16 bes8 f4.
  bes4 bes8 \slurDashed g8.( a16) bes8 bes8.( bes16) bes8 f4.
  \slurSolid
  a4 a8 a8. a16 f8 f4.( bes)
  f4 f8 f8. f16 ees8 d2.
}

bass = \context Voice = "bass"   {
  \voiceTwo
  bes,4 bes,8 bes,4.
  bes,4 bes,8 bes,4.
  f4 f8 f4. bes,4 bes,8 bes,4.
  ees4 ees8 ees4 ees8 bes,8. bes,16 bes,8 bes,4.
  ees4 \slurDashed ees8 ees8.( es16) ees8 bes,8.( bes,16) bes,8 bes,4.
  \slurSolid
  f4 f8 f8. f16 f8 bes,2.
  f,4 f,8 f,8. f,16 f,8 bes,2.
}
accomp=\chordmode {

}



stanzaa = \lyricmode {
  Stil -- le Nacht!
  hei -- li -- ge Nacht!
  Al -- les schläft;
  ein -- sam wacht.
  Nur das
  \set ignoreMelismata = ##t
  trau -- te hoch -- hei -- li -- ge Paar.
  Hol -- der Kna -- be im lock -- i -- gen Haar,
  \unset ignoreMelismata
  Schlaf in himm -- li -- scher Ruh! __
  Schlaf in himm -- li -- scher Ruh! __
}

stanzab = \lyricmode {
    Stil -- le Nacht!
    hei -- li -- ge Nacht!
    Hir -- ten erst kund -- ge -- macht,
    Durch der En -- gel Hal -- le -- lu -- ja!
    Tönt es laut __ von fern __ und nah:
    Christ, der Ret -- ter ist da! __
    Christ, der Ret -- ter ist da! __
  }

stanzac = \lyricmode {
  Stil -- le Nacht!
  hei -- li -- ge Nacht!
  Got -- tes Sohn, o wie lacht
  Lieb’ aus dein -- em göt -- tlich -- en Mund,
  Da uns schlägt die
  \set ignoreMelismata = ##t
  ret -- ten -- de Stund’.
  \unset ignoreMelismata
  Christ, in dein -- er Ge -- burt! __
  Christ, in dein -- er Ge -- burt! __
}

stanzad = \lyricmode {

}
stanzae = \lyricmode {

}
stanzaf = \lyricmode {

}

verses = \markup{
  \fill-line {
    \column{
      \line { \bold "English - Verse 1:" }
      \smaller {
        \line{ Silent night! Holy night!}
        \line{ All is calm, all is bright,}
        \line{ Round yon Virgin Mother & Child!}
        \line{ Holy Infant, so tender and mild,}
        \line{ Sleep in heavenly peace! (2x) }
      }
    }
    \column{
      \line { \bold "Verse 2:" }
      \smaller {
        \line{ Silent night! Holy night! }
        \line{ Shepherds quake at the sight! }
        \line{ Glories stream from Heaven afar, }
        \line{ Heavenly Hosts sing Alleluia! }
        \line{ Christ, the Saviour, is born! (2x) }
      }
    }
    \column{
      \line { \bold "Verse 3:" }
      \smaller {
        \line{ Silent night! Holy night! }
        \line{ Son of God, love’s pure light }
        \line{\smaller Radiant beams from Thy Holy Face }
        \line{ With the dawn of redeeming grace, }
        \line{ Jesus, Lord, at Thy Birth! (2x) }
      }
    }
  }
}

\score {
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
\verses
