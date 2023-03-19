ODS PDF FILE="Correlation.pdf";
TITLE "Correlation analysis of Make as the explanatory variable and Correlation reponse variable";
FOOTNOTE " Dne on %sysfunc(time(),timeampm.)";
data cars;
set sashelp.cars;
PROC CORR; VAR Invoice MSRP Weight;
RUN;
ODS PDF CLOSE;