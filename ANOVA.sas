
ODS pdf file="ANOVA";
TITLE "ANOVA analysis of Make as the explanatory variable and Invoice reponse variable";
FOOTNOTE "Done on &sysdate9 %sysfunc(time(),timeampm.)";
data cars;
set sashelp.cars;
/*IF Make = "Audi" OR Make = "BMW" OR Make ="";*/
PROC ANOVA; CLASS make;
MODEL invoice=make;
MEANS make/DUNCAN;
RUN;
ODS PDF CLOSE;
TITLE "";
FOOTNOTE "";