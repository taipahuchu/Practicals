*Data Management;

DATA cars (drop=cylinders);
SET sashelp.cars;
If cylinders > 6 then cylinder = 1 ;
else cylinder = 0;

*DELETE OBSERVATIONS WITH MISSING DATA;
if cmiss(of _all_) then delete;
RUN;

*Split data randomly into train and test datasets;
ods graphics on;
proc surveyselect data=cars out= traintest seed=123 samprate= 0.7 method=srs outall;
run;

*Lasso regression with k-fold validation;
PROC GLMSELECT DATA=traintest SEED= 123 PLOTS=ALL;
partition role=selected (train = "1" test = "0");
class DriveTrain  Origin Type ;
Model Horsepower = Cylinder  EngineSize  Invoice Length MPG_City MPG_Highway MSRP Weight Wheelbase
/ selection=lar (choose = cv stop = none) cvmethod=random(10);
RUN;
