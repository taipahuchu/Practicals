

data cars;
set sashelp.cars;
PROC CORR; VAR Invoice MSRP Weight;
RUN;
ODS PDF FILE="Correlation.pdf";
TITLE "Correlation analysis of Make as the explanatory variable and Correlation reponse variable";

data cars;
SET sashelp.cars;
IF Invoice >= 25218 then Cost = 1;
ELSE COST = 0;
IF MSRP >= 27560 then Efficiency = 1;
ELSE Efficiency = 0;

PROC SORT ; BY cost;
PROC ANOVA;CLASS Efficiency;
MODEL Weight=Efficiency;
Means Efficiency;BY COST;
proc sort;by weight;
PROC FREQ; Tables COST*Efficiency/CHISQ; 
/*PROC GCHART; VBAR cost/discrete type=mean sumvar= Efficiency; */
proc sort;by Make;
PROC CORR; VAR Invoice MSRP;
/*BY Make;*/
RUN;
FOOTNOTE " CONCULSION 1: A Pearson correlation = 0.0001 < 0.05,is strong a linear association between 3 distributed random variables (Invoice,MSRP,Weight);
CONCULSION 2: A Chi-sqaured = 0.0047 < 0.05,there is an association between Cost varible and Efficiency varible
CONCULSION 3: A Pearson correlation = 0.0001 < 0.05,there is no differences between the cost and Efficiency means";
ODS PDF CLOSE;