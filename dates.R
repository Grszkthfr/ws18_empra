# creates date frame for dates in class

### Library
library(magrittr)
library(dplyr)
library(stringi)
library(knitr)
library(kableExtra) ## to do for "Awesome HTML Table with knitr::kable"

###17 Sitzungen (inkl. Vorlesungsfreitage/ -zeit)
Nr. <- c(1:17)

### Daten für jede Sitzung
Termine <- c()

for (i in Nr.){
    day <- (as.Date("2018-10-15") + (i*7-7)) %>% format("%d. %B %Y")
    Termine <- c(Termine,day)
}


### Thema für jede Sitzung
Thema <- c(

    ### Sitzung 1
    'Orga, Kennenlernen, Wissenschaft, [Folien](slides/sitzung01-orga.html)',

    ### Sitzung 2
    'Lernziele, Inhalt, [Folien](slides/sitzung02-inhalt.html)',

    ### Sitzung 3
    'experimentelles Design, Präregistrierung, [Folien](slides/sitzung03-vorbereitung.html)',

    ### Sitzung 4
    'Präregistrierung, [Stimuli präparieren](material/instruction-stim_prep.html), [Folien](slides/sitzung04-prereg.html)',

    ### Sitzung 5
    'Präregistrierung ([Power](http://rpsychologist.com/d3/NHST/)), Stimuli, [Folien](slides/sitzung05-power.html)',

    ### Sitzung 6
    'Pilotieren, [Folien](slides/sitzung06-pilot.html)',

    ### Sitzung 7
    '~~Programmieren~~ Pilotieren/[*Erhebung*](material/instruction-experiment.html), [Folien](slides/sitzung07-start.html)',

    ### Sitzung 8
    '**Entfällt**',

    ### Sitzung 9
    'Auswertung (tidy data), [Datenrangeln](material/01_read_wrangle_data.html), [Folien](slides/sitzung08-rangeln.html)',

    ### Sitzung 10
    'Auswertung (stats), [Fragebogendaten](material/fragebogendaten.html), [Folien](slides/sitzung09-modeln.html)',

    ### Sitzung 11: Weihnachten
    '**Entfällt**',

    ### Sitzung 12: Neujahr
    '**Entfällt**',

    ### Sitzung 13
    'Poster (Allgemein), [Folien](slides/sitzung10-auswertung.html)',

    ### Sitzung 14
    'Poster (Texte/Gestaltung), [Folien](slides/sitzung11-poster.html)',

    ### Sitzung 15
    '*Poster (Texte/Gestaltung)*',

    ### Sitzung 16
    '*Poster (Gestaltung)*',

    ### Sitzung 17
    "Prüfung und Posterkongress vsl. am Mittwoch, den 06. Februar 2019" 
) 

### Nr. Termin Thema in einer Tabelle
sitzungen <- data.frame(Nr., Termine, Thema) %>% 

    ### Vorlesungsfreie Tage
    filter(

        ### Weihnachten
        Termine != "24. Dezember 2018",

        ### Silvester
        Termine != "31. Dezember 2018") %>% 

    mutate(

        ### Anzahl Sitzungen ohne vorlesungsfreie Tage
        'Nr.' = 1:n())

### Tabelle in html für slides
sitzung_html <- 
    sitzungen %>%

    ### delete link to other slides in html table
    mutate(
        Thema = ifelse(
            stri_detect_coll(Thema, "Folien"),
            stri_extract_all_regex(Thema, ".+?(?=, \\[Folien\\])"),
            as.character(Thema))) %>% 

    kable(
        format = 'html',
        table.attr = "style='width:100%;'",
        align = c("c","c","l"))

### Tabelle in markdown für index.md
sitzung_md <- kable(sitzungen, format = 'markdown', align = c("c","c","l"))

rm(day, i, Nr., Thema, Termine)
