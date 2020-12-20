\version "2.18.0"

#(set-default-paper-size "a4")
#(set-global-staff-size 16.2)
#(ly:set-option 'point-and-click #f)
%mobile -s15.5 -i3.4

italicas=\override LyricText.font-shape = #'italic
rectas=\override LyricText.font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
incipitwidth = 20

\header {
	title="O magnum mysterium"
	composer="Tomás Luis de Victoria (c.1548-1611)"
	enteredby = "Nancho Alvarez (http://tomasluisdevictoria.org)"
  	maintainer = "Maia McCormick"
  	maintainerEmail = "maia.mcc@gmail.com"
  	lastupdated = "2020/Dec/19"
  	tagline = ""
  	copyright = ""
}


global =  {\time  2/2  \skip 1*39 \break
			\skip 1*13  \time 3/4 \skip 4*42
			\time 2/2  \skip 1*8  \bar "|."}

cantus = {
	a'1 |
	d'2 a' ~ |
	a'4 a' bes' bes' |
	a'2 r4 d'' |
%5
	bes' c'' d''4. d''8 |
	d''4 a' bes' a' ~ |
	a'8 g' f' e' f' g' a' f' |
	 g'[ f']  f'[ e'16 d'] e'2 ~ |
	e' d' |
%10
	fis'1 |
	g'2 fis'4. g'8 |
	a'4 bes'4. a'8 g'4 ~ |
	g' fis' g' \ss f'8 e' |
	d'4 e' f'2 |
%15
	r4 d'' bes' c'' |
	d''4. d''8 d''4 bes' |
	g' a' bes'4. bes'8 |
	bes'4 a'4. g'8 g'4 ~ |
	g' fis' g'2 |
%20
	R1 |
	r4 bes' a'4. fis'8 |
	g'4 a' bes' g' |
	bes'4. bes'8 bes'4 bes' |
	a'2 a' |
%25
	fis'4 a' a'4. a'8 |
	a'4 b' c''2 |
	bes'4. a'16 g' \[a'2 |
	bes'\] a' |
	R1 |
%30
	r4 d' g'2 |
	f'4 d' e' fis' |
	g'4. a'8 bes'4 bes' |
	a'2 r |
	R1 |
%35
	r4 g' c''2 |
	bes'4 g' a' b' |
	c''4.  bes'8[ a' g'] g'4 ~ |
	g' fis'8 e' fis'4 fis' |
	g'2 r |
%40
	fis'2. fis'4 |
	\ss fis'2 g' |
	fis'4. g'8 a'4 bes' ~ |
	bes'8 a' a'4. g'8 g'4 |
	a' fis'2 fis'4 |
%45
	g'4. g'8 g'2 |
	r4 g'4. a'8 bes' g' |
	a'4 d'' c''2 |
	bes'4 d'' c'' a' |
	bes'4.  a'8[ g' f']  f'[ e'16 d'] |
