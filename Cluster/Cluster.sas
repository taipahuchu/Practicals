ods pdf file= "cluster.pdf";
***************************************;
*Data Management;
***************************************;
data CARS;
set SASHELP.CARS (Drop= Model Make Origin DriveTrain Type);
if cmiss (of _all_) THEN DELETE;
idnum = _n_;
RUN;

/*Split data randomly into training and testing*/
PROC SURVEYSELECT DATA= Cars METHOD=SRS out=Trainset seed=123 samprate= 0.7 outall;

data clust_train;
SET Trainset;
IF selected = 1;
RUN;

data clust_test;
SET Trainset;
IF selected = 0;
RUN;

PROC STANDARD  data= clust_train out= clust_var MEAN=0 STD=1;
var Cylinders EngineSize Horsepower Invoice Length MPG_City MPG_Highway MSRP Weight Wheelbase;
RUN;
PROC CONTENTS DATA=CARS OUT=COLS; RUN;

%MACRO kmean(K);
PROC fastclus data= clust_var out= data&K. outstat=cluststart&K. maxclusters=&k. maxiter=300;
var Cylinders EngineSize Horsepower Invoice Length MPG_City MPG_Highway MSRP Weight Wheelbase;
RUN;

%MEND;

%macro runs;
%do i = 1 %to 9;
 %kmean(&i)
 %end;
%MEND runs;
%runs


 *Extract r-square values from each cluster and then merge them to form elbow plot;

 %MACRO CLUSTER;
 %DO i = 1 %to 9;
data clus&i;
SET cluststart&i;
nclust = &i;
IF _TYPE_ = "RSQ";
KEEP nclust over_all;
run;
%END;
%MEND;
%CLUSTER

Data clustersquare;
set clus1 clus2 clus3 clus4 clus5 clus6 clus7 clus8 clus9;
RUN;

*plot elbow plot using rsquare values;
symbol1 color=blue interpol=join;
proc gplot data=clustersquare;
PLOT over_all*nclust;
RUN;

ods pdf close ;





