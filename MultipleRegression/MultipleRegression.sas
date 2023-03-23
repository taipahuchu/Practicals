/*Adding thre categorical reference group Origin*/
ods pdf file= "MultipleRegression.pdf";
ods graphics on;
data cars;
set sashelp.cars(DROP=Model Drivetrain Make Type);
IF Origin = "Asia" THEN Origin1= 0;
IF Origin = "Europe" THEN Origin1= 1;
IF Origin = "USA" THEN Origin1= 2;
IF weight > 3580 then Mass = 1 ;
else mass = 0;
DROP Origin;

/*Response varible is Quantitative*/
PROC GLM plots=all; 
class Origin1 (ref="0");
model Weight = Cylinders EngineSize Horsepower Invoice Length MPG_City MPG_Highway MSRP 
Origin1 Wheelbase/solution;

/*Response variable is Categorical*/
PROC LOGISTIC descending;
Model Mass = Cylinders EngineSize Horsepower Invoice Length MPG_City MPG_Highway MSRP 
Origin1 Wheelbase;
RUN;
ODS PDF CLOSE;
 