%50
	e'4 e' d' a' ~ |
	a' f'2 bes'4 ~ |
	bes'8 a' g'2 fis'4 |
	\once \override TextScript.X-offset = #-3.7
        \once \override TextScript.padding = #1
        s4*0^\markup{\musicglyph #"timesig.mensural34" \smaller \smaller \column { 3 \raise #1 2} \hspace #.7 \musicglyph #"noteheads.sM1mensural" }
	g'2 bes'4 |
	a'2 fis'4 |
%55
	g'4.  f'8[ g' a'] |
	bes'4 a'2 |
	bes' g'4 |
	f'2 d'4 |
	e'4.  d'8[ e' f'] |
%60
	g'2 fis'4 |
	g'2. |
	r4 r c'' |
	bes'4.  a'8[ bes' g'] |
	a'4 f'8 g' a' bes' |
%65
	c''2 c''4 |
	bes' d''2 |
	\once \override TextScript.X-offset = #-3.8
        \once \override TextScript.padding = #1
        s4*0^\markup{\raise #.5 \musicglyph #"timesig.mensural22"}
	d''1 |
	r4 d'' d''8 c'' bes' a' |
	g'4 c''4. bes'8 a' g' |
%70
	fis'4 g'2 fis'4 |
	g'1 ~ |
	g' ~ |
	g' ~ |
	g'\breve*1/2
}



altus ={
	R1 |
	r2 d' ~ |
	d' g |
	d'2. d'4 |
%5
	ees' ees' d'2 |
	r4 d' bes c' |
	d'4. d'8 d'4 a |
	bes d'2 cis'8 \ss b |
	cis'2 d' |
%10
	d'1 |
	d'2 d'4. e'8 |
	f'4 f g4. a8 |
	bes4 a g d' |
	d' c' a4. a8 |
%15
	a4 bes4. a8 g4 ~ |
	g fis g g' |
	d' f' f'4. f'8 |
	f'2 d'4 ees' |
	d'2 d' ~ |
%20
	d' r |
	r4 g' f'4. d'8 |
	e'4 fis' g' d' |
	d'4. d'8 d'4 e' |
	f'2 e' |
%25
	d'4 f' f'4. f'8 | %! fis en 1572
	f'4 f' g' a' ~ |
	a'8 g' g'2 fis'4 |
	g' d' f'4. e'16 f' |
	g'4 f'8 e' d'4 a |
%30
	r2 r4 g |
	d'2 c'4 a |
	b c' d'8 c' d' e' |
	f'4. e'16 f' g'4 f'8 e' |
	d'2 r4 a |
%35
	d'2 c'4 a |
	bes8 c' d' e' f'2 |
	g'4.  f'8[ ees' d'] ees'4 |
	d'2. d'4 |
	b2 r |
%40
	d'2. d'4 |
	d'2 d' |
	d'1 ~ |
	d' |
	d'2 r4 d' ~ |
%45
	d' d' ees'4. ees'8 |
	d'4 g8[ a bes c' d' e'] |
	f'4 f' f'2 |
	d'4 d' e' fis' |
	g'4.  f'8[ e' d'] d'4 ~ |
%50
	d' cis' d' f' ~ |
	f'8 e' d' c' d'2 |
	bes4 c' d'2 |
	d' g'4 |
	f'2 d'4 |
%55
	e'4.  d'8[ e' f'] |
	g'2 fis'4 |
	g'2 d'4 |
	d'2 a4 |
	c'2 c'4 |
%60
	d' d'2 |
	d' bes4 |
	g2 fis4 |
	g2 g'4 |
	f'2 d'4 |
%65
	e'4.  d'8[ e' f'] |
	g'2 fis'4 |
	g'2 r4 d' |
	d'8 c' bes a g4 g' ~ |
	g'8 f' ees' d' c'4 ees' |
%70
	d'2 r4 a |
	bes4. c'8 d'4 ees' ~ |
	ees' d' c'4. d'8 |
	ees'2 d' ~ |
	d'\breve*1/2
}



