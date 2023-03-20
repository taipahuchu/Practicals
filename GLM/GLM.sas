ODS PDF file= "GLM.pdf";
DATA cars;
SET sashelp.cars;
IF Make = "Acura" or Make= "BMW";
iF MAKE = "Acura" THEN Maked = 1;
IF Make = "BMW" THEN Maked =0;
Weight_adj=Weight -mean(Weight);
PROC sgplot; scatter x=Weight Y= Invoice;
PROC CORR; VAR Weight Invoice;
proc GLM; Model Invoice= Weight ;
PROC GLM; Model Invoice = MakeD Weight_adj/solution;
PROC GCHART; VBAR Maked/discrete type=mean sumvar=Invoice;
RUN;
ODS PDF CLOSE;

