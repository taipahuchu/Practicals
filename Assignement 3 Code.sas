data cars ;
SET sashelp.cars;
RUN;

TITLE "This is a SAS assignment";
FOOTNOTE "Done on &sysdate9.  %sysfunc(time(),  timeampm.)";
LIBNAME mydata "work" ;
/*Data has been subsetted*/
ODS pdf file="Frequences.pdf";
data cars;
length n 3 capacity $12 ; 
set work.cars;
LABEL Make ="Car Make "
      Cylinders = "Car Model";
Momentum =cylinders * Wheelbase;
if momentum ge 600 THEN Capacity = "Large";
else if momentum le 600 and momentum ge 400 THEN Capacity = "Medium";
else if momentum < 400 THEN Capacity = "Small";
IF cylinders =8 then cylinders =.;
IF MSRP >= 35000;
IF Horsepower <=240;
n=_n_ ;
proc sort; by n;
PROC PRINT; VAR Momentum cylinders  Wheelbase Capacity;
PROC FREQ; TABLES /*make*/ cylinders wheelbase/*MSRP Horsepower*/;
RUN;
ODS pdf close;
TITLE "";
FOOTNOTE "";