tenor = {
	R1 |
	R |
	R |
	R |
%5
	R |
	R |
	R |
	r2 a ~ |
	a d |
%10
	a2. a4 |
	bes bes a2 |
	r4 d' bes c' |
	d'4. d'8 d'4 a |
	bes a4. g8 f e |
%15
	\[f2 g\] |
	a bes4 d' |
	bes c' d'4. d'8 |
	d'4 c' bes c' |
	a2 g4 bes |
%20
	a4. f8 g4 a | %! fis en 1572
	bes g d'4. d'8 |
	c'4 a g bes |
	bes4. bes8 bes4 bes |
	c' d'2 cis'4 |
%25
	d' d d'4. d'8 |
	d'4 d' c'2 |
	ees' d' |
	r4 g d'2 |
	c'4 a b c' |
%30
	d'8 c' bes a g a bes g |
	a2. a4 |
	g2 r4 g |
	d'2 c'4 a |
	bes a4. g8 f e |
%35
	f4 g2 fis4 |
	g bes c' d' |
	ees'4.  d'8[ c' bes] c'4 |
	bes a8 g a4 a |
	g2 r |
%40
	a2. a4 |
	a2 bes |
	a2. g4 |
	\[a2 bes\] |
	a4 a2 a4 |
%45
	b4. b8 c'4 g8 a |
	bes c' d'2 bes4 |
	c' bes2 a4 |
	bes bes c' d' |
	g2. bes4 |
%50
	a1 |
	f |
	g2 a |
	\time 3/4 g g4 |
	d'2 d'4 |
%55
	c'2 c'4 |
	g d'2 |
	g bes4 |
	a2 f4 |
	g4. f8 g a |
%60
	bes4 a2 |
	g d4 |
	e c2 |
	d bes4 |
	a2 f4 |
%65
	g2 g4 |
	g a2 |
	\time 4/4 g4 bes a8 g f e |
	d4 g8 a bes c' d' bes |
	c'4. d'8 ees' d' c' bes |
%70
	a4 g a d' |
	d'8 c' bes a g4 bes |
	c' d' ees'4. d'8 |
	c'2. b8 a |
	b\breve*1/2
}



bassus = {
	R1 |
	R |
	R |
	R |
%5
	R |
	R |
	R |
	R |
	R |
%10
	d |
	g,2 d ~ |
	d4 d ees ees |
	d2 r4 d |
	bes, c d4. d8 |
%15
	d4 bes, ees2 |
	d g,4 g, |
	g f bes,4. bes,8 |
	bes,4 f g c |
	d2 g,4 g |
%20
	f4. d8 e4 fis |
	g2 r |
	r r4 g, |
	g4. g8 g4 g |
	f4. g8 a2 |
%25
	d r |
	R1 |
	r2 r4 d |
	g2 f4 d |
	e f g f8 e |
%30
	d4. f8 ees4 ees |
	d2 r |
	r4 c g2 |
	f4 d e f |
	g f8 e d4. c8 |
%35
	bes,4 a,8 g, a,4 a, |
	g, g f d |
	\[c1 |
	d2.\] d4 |
	g,2 r |
%40
	d2. d4 |
	d2 g, |
	d4. e8 fis4 g ~ |
	g8 fis fis4 g2 |
	d4 d2 d4 |
%45
	g4. g8 c2 |
	g2. g4 |
	f bes, f2 |
	bes, r |
	R1 |
%50
	r2 d ~ |
	d bes, |
	\[ees d\] |
	g, r4 |
	R2.  |
%55
	R2.  |
	R2.  |
	r2 g,4 |
	d2 d4 |
	c2 c4 |
%60
	g, d2 |
	g, g,4 |
	c a,2 |
	g, g,4 |
	d2 d4 |
%65
	c2 c4 |
	ees d2 |
	g,4 g f8 e d c |
	bes, a, g, f, g,2 |
	\[c1 |
%70
	d\] |
	g,4 g g8 f ees d |
	c4 b, c2 ~ |
	c g, ~ |
	g,\breve*1/2
}



textocantus=\lyricmode {
O ma -- gnum _ my -- ste -- ri -- um
et ad -- mi -- ra -- bi -- le sa -- cra -- men -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ tum,
o ma -- gnum __ _ _ my -- _ _ _ _ ste -- _ _ _ ri -- um
et ad -- mi -- ra -- bi -- le,
et ad -- mi -- ra -- bi -- le sa -- cra -- men -- _ _ tum
ut a -- ni -- ma -- li -- a vi -- de -- rent Do -- mi -- num na -- tum,
vi -- de -- rent Do -- mi -- num na -- _ _ _ _ tum
ia -- cen -- tem in præ -- _ se -- _ _ pi -- o
ia -- cen -- tem in præ -- _ se -- _ _ _ _ _ _ _ _ pi -- o.
O be -- a -- ta Vir -- _ _ _ _ _ _ _ _ go,
cu -- ius vi -- sce -- ra
me -- _ _ _ _ ru -- e -- runt
por -- ta -- re Do -- _ _ _ _ _ _ _ mi -- num Ie -- _ sum Chri -- _ _ _ _ stum.
Al -- le -- lu -- ia,
al -- _ _ le -- lu -- ia,
al -- le -- lu -- ia,
al -- _ _ le -- lu -- ia
al -- le -- _ _ _ _ lu -- _ _ _ ia,
al -- le -- lu -- ia
al -- le -- _ _ _ _ lu -- _ _ _ _ _ _ ia. _ _ _

}


textoaltus=\lyricmode {
O _ ma -- gnum  my -- ste -- ri -- um
et ad -- mi -- ra -- bi -- le sa -- cra -- men -- _ _ _ tum,
o ma -- gnum __ _ _ my -- ste -- _ _ ri -- um,
et ad -- mi -- ra -- bi -- le sa -- cra -- men -- _ _ tum,
et ad -- mi -- ra -- bi -- le sa -- cra -- men -- tum _
ut a -- ni -- ma -- li -- a vi -- de -- rent Do -- mi -- num na -- tum,
vi -- de -- rent Do -- mi -- num na -- _ _ _ _ tum,
ia -- cen -- _ _ _ _ _ _ tem
ia -- cen -- tem in præ -- _ se -- _ _ _ _ _ _ _ pi -- _ o
ia -- cen -- tem in præ -- _ _ _ _ se -- _ _ _ _ _ pi -- o.
O be -- a -- ta Vir -- _ go
cu -- _ ius vi -- sce -- ra
me -- _ _ _ _ _ _ ru -- e -- runt
por -- ta -- re Do -- _ _ _ _ _ mi -- num Ie -- _ _ _ _ _ sum __ _ Chri -- stum.
Al -- le -- lu -- ia,
al -- _ _ le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- _ _ le -- lu -- ia
al -- le -- _ _ _ _ lu -- _ _ _ _ _ _  ia
al -- le -- _ _ lu -- _ _ _ _ _ ia. _
}


textotenor=\lyricmode {
O _ ma -- gnum  my -- ste -- ri -- um
et ad -- mi -- ra -- bi -- le sa -- cra -- men -- _ _ _ _ _ _ tum,
et ad -- mi -- ra -- bi -- le sa -- cra -- _ men tum,
ut a -- ni -- ma -- li -- a,
ut a -- ni -- ma -- li -- a
vi -- de -- rent Do -- mi -- num na -- _ tum,
vi -- de -- rent Do -- mi -- num na -- tum
ia -- cen --  tem
in præ -- _ se -- _ _ _ _ _ _ _ _ pi -- o
ia -- cen -- tem in præ -- se -- _ _ _ _ _ pi -- o,
in præ -- _ se -- _ _ _ _ _ _ _ _ pi -- o.
O be -- a -- ta Vir -- _ _ _ go,
cu --  ius vi -- sce -- ra
me -- _ _ _ _ ru -- e -- _ _ runt
por -- ta -- re Do -- mi -- num Ie --  sum  Chri -- stum.
Al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- _ _ le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- _ _ _ _ lu -- _ _ _ _ _ _ _ _ _ _ _ _ _  ia,
al -- le -- _ _ _ _ lu -- _ _ _ _ _ _ _ ia.
}


textobassus=\lyricmode {
O ma -- gnum _  my -- ste -- ri -- um
et ad -- mi -- ra -- bi -- le sa -- cra -- men -- tum,
et ad -- mi -- ra -- bi -- le sa -- cra -- _ men tum,
ut a -- ni -- ma -- li -- a
vi -- de -- rent Do -- mi -- num __ _ na -- tum
ia -- cen --  tem
in præ -- _ se -- _ _ _ _ _ pi -- o
ia -- cen -- tem
in præ -- _ se -- _ _ _ _ _ _ _ _ pi -- o,
in præ -- _ se -- _ pi -- o.
O be -- a -- ta Vir -- _ _ _ _ _ _ _ go,
cu --  ius vi -- sce -- ra
me -- ru -- e -- _ _ runt
Ie -- _ sum  Chri -- _ stum.
Al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- lu -- ia,
al -- le -- _ _ _ _ _ _ _ _ lu -- _  ia,
al -- le -- _ _ _ _ _ lu -- _ ia. _
}

incipitcantus=\markup{
	\score{
		{
		\set Staff.instrumentName="Cantus "
		\override NoteHead.style = #'neomensural
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn
		\clef "petrucci-c1"
		\key f \major
		\time 2/2
		a'\breve
		}
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
		indent = 0
	}
	}
}


