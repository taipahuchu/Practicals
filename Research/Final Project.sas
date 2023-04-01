ODS WORD FILE='cars.docx';

data cars;
set sashelp.cars;

PROC BOXPLOT;
PLOT MSRP * ORIGIN;
RUN;


Title 'Manufacturer’s Suggested Retail Price (MSRP) is associated with the Car weight independent of region of where the car is manufactured';

PROC SUMMARY; 
VAR Cylinders engineSize Horsepower MPG_City MPG_Highway MSRP Weight ;
OUTPUT OUT=MYCARS;
RUN;

PROC SORT; 
BY ORIGIN;
run;

PROC BOXPLOT;
PLOT MSRP * ORIGIN;
RUN;

ODS WORD CLOSE;