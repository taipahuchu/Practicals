ODS PDF FILE= "Polynomial.pdf";
/*Scatter plot with linear regression line*/
DATA cars;
Set SASHELP.CARS;
Invoice_c = Invoice - 3578;
PROC MEANS ; VAR Weight;
PROC SGPLOT; 
TITLE "Scatter plot with linear regression line";
REG Y= Weight X= Invoice / lineattrs= (color = blue thickness=2) DEGREE=1 clm;
REG Y= Weight X= Invoice / lineattrs= (color = blue thickness=2) DEGREE=2  clm;
REG Y= Weight X= Invoice / lineattrs= (color = blue thickness=2) DEGREE=5  clm;
yaxis label= "Car Weight";
xaxis label="Car Price";
PROC GLM ; MODEL Weight = Invoice_c / SOLUTION clparm;
PROC GLM PLOTS(unpack)=ALL; MODEL Weight = Invoice_c  Invoice_c*Invoice_c/ SOLUTION clparm;
output residual= res student=stdress out=results;
RUN;
ODS PDF CLOSE;