incipitaltus=\markup{
	\score{
		{
		\set Staff.instrumentName="Altus    "
		\override NoteHead.style = #'neomensural
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn
		\clef "petrucci-c3"
		\key f \major
		\time 2/2
		d'\breve
		}
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
		indent = 0
	}
	}
}


incipittenor=\markup{
	\score{
		{
		\set Staff.instrumentName="Tenor   "
		\override NoteHead.style = #'neomensural
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn
		\clef "petrucci-c4"
		\key f \major
		\time 2/2
		a\breve
		}
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
		indent=0
	}
	}
}


incipitbassus=\markup{
	\score{
		{
		\set Staff.instrumentName="Bassus "
		\override NoteHead.style = #'neomensural
		\override Rest.style = #'neomensural
		\override Staff.TimeSignature.style = #'neomensural
		\cadenzaOn
		\clef "petrucci-f4"
		\key f \major
		\time 2/2
		d\breve
		}
	\layout {
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver
		}
		line-width=\incipitwidth
		indent = 0
	}
	}
}





\score {\transpose c' d'{
\new ChoirStaff<<

	\new Staff <<\global
	\new Voice="v1" {
		\set Staff.instrumentName=\incipitcantus
		\clef "treble"
		\cantus }
	\new Lyrics \lyricsto "v1" {\textocantus }
	>>


	\new Staff << \global
	\new Voice="v2" {
		\set Staff.instrumentName=\incipitaltus
		\clef "treble"
		\altus}
	\new Lyrics \lyricsto "v2" {\textoaltus }
	>>


	\new Staff <<\global
	\new Voice="v3" {
		\set Staff.instrumentName=\incipittenor
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\textotenor }
	>>


	\new Staff <<\global
	\new Voice="v4" {
		\set Staff.instrumentName=\incipitbassus
		\clef "bass"
		\bassus }
	\new Lyrics \lyricsto "v4" {\textobassus }
	>>

>>

	}%transpose

\layout{
	\context {\Lyrics
		\override VerticalAxisGroup.staff-affinity = #UP
		\override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
			#'((basic-distance . 0) (minimum-distance . 0) (padding . 1))
		\override LyricText.font-size = #1.2
		\override LyricHyphen.minimum-distance = #0.5
	}
	\context {\Score
		tempoHideNote = ##t
		\override BarNumber.padding = #2
	}
	\context {\Voice
		melismaBusyProperties = #'()
		%autoBeaming = ##f
	}
	\context {\Staff
                %\RemoveEmptyStaves
                %\override VerticalAxisGroup.remove-first = ##t
		\override VerticalAxisGroup.staff-staff-spacing =
			#'((basic-distance . 11) (minimum-distance . 0) (padding . 1))
		\consists Ambitus_engraver
		\override LigatureBracket.padding = #1
	}
}

%\midi { \mtempo }

}


\paper{
	ragged-last-bottom = ##f
	indent=3.5\cm
	system-system-spacing =
	#'((basic-distance . 20) (minimum-distance . 0) (padding . 5))
	top-system-spacing = % header
	#'((basic-distance . 9) (minimum-distance . 0) (padding . 0))
	last-bottom-spacing = % footer
	#'((basic-distance . 12) (minimum-distance . 0) (padding . 0))
        markup-system-spacing.padding = #1.5
    print-page-number = false
}
