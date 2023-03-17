data cars ;
SET sashelp.cars;
RUN;

TITLE "This is a revision practice";
FOOTNOTE "Done on &sysdate9.";
LIBNAME mydata "work" access=readonly;
/*Data has been subsetted*/
ODS pdf file="Frequences.pdf";
data cars;
length n 3; ;
set work.cars;
LABEL Make ="This is the cars make";
      Cylinder = "This is the model type";
IF MSRP >= 35000;
IF Horsepower <=240;
n=_n_ ;
proc sort; by n;
PROC FREQ; TABLES make cylinders MSRP Horsepower;
RUN;
ODS pdf close;
TITLE "";
FOOTNOTE "";




