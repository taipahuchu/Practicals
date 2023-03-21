Title 'Random Forest analysis of the cars dataset predicting the Make of the car';


data cars; SET sashelp.cars (drop=Model);run;
PROC SORT; BY Make;
ods graphics on;
ods pdf file="RandomForest.pdf";
PROC hpforest;
TARGET Make/ level=nominal;
INPUT Cylinders DriveTrain Origin Type /LEVEL= NOMINAL;
INPUT  EngineSize Horsepower Invoice Length MPG_City MPG_Highway MSRP  
Weight Wheelbase / Level=interval;
 ;
RUN;
ods pdf close;