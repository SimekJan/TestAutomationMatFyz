*** Settings ***
Library  Browser

#Resource        include jiných filů (Page Object Model) 

#Suite Setup     před spuštěním všech testů    
#Test Setup      před spuštěním každého testu


*** Variables ***
${loc_vyucujici}  id=ujmeno
${loc_title}  id=stev_nazev_modulu
${loc_modul_predmety}  id=hint_predmety
${loc_nazev_predmetu}  id=nazev
${loc_checkbox}  id=srch_pam_a
${loc_semestr}  id=sem
${loc_letni_semestr}  id=utyp_2
${loc_hledej_button}  text=Hledej
${loc_kod}  

${Kod_Soft_Ing}  NSWI041

*** Test Cases ***
Vyhledani predmetu podle vyhledavacich kriterii
    Open Sis
    Open Predmety
    Filter Soft Ing
    
    # Get Text  class=link2  ==  ${Kod_Soft_Ing}

    Sleep  5s

*** Keywords ***
Open WebPage
    [Arguments]  ${URL}
    New Browser  browser=chromium  headless=False
    New Context
    New Page  url=${URL}

Open Sis
    Open WebPage  https://is.cuni.cz/studium/index.php
    Get Text  ${loc_title}  ==  Studijní informační systém

Open Predmety
    Click  ${loc_modul_predmety}  left

    Get Text  ${loc_title}  ==  Předměty

Filter Soft Ing
    Fill Text  ${loc_nazev_predmetu}  Úvod do softwarového

    Check Checkbox  ${loc_checkbox}
    Select Options By  ${loc_semestr}  text  letní

    Fill Text  ${loc_vyucujici}  Nečaský

    Click  ${loc_letni_semestr}  left

    Click  ${loc_hledej_button}

