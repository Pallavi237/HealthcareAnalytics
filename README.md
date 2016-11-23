# HealthcareAnalytics
Executive Summary:

United States medical care expenditures account have grown about 4 percent per year and growing share of GDP and policy makers continue to search for mechanisms to rein in expenditure growth. In this environment, understanding the demand for medical care is critical. Unfortunately, estimating medical care demand is particularly challenging. One of the central problems is that the marginal price of medical care faced by consumers is often determined by consumers through their selection of a health insurance plan. In this report by estimating the overall risk of health care system, our team has decided to predict the annual medical expenditures excluding dental and outpatient mental paid by the sponsor or policy-holder to the health plan to purchase health coverage. For this estimation, we have performed data modelling such as lasso and ridge regression which helped us to penalized some of the parameters and determining the several factors that affect the medical expenditures. For instance, the least healthy individuals may be more likely to choose a plan with the most generous insurance coverage, leading to an overestimate of the effect on medical care demand. We also found that females are more likely to suffer from chronic diseases and to seek help for these conditions, females are spending more on medical care in comparison to males. Depending on health variable, it appears that people with poor health condition are paying more to the health providers. Apart from them, our team has decided to create a custom package to avoid the iterative use of functions to check the performance metrics for models and we have developed a user friendly shiny application by which user can calculate their medical expenditure by providing significant factors on screen such as age, annual income, gender, health etc. and would help them in maintaining their expenditure.
Data Overview:
The dataset ‘MedExp’ has been extracted from the package named ‘Ecdat’ which contains 15 variables and 5574 observations. 
Variable Name	Data Dictionary	Values
med	annual medical expenditures in constant dollars excluding dental and outpatient mental	62.07547
lc	log(coinsrate+1) where coinsurance rate is 0 to 100	0
idp	individual deductible plan?	yes
lpi	log (annual participation incentive payment) or 0 if no payment	6.907755
fmde	log (max (medical deductible expenditure)) if IDP=1 and MDE>1 or 0 otherwise	0
physlim	physical limitation?	no
ndisease	number of chronic diseases	13.73189
health	self–rate health (excellent, good, fair, poor)	good
linc	log of annual family income (in \$)	9.528776
lfam	log of family size	1.386294
educdec	years of schooling of household head	12
age	exact age	43.87748
sex	sex (male, female)	male
child	age less than 18?	no
black	is household head black?	no

In order to understand the insurance marketplace, we have considered the rate and network files from Kaggle which contain data on health and dental plans offered to individuals and small businesses.


![alt tag](https://cloud.githubusercontent.com/assets/23565353/20550296/11e120ec-b102-11e6-9533-8db3b6783052.png)
