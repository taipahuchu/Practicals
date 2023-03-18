data cars ;
SET sashelp.cars;
RUN;

TITLE "This is a revision practice";
FOOTNOTE "Done on &sysdate9.  %sysfunc(time(),  timeampm.)";
LIBNAME mydata "work" ;
/*Data has been subsetted*/
/*ODS pdf file="Frequences.pdf";*/
data cars;
length n 3; ;
set work.cars;
LABEL Make ="This is the cars make"
      Cylinders = "This is the model type";
Momentum =cylinders * Wheelbase;
IF cylinders =8 then cylinders =.;
IF MSRP >= 35000;
IF Horsepower <=240;
n=_n_ ;
proc sort; by n;
PROC PRINT; VAR Momentum cylinders  Wheelbase;
PROC FREQ; TABLES /*make*/ cylinders wheelbase/*MSRP Horsepower*/;
proc univariate; VAR msrp;
proc gchart; VBAR Make/ Discrete Type=PCT;
proc gchart; VBAR msrp/ Type=PCT;
RUN;
ODS pdf close;
TITLE "";
FOOTNOTE "";

data cars ;
SET sashelp.cars;
RUN;

TITLE "This is a revision practice";
FOOTNOTE "Done on &sysdate9.  %sysfunc(time(),  timeampm.)";
LIBNAME mydata "work" ;
/*Data has been subsetted*/
/*ODS pdf file="Frequences.pdf";*/
data cars;
length n 3; ;
set work.cars;
LABEL Make ="This is the cars make"
      Cylinders = "This is the model type";
Momentum =cylinders * Wheelbase;
IF cylinders =8 then cylinders =.;
IF MSRP >= 35000;
IF Horsepower <=240;
n=_n_ ;
proc sort; by n;
PROC PRINT; VAR Momentum cylinders  Wheelbase;
PROC FREQ; TABLES /*make*/ cylinders wheelbase/*MSRP Horsepower*/;
proc univariate; VAR msrp;
proc gchart; VBAR Make/ Discrete Type=PCT;
proc gchart; VBAR msrp/ Type=PCT;
RUN;
ODS pdf close;
TITLE "";
FOOTNOTE "";






goptions border xpixels=460 ypixels=500;             /*  */
axis1 label=(angle=90 "Models Produced");            /*  */
axis2 label=("Vehicle Type");
title "Models Produced By Vehicle Type and Origin";  /*  */
footnote "Data: SASHELP.CARS";
proc gchart data=sashelp.cars;                       /*  */
   vbar3d type /                                     /*  */
      subgroup=origin
      type=freq freq
      shape=cylinder space=1
      axis=axis1 maxis=axis2 autoref clipref;
run;
quit;                                                /*  */
title;                                               /*  */
footnote;

 


proc sgpanel data=sashelp.cars noautolegend;
where origin in("Europe" "USA");
panelby origin;
histogram mpg_highway;
fringe mpg_highway / height=20 lineattrs=(color=red);
run;
 



