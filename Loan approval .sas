/**************
Student Name: Mira
Job position: Data Scientist, ABC SDN BHD
Program name: my_dap_projects_tp081940.sas
Description: - loan application approval status prediction - 1-2 lines
Date first written: Mon,2-Dec-2024
Date last updated: Saturday,1-February-2025
Folder name: ASSIGNDAP
Library name: OCTDAP
*****************/

/**Extract the TRAINING_DS’s Metadata/Data Dictionary *******/

PROC CONTENTS DATA = octdap.TRAINING_DS;

QUIT;

/**Extract the TRAINING_DS’s Metadata/Data Dictionary *******/
PROC SQL;
DESCRIBE TABLE octdap.TRAINING_DS;
RUN;

/*chapter 6 : 6.3.1 */
TITLE 'Univarite Analysis of the Categorical family_members Variable ';

PROC FREQ DATA = octdap.TRAINING_DS;

TABLE family_members;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

VBAR family_members;

TITLE 'Univarite Analysis of the Categorical family_members Variable ';

RUN;


TITLE 'Univarite Analysis of the Categorical employment Variable ';

PROC FREQ DATA = octdap.TRAINING_DS;

TABLE employment;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

VBAR employment;

TITLE 'Univarite Analysis of the Categorical employment Variable ';

RUN;

TITLE 'Univarite Analysis of the Categorical marital status Variable ';

PROC FREQ DATA = octdap.TRAINING_DS;

TABLE marital_status;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

VBAR marital_status;

TITLE 'Univarite Analysis of the Categorical marital status Variable ';

RUN;

TITLE 'Univarite Analysis of the Categorical gender Variable ';

PROC FREQ DATA = octdap.TRAINING_DS;

TABLE gender;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

VBAR gender;

TITLE 'Univarite Analysis of the Categorical gender Variable ';

RUN;

TITLE 'Univarite Analysis of the Categorical loan_history Variable ';

PROC FREQ DATA = octdap.TRAINING_DS;

TABLE loan_history;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

VBAR loan_history;

TITLE 'Univarite Analysis of the Categorical loan_history Variable ';

RUN;

TITLE 'Univarite Analysis of the Categorical qualification Variable ';

PROC FREQ DATA = octdap.TRAINING_DS;

TABLE qualification;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

VBAR qualification;

TITLE 'Univarite Analysis of the Categorical qualification Variable ';

RUN;

TITLE 'Univarite Analysis of the Categorical loan_location Variable ';

PROC FREQ DATA = octdap.TRAINING_DS;

TABLE loan_location;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

VBAR loan_location;

TITLE 'Univarite Analysis of the Categorical loan_location Variable ';

RUN;

TITLE 'Univarite Analysis of the Categorical loan_approval_status Variable ';

PROC FREQ DATA = octdap.TRAINING_DS;

TABLE loan_approval_status;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

VBAR loan_approval_status;

TITLE 'Univarite Analysis of the Categorical loan_approval_status Variable ';
RUN;

/*6.3.2*/
TITLE 'Univariate Analysis of the Continuous Variable - candidate_income';

PROC MEANS DATA = octdap.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR candidate_income;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

HISTOGRAM candidate_income;

TITLE 'Univarite Analysis of the Continuous Variable - candidate_income  ';

RUN;

TITLE 'Univariate Analysis of the Continuous variable: loan_duration';

PROC MEANS DATA = octdap.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR loan_duration;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

HISTOGRAM loan_duration;

TITLE 'Univarite Analysis of the Continuous Variable - loan duration ';

RUN;

TITLE 'Univariate Analysis of the Continuous /Numeric variable –  guarantee_income';

PROC MEANS DATA = octdap.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR guarantee_income;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

HISTOGRAM guarantee_income;

TITLE 'Univarite Analysis of the Continuous Variable - guarantee_income ';

RUN;

TITLE 'Univariate Analysis of the Continuous /Numeric variable –  loan_amount';

PROC MEANS DATA = octdap.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR loan_amount;

RUN;

ODS GRAPHICS / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA= octdap.TRAINING_DS;

HISTOGRAM loan_amount;

TITLE 'Univarite Analysis of the Continuous Variable - loan_amount ';

RUN;

/*6.3.3 Univarite Analysis of the Categorical Variable using SAS macro*/
OPTIONS Mcompilenote=ALL;
%MACRO macro_uvacate_vari(pdataset_name,pcate_vari_name,ptitle_name);

TITLE &ptitle_name;
PROC FREQ DATA = &pdataset_name;
TABLE &pcate_vari_name;
RUN;
%MEND macro_uvacate_vari;

/*To call the SAM MACRO - macro_uvacate_vari*/
%macro_uvacate_vari(octdap.TESTING_DS,Loan_location,'Univariate Analysis of the Categorical variable - loan location');
%macro_uvacate_vari(octdap.TESTING_DS,qualification,'Univariate Analysis of the Categorical variable - qualification');
%macro_uvacate_vari(octdap.TESTING_DS,loan_history,'Univariate Analysis of the Categorical variable - loan_history');
%macro_uvacate_vari(octdap.TESTING_DS,family_members,'Univariate Analysis of the Categorical variable - family_members');

PROC CONTENTS DATA = octdap.TESTING_DS;
QUIT;

OPTIONS MCOMILENOTE = ALL;
%MACRO UVA_CONTI_VARI(pds_name,pconti_vari_name,ptitle);

TITLE &ptitle;
PROC MEANS DATA = &pds_name N NMISS MIN MAX MEAN MEDIAN STD;
VAR &pconti_vari_name;
RUN;
%MEND UVA_CONTI_VARI;

%UVA_CONTI_VARI(octdap.TRAINING_DS,CANDIDATE_INCOME,'Univariate Analysis of the Continuous variable: candidate_income');
%UVA_CONTI_VARI(octdap.TRAINING_DS,GUARANTEE_INCOME,'Univariate Analysis of the Continuous variable: guarantee_income');
%UVA_CONTI_VARI(octdap.TRAINING_DS,LOAN_AMOUNT,'Univariate Analysis of the Continuous variable: loan_amount');
%UVA_CONTI_VARI(octdap.TRAINING_DS,LOAN_DURATION,'Univariate Analysis of the Continuous variable: loan_duration');

OPTIONS MCOMPILENOTE=ALL;
%MACRO BVA_CATE_CATE(pds_name,pcate_vari_name1,pcate_vari_name2,ptitle1,ptitle2);
TITLE1 &ptitle1;
TITLE2 &ptitle2;

PROC FREQ DATA =  &pds_name;

TABLE &pcate_vari_name1 * &pcate_vari_name2/
PLOTS = FREQPLOT ( TWOWAY = STACKED SCALE = GROUPPCT );

RUN;
%MEND BVA_CATE_CATE;
 
%BVA_CATE_CATE(octdap.TRAINING_DS,GENDER,FAMILY_MEMBERS,'Bivariate Analysis','gender vs family_members');
%BVA_CATE_CATE(octdap.TRAINING_DS,QUALIFICATION,EMPLOYMENT,'Bivariate Analysis','qualification vs employment');
%BVA_CATE_CATE(octdap.TRAINING_DS,EMPLOYMENT,MARITAL_STATUS,'Bivariate Analysis','employment vs marital_status');
%BVA_CATE_CATE(octdap.TRAINING_DS,EMPLOYMENT,LOAN_LOCATION,'Bivariate Analysis','employment vs loan_location');

OPTIONS MCOMPILENOTE=ALL;
%MACRO BVA_CATE_CONTI(pds_name,pcate_vari,pconti_vari,ptitle1,ptitle2);
TITLE1 &ptitle1;
TITLE2 &ptitle2;

PROC MEANS DATA =  &pds_name;

CLASS &pcate_vari; /*It is a Categorical variable*/
VAR &pconti_vari; /*It is a Numeric-/Continuous variable*/

RUN;
%MEND BVA_CATE_CONTI;
 
%BVA_CATE_CONTI(octdap.TRAINING_DS,MARITAL_STATUS,LOAN_AMOUNT,'Bivariate Analysis of ','marital_status vs loan_amount');
%BVA_CATE_CONTI(octdap.TRAINING_DS,FAMILY_MEMBERS,LOAN_DURATION,'Bivariate Analysis of ','family_members vs loan_duration');
%BVA_CATE_CONTI(octdap.TRAINING_DS,LOAN_LOCATION,GUARANTEE_INCOME,'Bivariate Analysis of ','loan_location vs guarantee_income');

OPTIONS MCOMPILENOTE=ALL;
%MACRO BVA_CATE_CATE(pds_name,pcate_vari_name1,pcate_vari_name2,ptitle1,ptitle2);
TITLE1 &ptitle1;
TITLE2 &ptitle2;

PROC FREQ DATA =  &pds_name;

TABLE &pcate_vari_name1 * &pcate_vari_name2/
PLOTS = FREQPLOT ( TWOWAY = STACKED SCALE = GROUPPCT );

RUN;
%MEND BVA_CATE_CATE;
 
%BVA_CATE_CATE(octdap.TESTING_DS,GENDER,FAMILY_MEMBERS,'Bivariate Analysis','gender vs family_members');
%BVA_CATE_CATE(octdap.TESTING_DS,QUALIFICATION,EMPLOYMENT,'Bivariate Analysis','qualification vs employment');
%BVA_CATE_CATE(octdap.TESTING_DS,EMPLOYMENT,MARITAL_STATUS,'Bivariate Analysis','employment vs marital_status');
%BVA_CATE_CATE(octdap.TESTING_DS,EMPLOYMENT,LOAN_LOCATION,'Bivariate Analysis','employment vs loan_location');

OPTIONS MCOMPILENOTE=ALL;
%MACRO BVA_CATE_CONTI(pds_name,pcate_vari,pconti_vari,ptitle1,ptitle2);
TITLE1 &ptitle1;
TITLE2 &ptitle2;

PROC MEANS DATA =  &pds_name;

CLASS &pcate_vari; /*It is a Categorical variable*/
VAR &pconti_vari; /*It is a Numeric-/Continuous variable*/

RUN;
%MEND BVA_CATE_CONTI;
 
%BVA_CATE_CONTI(octdap.TESTING_DS,MARITAL_STATUS,LOAN_AMOUNT,'Bivariate Analysis of ','marital_status vs loan_amount');
%BVA_CATE_CONTI(octdap.TESTING_DS,FAMILY_MEMBERS,LOAN_DURATION,'Bivariate Analysis of ','family_members vs loan_duration');
%BVA_CATE_CONTI(octdap.TESTING_DS,LOAN_LOCATION,GUARANTEE_INCOME,'Bivariate Analysis of ','loan_location vs guarantee_income');

/*chapter 7 : Cleansing the data */
/*for imputing missing for categorical vari of : Marital Status */
TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their marital status';
FOOTNOTE '---END------';

PROC SQL;
SELECT *
FROM octdap.TRAINING_DS e
WHERE ( e.marital_status eq '' OR e.marital_status IS MISSING );
QUIT;

TITLE 'STEP 2:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their marital status';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TRAINING_DS e
WHERE ( e.marital_status eq '' OR e.marital_status IS MISSING );
QUIT;

/*STEP 3:Extract the statistics and save it a temporary dataset */
PROC SQL;
CREATE TABLE octdap.TRAINING_STAT_DS AS
SELECT e.marital_status AS marital_status_name, 
               COUNT(*) AS counts 
FROM octdap.TRAINING_DS e
WHERE ( e.marital_status ne '' OR e.marital_status IS NOT MISSING )
GROUP BY e.marital_status;
QUIT;

/*STEP 4: Find the MOD Value */
PROC SQL;
SELECT tso.marital_status_name AS marital_status_name
FROM octdap.TRAINING_STAT_DS tso
WHERE tso.counts eq ( SELECT MAX(tsi.counts) AS highest_counts
                  FROM octdap.TRAINING_STAT_DS tsi );
                  /*The above sub-program is to find the highest count*/
QUIT;

/*STEP 4.1: Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TRAINING_DS AS
SELECT *
FROM octdap.TRAINING_BK_DS;
QUIT;

/*STEP 5: Impute the missing values found in the Categorical variable - marital status */
PROC SQL;
UPDATE octdap.TRAINING_DS
SET marital_status = (SELECT tso.marital_status_name AS marital_status_name
                      FROM octdap.TRAINING_STAT_DS tso
                      WHERE tso.counts eq ( SELECT MAX(tsi.counts) AS highest_counts
                                            FROM octdap.TRAINING_STAT_DS tsi ))
WHERE ( marital_status eq '' OR marital_status IS MISSING );         
QUIT;

TITLE 'STEP 6: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their marital status';
FOOTNOTE '---END------';

PROC SQL;
SELECT *
FROM octdap.TRAINING_DS e
WHERE ( e.marital_status eq '' OR e.marital_status IS MISSING );
QUIT;

TITLE 'STEP 7:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their marital status';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TRAINING_DS e
WHERE ( e.marital_status eq '' OR e.marital_status IS MISSING );
QUIT; 


/*for imputing missing for categorical vari of employment */

TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their employments';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TRAINING_DS e
WHERE ( e.employment eq '' OR e.employment IS MISSING );
QUIT;

TITLE 'STEP 2:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their  employments';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TRAINING_DS e
WHERE ( e.employment eq '' OR e.employment IS MISSING );
QUIT;

/*STEP 3:Extract the statistics and save it a temporary dataset */

PROC SQL;
CREATE TABLE octdap.TRAINING_STAT_DS  AS
SELECT e.employment AS Employment_number, 
               COUNT(*) AS counts 
FROM octdap.TRAINING_DS e
WHERE ( e.employment ne '' OR e.employment IS NOT MISSING )
GROUP BY e.employment;
QUIT;

/*STEP 4: Find the MOD Value */
PROC SQL;
SELECT eeo.Employment_number AS Employment_Status
FROM octdap.TRAINING_STAT_DS eeo
WHERE eeo.counts eq ( SELECT MAX(eei.counts) AS highest_counts
                  FROM octdap.TRAINING_STAT_DS eei );
                  /*The above sub-program is to find the highest count*/
QUIT;

/*STEP 4.1: Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TRAINING_DS AS
SELECT *
FROM octdap.TRAINING_BK_DS;
QUIT;

/*STEP 5: Impute the missing values found in the Categorical variable - marital status */
PROC SQL;
UPDATE octdap.TRAINING_DS
SET Employment = (SELECT eeo.Employment_number AS Employment_Status
				      FROM octdap.TRAINING_STAT_DS eeo
                      WHERE eeo.counts eq ( SELECT MAX(eei.counts) AS highest_counts
                      FROM octdap.TRAINING_STAT_DS eei ))
WHERE ( employment eq '' OR employment IS MISSING );
QUIT;

/*step 6 and 7*/

TITLE 'STEP 6: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their employment';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TRAINING_DS e
WHERE ( e.employment eq '' OR e.employment IS MISSING );
QUIT;

TITLE 'STEP 7:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their employment';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TRAINING_DS e
WHERE ( e.employment eq '' OR e.employment IS MISSING );
QUIT; 


/*for imputing missing for categorical vari of : Gender */
TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their gender status';
FOOTNOTE '---END------';

PROC SQL;
SELECT *
FROM octdap.TRAINING_DS g
WHERE ( g.gender eq '' OR g.gender IS MISSING );
QUIT;

TITLE 'STEP 2:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their gender status';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TRAINING_DS g
WHERE ( g.gender eq '' OR g.gender IS MISSING );
QUIT;

/*STEP 3:Extract the statistics and save it a temporary dataset */
PROC SQL;
CREATE TABLE octdap.TRAINING_STAT_DS AS
SELECT g.gender AS Gender_status, 
               COUNT(*) AS counts 
FROM octdap.TRAINING_DS g
WHERE ( g.gender ne '' OR g.gender IS NOT MISSING )
GROUP BY g.gender;
QUIT;

/*STEP 4: Find the MOD Value */
PROC SQL;
SELECT go.Gender_status AS Gender_status_name
FROM octdap.TRAINING_STAT_DS go
WHERE go.counts eq ( SELECT MAX(gi.counts) AS highest_counts
                  FROM octdap.TRAINING_STAT_DS gi );
                  /*The above sub-program is to find the highest count*/
QUIT;

/*STEP 4.1: Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TRAINING_DS AS
SELECT *
FROM octdap.TRAINING_BK_DS;
QUIT;

/*STEP 5: Impute the missing values found in the Categorical variable - gender */
PROC SQL;
UPDATE octdap.TRAINING_DS
SET gender = (SELECT go.Gender_status AS Gender_status_name
			  FROM octdap.TRAINING_STAT_DS go
			  WHERE go.counts eq ( SELECT MAX(gi.counts) AS highest_counts
                  				   FROM octdap.TRAINING_STAT_DS gi ))
WHERE ( gender eq '' OR gender IS MISSING );         
QUIT;

TITLE 'STEP 6: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their gender status';
FOOTNOTE '---END------';

PROC SQL;
SELECT *
FROM octdap.TRAINING_DS g
WHERE ( g.gender eq '' OR g.gender IS MISSING );
QUIT;

TITLE 'STEP 7:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their gender status';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TRAINING_DS g
WHERE ( g.gender eq '' OR g.gender IS MISSING );
QUIT; 

/*imputing missing value of Categorical variable : family memeber*/

TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their family_members data';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TRAINING_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members eq '' ));
QUIT;

TITLE 'STEP 2: Count the total number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their family_members data';
FOOTNOTE '---END------';
PROC SQL;
SELECT COUNT(*) Label = 'Total number of loan Applicants' 
FROM octdap.TRAINING_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members eq '' ));
QUIT;

/* 'STEP 3: Remove the '+' symbol found in the family_members data'*/
PROC SQL;
SELECT t.SME_LOAN_ID_NO Label  = 'Loan ID' ,
	   t.family_members Label = 'family Members',
      SUBSTR(family_members,1,1) label ='1st letter',
      SUBSTR(family_members,2,1) label = '2nd letter'
FROM octdap.TRAINING_DS t;
QUIT;


/* Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TRAINING_BK_DS AS
SELECT *
FROM octdap.TRAINING_DS;
QUIT;


/* 'STEP 3 '*/
PROC SQL;
UPDATE octdap.TRAINING_DS
SET family_members = SUBSTR(family_members,1,1);
QUIT;


/*Step 4: Find the statstics and save the statistics in a temporary dataset*/
PROC SQL;
CREATE Table octdap.TRAINING_STAT_DS AS
SELECT t.family_members As family_members,
COUNT (*) AS COUNTS
FROM octdap.TRAINING_DS t
WHERE ( ( t.family_members IS NOT MISSING ) OR 
	    ( t.family_members ne '' ))
GROUP by t.family_members;

QUIT;

/*Step 5: Find the Mod Value */
PROC SQL;
   SELECT MAX(COUNTS) AS highest_count
   FROM octdap.TRAINING_STAT_DS;
QUIT;

PROC SQL;
SELECT t.family_members As family_members
FROM octdap.TRAINING_STAT_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members ne '' ))
GROUP by t.family_members;
QUIT;


/*step6 Impute the missing value found in the categorical variable - family members */
PROC SQL;
UPDATE octdap.TRAINING_DS
SET family_members = ( SELECT to.family_members AS family_members
                       FROM octdap.TRAINING_STAT_DS to 
                       WHERE to.Counts eq ( SELECT MAX(ti.Counts) AS highest_count
                                            from octdap.TRAINING_STAT_DS ti))
WHERE ( ( family_members IS NOT MISSING ) OR 
	    ( family_members ne '' ));
QUIT;


/* Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TRAINING_DS AS
SELECT *
FROM octdap.TRAINING_BK_DS;
QUIT;

PROC SQL;
UPDATE octdap.TRAINING_DS
SET family_members = (
                       SELECT to.family_members AS family_members
                       FROM octdap.TRAINING_STAT_DS to 
                       WHERE to.Counts eq ( SELECT MAX(ti.Counts) AS highest_count
                                            from octdap.TRAINING_STAT_DS ti))
WHERE ( ( family_members IS MISSING ) OR 
	    ( family_members eq '' ));
QUIT;

TITLE 'STEP 6: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their family_members data';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TRAINING_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members eq '' ));
QUIT;

TITLE 'STEP 7: Count the total number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their family_members data';
FOOTNOTE '---END------';
PROC SQL;
SELECT COUNT(*) Label = 'Total number of loan Applicants' 
FROM octdap.TRAINING_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members eq '' ));
QUIT;

 
/*for imputing missing for categorical vari of :  loan history */;


TITLE 'STEP 1: List the details of the loan applicants who has loan history ';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TRAINING_DS hi
WHERE ( hi.loan_history IS MISSING );
QUIT;

TITLE 'STEP 2: Count the total number of the loan applicants who has loan history ';
FOOTNOTE '---END------';
PROC SQL;
SELECT COUNT(*) Label = 'Total number of loan H' 
FROM octdap.TRAINING_DS hi
WHERE ( hi.loan_history IS MISSING );
QUIT;


/*STEP 3:Extract the statistics and save it a temporary dataset */
PROC SQL;
CREATE TABLE octdap.TRAINING_STAT_DS AS
SELECT h.loan_history AS Loan_history, 
               COUNT(*) AS counts 
FROM octdap.TRAINING_DS h
WHERE ( h.loan_history IS NOT MISSING )
GROUP BY h.loan_history;
QUIT;

/*STEP 4: Find the MOD Value */
PROC SQL;
SELECT hoa.Loan_history AS Loan_history_status
FROM octdap.TRAINING_STAT_DS hoa
WHERE hoa.counts eq ( SELECT MAX(hi.counts) AS highest_counts
                  FROM octdap.TRAINING_STAT_DS hi );
QUIT;

/*STEP 4.1: Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TRAINING_DS AS
SELECT *
FROM octdap.TRAINING_BK_DS;
QUIT;

/*STEP 5: Impute the missing values found in the Categorical variable - loan_history */
PROC SQL;
UPDATE octdap.TRAINING_DS
SET loan_history = ( SELECT hoa.Loan_history AS Loan_history_status
					 FROM octdap.TRAINING_STAT_DS hoa
                     WHERE hoa.counts eq ( SELECT MAX(hi.counts) AS highest_counts
                                           FROM octdap.TRAINING_STAT_DS hi ))
WHERE ( loan_history IS MISSING ) ;
QUIT;        


TITLE 'STEP 6: List the details of the loan applicants who has loan history ';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TRAINING_DS hi
WHERE ( hi.loan_history IS MISSING );
QUIT;

TITLE 'STEP 7: Count the total number of the loan applicants who has loan history ';
FOOTNOTE '---END------';
PROC SQL;
SELECT COUNT(*) Label = 'Total number of loan History' 
FROM octdap.TRAINING_DS hi
WHERE ( hi.loan_history IS MISSING );
QUIT;

/*7.2.1 continuous handling missing value */
/*imputing continuous variable of : Loan duration */
TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their loan duration';
FOOTNOTE '----END-----';
PROC SQL;
SELECT *
FROM octdap.TRAINING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
        ( t.loan_duration eq . ));

QUIT;


TITLE 'STEP 2:Count the total number of loan application without stating their loan duration';
FOOTNOTE '----END-----';
PROC SQL;
SELECT COUNT(*) Label = 'Number of loan Applicants'
FROM octdap.TRAINING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
        ( t.loan_duration eq . ));
QUIT;

/* Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TRAINING_BK_DS AS
SELECT *
FROM octdap.TRAINING_DS;
QUIT;


/* STEP 3: Impute the missing values found in the Continuous variable - loan duration */;
PROC STDIZE DATA = octdap.TRAINING_DS REPONLY
METHOD = MEAN OUT = octdap.TRAINING_DS;
VAR loan_duration;
QUIT;

TITLE 'STEP 4: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their loan duration';
FOOTNOTE '----END-----';
PROC SQL;
SELECT *
FROM octdap.TRAINING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
        ( t.loan_duration eq . ));
QUIT;
TITLE 'STEP 5:Count the total number of loan application without stating their loan duration';
FOOTNOTE '----END-----';
PROC SQL;
SELECT COUNT(*) Label = 'Number of loan Applicants'
FROM octdap.TRAINING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
        ( t.loan_duration eq . ));
QUIT; 

/*impute continuous variable of loan amount*/
TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their loan amount';
FOOTNOTE '----END-----';
PROC SQL;
SELECT *
FROM octdap.TRAINING_DS am
WHERE ( am.loan_amount IS  MISSING ) ;

QUIT;


TITLE 'STEP 2:Count the total number of loan application without stating their loan amount';
FOOTNOTE '----END-----';
PROC SQL;
SELECT COUNT(*) Label = 'Number of loan Amounts'
FROM octdap.TRAINING_DS am
WHERE ( ( am.loan_amount IS  MISSING ) OR
        ( am.loan_amount eq . ));

QUIT;

/* Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TRAINING_BK_DS AS
SELECT *
FROM octdap.TRAINING_DS;
QUIT;


/* STEP 3: Impute the missing values found in the Continuous variable - loan amount */;
PROC STDIZE DATA = octdap.TRAINING_DS REPONLY
METHOD = MEAN OUT = octdap.TRAINING_DS;
VAR loan_amount;
QUIT;

TITLE 'STEP 4: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their loan amount';
FOOTNOTE '----END-----';
PROC SQL;
SELECT *
FROM octdap.TRAINING_DS am
WHERE ( ( am.loan_amount IS MISSING ) OR
        ( am.loan_amount eq . ));

QUIT;


TITLE 'STEP 5:Count the total number of loan application without stating their loan amount';
FOOTNOTE '----END-----';
PROC SQL;
SELECT COUNT(*) Label = 'Number of loan Amounts'
FROM octdap.TRAINING_DS am
WHERE ( ( am.loan_amount IS MISSING ) OR
        ( am.loan_amount eq . ));

QUIT; 

 
/*chapter 7.3: Cleansing the data of continuous from the TESTING DATA FOLDER */
/*for imputing missing for categorical vari of employment */

TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their employments';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TESTING_DS e
WHERE ( e.employment eq '' OR e.employment IS MISSING );
QUIT;

TITLE 'STEP 2:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their  employments';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TESTING_DS e
WHERE ( e.employment eq '' OR e.employment IS MISSING );
QUIT;

/*STEP 3:Extract the statistics and save it a temporary dataset */
PROC SQL;
CREATE TABLE octdap.TESTING_STAT_DS  AS
SELECT e.employment AS Employment_number, 
               COUNT(*) AS counts 
FROM octdap.TESTING_DS e
WHERE ( e.employment ne '' OR e.employment IS NOT MISSING )
GROUP BY e.employment;
QUIT;

/*STEP 4: Find the MOD Value */
PROC SQL;
SELECT eeo.Employment_number AS Employment_Status
FROM octdap.TESTING_STAT_DS eeo
WHERE eeo.counts eq ( SELECT MAX(eei.counts) AS highest_counts
                  FROM octdap.TESTING_STAT_DS eei );
                  /*The above sub-program is to find the highest count*/
QUIT;

/*STEP 4.1: Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TESTING_DS AS
SELECT *
FROM octdap.TESTING_BK_DS;
QUIT;

/*STEP 5: Impute the missing values found in the Categorical variable - employment */
PROC SQL;
UPDATE octdap.TESTING_DS
SET Employment = (SELECT eeo.Employment_number AS Employment_Status
				      FROM octdap.TESTING_STAT_DS eeo
                      WHERE eeo.counts eq ( SELECT MAX(eei.counts) AS highest_counts
                      FROM octdap.TESTING_STAT_DS eei ))
WHERE ( employment eq '' OR employment IS  MISSING );
QUIT;

/*step 6 and 7*/
TITLE 'STEP 6: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their employments';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TESTING_DS e
WHERE ( e.employment eq '' OR e.employment IS MISSING );
QUIT;

TITLE 'STEP 7:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their  employments';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TESTING_DS e
WHERE ( e.employment eq '' OR e.employment IS MISSING );
QUIT; 


/*for imputing missing for categorical vari of : Gender */
TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their gender status';
FOOTNOTE '---END------';

PROC SQL;
SELECT *
FROM octdap.TESTING_DS g
WHERE ( g.gender eq '' OR g.gender IS MISSING );
QUIT;

TITLE 'STEP 2:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their gender status';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TESTING_DS g
WHERE ( g.gender eq '' OR g.gender IS MISSING );
QUIT;

/*STEP 3:Extract the statistics and save it a temporary dataset */
PROC SQL;
CREATE TABLE octdap.TESTING_STAT_DS AS
SELECT g.gender AS Gender_status, 
               COUNT(*) AS counts 
FROM octdap.TESTING_DS g
WHERE ( g.gender ne '' OR g.gender IS NOT MISSING )
GROUP BY g.gender;
QUIT;

/*STEP 4: Find the MOD Value */
PROC SQL;
SELECT go.Gender_status AS Gender_status_name
FROM octdap.TESTING_STAT_DS go
WHERE go.counts eq ( SELECT MAX(gi.counts) AS highest_counts
                  FROM octdap.TESTING_STAT_DS gi );
                  /*The above sub-program is to find the highest count*/
QUIT;

/*STEP 4.1: Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TESTING_DS AS
SELECT *
FROM octdap.TESTING_BK_DS;
QUIT;

/*STEP 5: Impute the missing values found in the Categorical variable - gender */
PROC SQL;
UPDATE octdap.TESTING_DS
SET gender = (SELECT go.Gender_status AS Gender_status_name
			  FROM octdap.TESTING_STAT_DS go
			  WHERE go.counts eq ( SELECT MAX(gi.counts) AS highest_counts
                  				   FROM octdap.TESTING_STAT_DS gi ))
WHERE ( gender eq '' OR gender IS MISSING );         
QUIT;

TITLE 'STEP 6: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their gender status';
FOOTNOTE '---END------';

PROC SQL;
SELECT *
FROM octdap.TESTING_DS g
WHERE ( g.gender eq '' OR g.gender IS MISSING );
QUIT;

TITLE 'STEP 7:Count the number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their gender status';
FOOTNOTE '---END------';

PROC SQL;
SELECT COUNT(*) Label = 'Counts'
FROM octdap.TESTING_DS g
WHERE ( g.gender eq '' OR g.gender IS MISSING );
QUIT;
 
/*imputing missing value of Categorical variable : family memeber*/

TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their family_members data';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TESTING_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members eq '' ));
QUIT;

TITLE 'STEP 2: Count the total number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their family_members data';
FOOTNOTE '---END------';
PROC SQL;
SELECT COUNT(*) Label = 'Total number of loan Applicants' 
FROM octdap.TESTING_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members eq '' ));
QUIT;

/* 'STEP 3: Remove the '+' symbol found in the family_members data'*/
PROC SQL;
SELECT t.SME_LOAN_ID_NO Label  = 'Loan ID' ,
	   t.family_members Label = 'family Members',
      SUBSTR(family_members,1,1) label ='1st letter',
      SUBSTR(family_members,2,1) label = '2nd letter'
FROM octdap.TESTING_DS t;
QUIT;


/* Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TESTING_BK_DS AS
SELECT *
FROM octdap.TESTING_DS;
QUIT;


/* 'STEP 3 '*/
PROC SQL;
UPDATE octdap.TESTING_DS
SET family_members = SUBSTR(family_members,1,1);
QUIT;


/*Step 4: Find the statstics and save the statistics in a temporary dataset*/
PROC SQL;
CREATE Table octdap.TESTING_STAT_DS AS
SELECT t.family_members As family_members,
COUNT (*) AS COUNTS
FROM octdap.TESTING_DS t
WHERE ( ( t.family_members IS NOT MISSING ) OR 
	    ( t.family_members ne '' ))
GROUP by t.family_members;

QUIT;

/*Step 5: Find the Mod Value */
PROC SQL;
   SELECT MAX(COUNTS) AS highest_count
   FROM octdap.TESTING_STAT_DS;
QUIT;



PROC SQL;
SELECT t.family_members As family_members
FROM octdap.TESTING_STAT_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members ne '' ))
GROUP by t.family_members;

QUIT;


/*step6 Impute the missing value found in the categorical variable - family members */
PROC SQL;
UPDATE octdap.TESTING_DS
SET family_members = (
                       SELECT to.family_members AS family_members
                       FROM octdap.TESTING_STAT_DS to 
                       WHERE to.Counts eq ( SELECT MAX(ti.Counts) AS highest_count
                                            from octdap.TRAINING_STAT_DS ti))
WHERE ( ( family_members IS NOT MISSING ) OR 
	    ( family_members ne '' ));
QUIT;


/* Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TESTING_DS AS
SELECT *
FROM octdap.TESTING_BK_DS;
QUIT;

PROC SQL;
UPDATE octdap.TESTING_DS
SET family_members = (
                       SELECT to.family_members AS family_members
                       FROM octdap.TESTING_STAT_DS to 
                       WHERE to.Counts eq ( SELECT MAX(ti.Counts) AS highest_count
                                            from octdap.TESTING_STAT_DS ti))
WHERE ( ( family_members IS MISSING ) OR 
	    ( family_members eq '' ));
QUIT;

TITLE 'STEP 6: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their family_members data';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TESTING_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members eq '' ));
QUIT;

TITLE 'STEP 7: Count the total number of the loan applicants ';
TITLE2 'who submitted their loan application without stating their family_members data';
FOOTNOTE '---END------';
PROC SQL;
SELECT COUNT(*) Label = 'Total number of loan Applicants' 
FROM octdap.TESTING_DS t
WHERE ( ( t.family_members IS MISSING ) OR 
	    ( t.family_members eq '' ));
QUIT; 


/*for imputing missing for categorical vari of :  loan history */


TITLE 'STEP 1: List the details of the loan applicants who has loan history ';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TESTING_DS hi
WHERE ( hi.loan_history IS MISSING );
QUIT;

TITLE 'STEP 2: Count the total number of the loan applicants who has loan history ';
FOOTNOTE '---END------';
PROC SQL;
SELECT COUNT(*) Label = 'Total number of loan H' 
FROM octdap.TESTING_DS hi
WHERE ( hi.loan_history IS MISSING );
QUIT;


/*STEP 3:Extract the statistics and save it a temporary dataset */
PROC SQL;
CREATE TABLE octdap.TESTING_STAT_DS AS
SELECT h.loan_history AS Loan_history, 
               COUNT(*) AS counts 
FROM octdap.TESTING_DS h
WHERE ( h.loan_history IS NOT MISSING )
GROUP BY h.loan_history;
QUIT;

/*STEP 4: Find the MOD Value */
PROC SQL;
SELECT hoa.Loan_history AS Loan_history_status
FROM octdap.TESTING_STAT_DS hoa
WHERE hoa.counts eq ( SELECT MAX(hi.counts) AS highest_counts
                  FROM octdap.TESTING_STAT_DS hi );
QUIT;

/*STEP 4.1: Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TESTING_DS AS
SELECT *
FROM octdap.TESTING_BK_DS;
QUIT;
 
/*STEP 5: Impute the missing values found in the category -  loan history */
PROC SQL;
UPDATE octdap.TESTING_DS
SET loan_history = ( SELECT hoa.Loan_history AS Loan_history_status
					 FROM octdap.TESTING_STAT_DS hoa
                     WHERE hoa.counts eq ( SELECT MAX(hi.counts) AS highest_counts
                                           FROM octdap.TESTING_STAT_DS hi ))
WHERE ( loan_history IS MISSING );         
QUIT;


TITLE 'STEP 6: List the details of the loan applicants who has loan history ';
FOOTNOTE '---END------';

PROC SQL;
SELECT * 
FROM octdap.TESTING_DS hi
WHERE ( hi.loan_history IS MISSING );
QUIT;

TITLE 'STEP 7: Count the total number of the loan applicants who has loan history ';
FOOTNOTE '---END------';
PROC SQL;
SELECT COUNT(*) Label = 'Total number of loan H' 
FROM octdap.TESTING_DS hi
WHERE ( hi.loan_history IS MISSING );
QUIT;


/*7.3 continuous*/
/*imputing constinuous variable of : Loan duration */
TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their loan duration';
FOOTNOTE '----END-----';
PROC SQL;
SELECT *
FROM octdap.TESTING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
        ( t.loan_duration eq . ));

QUIT;


TITLE 'STEP 2:Count the total number of loan application without stating their loan duration';
FOOTNOTE '----END-----';
PROC SQL;
SELECT COUNT(*) Label = 'Number of loan Applicants'
FROM octdap.TESTING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
        ( t.loan_duration eq . ));
QUIT;

/* Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TESTING_BK_DS AS
SELECT *
FROM octdap.TESTING_DS;
QUIT;


/* STEP 3: Impute the missing values found in the Continuous variable - loan duration */;
PROC STDIZE DATA = octdap.TESTING_DS REPONLY
METHOD = MEAN OUT = octdap.TESTING_DS;
VAR loan_duration;
QUIT;


TITLE 'STEP 4: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their loan duration';
FOOTNOTE '----END-----';
PROC SQL;
SELECT *
FROM octdap.TESTING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
        ( t.loan_duration eq . ));
QUIT;
TITLE 'STEP 5:Count the total number of loan application without stating their loan duration';
FOOTNOTE '----END-----';
PROC SQL;
SELECT COUNT(*) Label = 'Number of loan Applicants'
FROM octdap.TESTING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
        ( t.loan_duration eq . ));
QUIT;

/*impute continuous variable of loan amount*/
TITLE 'STEP 1: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their loan amount';
FOOTNOTE '----END-----';
PROC SQL;
SELECT *
FROM octdap.TESTING_DS am
WHERE ( ( am.loan_amount IS MISSING ) OR
        ( am.loan_amount eq . ));

QUIT;


TITLE 'STEP 2:Count the total number of loan application without stating their loan amount';
FOOTNOTE '----END-----';
PROC SQL;
SELECT COUNT(*) Label = 'Number of loan Amounts'
FROM octdap.TESTING_DS am
WHERE ( ( am.loan_amount IS MISSING ) OR
        ( am.loan_amount eq . ));

QUIT;

/* Make a back up.. */
PROC SQL;
CREATE TABLE octdap.TESTING_BK_DS AS
SELECT *
FROM octdap.TESTING_DS;
QUIT;
 

/* STEP 3: Impute the missing values found in the Continuous variable - loan amount */;
PROC STDIZE DATA = octdap.TESTING_DS REPONLY
METHOD = MEAN OUT = octdap.TESTING_DS;
VAR loan_amount;
QUIT; 

TITLE 'STEP 4: List the details of the loan applicants ';
TITLE2 'who submitted their loan application without stating their loan amount';
FOOTNOTE '----END-----';
PROC SQL;
SELECT *
FROM octdap.TESTING_DS am
WHERE ( ( am.loan_amount IS MISSING ) OR
        ( am.loan_amount eq . ));

QUIT;


TITLE 'STEP 5:Count the total number of loan application without stating their loan amount';
FOOTNOTE '----END-----';
PROC SQL;
SELECT COUNT(*) Label = 'Number of loan Amounts'
FROM octdap.TESTING_DS am
WHERE ( ( am.loan_amount IS MISSING ) OR
        ( am.loan_amount eq . ));

QUIT;

TITLE 'Find the Categorical Variable still with the missing values ';
PROC FORMAT;
	VALUE $missfmt '' = 'Total number of observations with missing values' others = 'Total number of observations without missing values';
RUN;
	
PROC FREQ DATA=octdap.TRAINING_DS;
    FORMAT _CHAR_ $missfmt.;
    TABLES _CHAR_ / MISSING NOCUM NOPERCENT;
RUN;

TITLE 'Find the Categorical Variable of TESTING still with the missing values ';
PROC FORMAT;
	VALUE $missfmt '' = 'Total number of observations with missing values' 
	others = 'Total number of observations without missing values';
RUN;
	
PROC FREQ DATA=octdap.TESTING_DS;
    FORMAT _CHAR_ $missfmt.;
    TABLES _CHAR_ / MISSING NOCUM NOPERCENT;
RUN;

TITLE 'Find the numeric variables of DABLIB_TRAINING_DS with the missing value  ';

PROC FORMAT;
	VALUE missfmt . = 'Total number of observations with missing values' 
	others = 'Total number of observations without missing values';
RUN;
	
PROC FREQ DATA=octdap.TRAINING_DS;
    FORMAT _NUMERIC_ missfmt.;
    TABLES _NUMERIC_ / MISSING NOCUM NOPERCENT;
RUN;


TITLE 'Find the numeric variables of DABLIB_TESTING_DS with the missing value  ';

PROC FORMAT;
	VALUE missfmt . = 'Total number of observations with missing values' 
	others = 'Total number of observations without missing values';
RUN;
	
PROC FREQ DATA=octdap.TESTING_DS;
    FORMAT _NUMERIC_ missfmt.;
    TABLES _NUMERIC_ / MISSING NOCUM NOPERCENT;
RUN;

/*chapter 8*/ 

/*Creation of a model using logistic regression algorithm */ 

PROC LOGISTIC DATA = octdap.TRAINING_DS OUTMODEL = octdap.TRAINING_DS_LR_MODEL;
CLASS
	GENDER
	MARITAL_STATUS
	FAMILY_MEMBERS
	QUALIFICATION
	EMPLOYMENT
	LOAN_HISTORY
	LOAN_LOCATION
     ;
    
MODEL LOAN_APPROVAL_STATUS =
    GENDER
    MARITAL_STATUS
    FAMILY_MEMBERS
    QUALIFICATION
    EMPLOYMENT
    CANDIDATE_INCOME
    GUARANTEE_INCOME
    LOAN_AMOUNT
	LOAN_DURATION	
	LOAN_HISTORY
	LOAN_LOCATION
	;
OUTPUT OUT = octdap.TRAINING_OUT_DS P = PRED_PROS;
RUN;
/*PRED_PROB ->Predicted probability - variable to hold predicted probability 
OUT -> the output will be stored in the dataset 
Akaike Information criterion must ( AIC ) < SC (Schwarz Criterion) */
/*If Pr > ChiSq is <= 0.05, it means that that independent variable is an 
important variable and as it is truely contributing to predite the dependent varibale*/
RUN;

/*Predict the loan approval status using the model created */

PROC LOGISTIC  INMODEL= octdap.TRAINING_DS_LR_MODEL;

SCORE DATA=  octdap.TESTING_DS /*testds */ 
OUT =  octdap.TESTING_LAS_Predicted_DS; /* location of output*/

QUIT;


/**Extract the physical Metadata/Data Dictionary *******/
PROC CONTENTS DATA = octdap.TESTING_LAS_Predicted_DS;
QUIT;


ODS PDF FILE = "/home/u63933323/AssignDAP/report1.pdf";
PROC PRINT DATA = octdap.TESTING_LAS_Predicted_DS;
RUN;
ODS pdf CLOSE;

/*9.2 Generate reporting using ODS code - Output Delivery/ Display System/ 
Display the details of the loan approval status predicted */
ODS PDF CLOSE;
ODS PDF FILE = "/home/u63933323/AssignDAP/report2.pdf";
OPTIONS NODATE;
TITLE1 'Bank Loan Approval Status Predicted';
TITLE2 'APU,TPM';
PROC REPORT DATA =  octdap.TESTING_LAS_Predicted_DS NOWINDOWS; 
BY SME_LOAN_ID_NO;
DEFINE SME_LOAN_ID_NO / GROUP 'LOAN ID';
DEFINE GENDER / GROUP 'GENDER NAME';
DEFINE MARITAL_STATUS / GROUP 'MARITAL STATUS';
DEFINE FAMILY_MEMBERS / GROUP 'FAMILY MEMBERS';
DEFINE CANDIDATE_INCOME / GROUP 'MONTHLY INCOME';
DEFINE GUARANTEE_INCOME / GROUP 'CO_APPLICANT INCOME';
DEFINE LOAN_AMOUNT / GROUP 'LOAN AMOUNT';
DEFINE LOAN_DURATION / GROUP 'LOAN DURATION';
DEFINE LOAN_HISTORY / GROUP 'LOAN HISTORY';
DEFINE LOAN_LOCATION / GROUP 'LOAN LOCATION';
FOOTNOTE '----END OF REPORT -----';
RUN;
ODS PDF CLOSE;


/*Report Generation Begins Here
Generating a complex Report Using LET (user defined variable initialization)
SAS MACRO, IF ELSE IF THEN CONDITION */
OPTIONS MCOMPILENOTE = ALL;
%MACRO MACRO_CR1(ploan_location);

%IF &ploan_location = 'CITY' %THEN
%DO;
   %IF %SYSFUNC(EXIST(octdap.TESTING_LAS_CITY_DS)) %THEN
   %DO;
	    PROC SQL;
	     DROP TABLE octdap.TESTING_LAS_CITY_DS ;
	    RUN;
   %END;
	
	
   PROC SQL;
     CREATE TABLE octdap.TESTING_LAS_CITY_DS AS
     SELECT l.sme_loan_id_no AS Loan_Id,
     CASE WHEN UPCASE(l.gender) = 'MALE' THEN 'M'
          WHEN UPCASE(l.gender) = 'FEMALE' THEN 'F'
          ELSE 'N/A'
     END AS Gender_short_name,
     CASE WHEN UPCASE(l.gender) = 'MALE' AND l.loan_history = 1 THEN 
      'He is a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'MALE' AND l.loan_history = 0 THEN
      'He is not a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'FEMALE' AND l.loan_history = 1 THEN 
      'She is a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'FEMALE' AND l.loan_history = 0 THEN 
      'She is not a good applicant and has settled his past loan(s) on time.'
        ELSE 'N/A'
  
     END AS Remarks /*user defined variable*/
     FROM octdap.TESTING_LAS_Predicted_DS l
     WHERE UPCASE(l.loan_location)=&ploan_location;
    
   RUN;
  

   TITLE1 'Complex report'&SYSDATE;
   TITLE2 'Details of the Loan Applicants connected to ' &ploan_location;
   PROC PRINT DATA = octdap.TESTING_LAS_CITY_DS;
      VAR Loan_Id Gender_short_name Remarks;
   RUN;
%END;



%ELSE %IF &ploan_location = 'VILLAGE' %THEN
%DO;
   %IF %SYSFUNC(EXIST(octdap.TESTING_LAS_VILLAGE_DS)) %THEN
   %DO;
	    PROC SQL;
	     DROP TABLE octdap.TESTING_LAS_VILLAGE_DS ;
	    RUN;
   %END;
	
	
   PROC SQL;
     CREATE TABLE octdap.TESTING_LAS_VILLAGE_DS AS
     SELECT l.sme_loan_id_no AS Loan_Id,
     CASE WHEN UPCASE(l.gender) = 'MALE' THEN 'M'
          WHEN UPCASE(l.gender) = 'FEMALE' THEN 'F'
          ELSE 'N/A'
     END AS Gender_short_name,
     CASE WHEN UPCASE(l.gender) = 'MALE' AND l.loan_history = 1 THEN 
      'He is a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'MALE' AND l.loan_history = 0 THEN
      'He is not a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'FEMALE' AND l.loan_history = 1 THEN 
      'She is a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'FEMALE' AND l.loan_history = 0 THEN 
      'She is not a good applicant and has settled his past loan(s) on time.'
        ELSE 'N/A'
  
     END AS Remarks /*user defined variable*/
     FROM octdap.TESTING_LAS_Predicted_DS l
     WHERE UPCASE(l.loan_location)=&ploan_location;
    
   RUN;
  

   TITLE1 'Complex report'&SYSDATE;
   TITLE2 'Details of the Loan Applicants connected to' &ploan_location;
   PROC PRINT DATA = octdap.TESTING_LAS_VILLAGE_DS;
      VAR Loan_Id Gender_short_name Remarks;
   RUN;
%END;


%ELSE %IF &ploan_location = 'TOWN' %THEN
%DO;
   %IF %SYSFUNC(EXIST(octdap.TESTING_LAS_TOWN_DS)) %THEN
   %DO;
	    PROC SQL;
	     DROP TABLE octdap.TESTING_LAS_TOWN_DS ;
	    RUN;
   %END;
	
	
   PROC SQL;
     CREATE TABLE octdap.TESTING_LAS_TOWN_DS AS
     SELECT l.sme_loan_id_no AS Loan_Id,
     CASE WHEN UPCASE(l.gender) = 'MALE' THEN 'M'
          WHEN UPCASE(l.gender) = 'FEMALE' THEN 'F'
          ELSE 'N/A'
     END AS Gender_short_name,
     CASE WHEN UPCASE(l.gender) = 'MALE' AND l.loan_history = 1 THEN 
      'He is a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'MALE' AND l.loan_history = 0 THEN
      'He is not a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'FEMALE' AND l.loan_history = 1 THEN 
      'She is a good applicant and has settled his past loan(s) on time.'
        WHEN UPCASE(l.gender) = 'FEMALE' AND l.loan_history = 0 THEN 
      'She is not a good applicant and has settled his past loan(s) on time.'
        ELSE 'N/A'
  
     END AS Remarks /*user defined variable*/
     FROM octdap.TESTING_LAS_Predicted_DS l
     WHERE UPCASE(l.loan_location)=&ploan_location;
    
   RUN;
  

   TITLE1 'Complex report'&SYSDATE;
   TITLE2 'Details of the Loan Applicants connected to' &ploan_location;
   PROC PRINT DATA = octdap.TESTING_LAS_TOWN_DS;
      VAR Loan_Id Gender_short_name Remarks;
   RUN;
%END;

%MEND MACRO_CR1;

/*Call the MACRO MACRO_CR1 */
%MACRO_CR1('CITY');
%MACRO_CR1('VILLAGE');
%MACRO_CR1('TOWN');

/* 9.4.2  Bar Chart
The groups were stacked one above the other */

TITLE 'Number of Family members by loan location ';
PROC SGPLOT DATA = octdap.TESTING_LAS_Predicted_DS;
	vbar family_members / group = loan_location groupdisplay = cluster;
	Label family_members = 'Number of Family Members';
RUN;

/* 9.4.3 Pie Chart 
A pie chart is a representation of values as slices of a circle with different colors*/
TITLE 'Loan Approcal Status ';
PROC GCHART DATA = octdap.TESTING_LAS_Predicted_DS;
	pie3d I_LOAN_APPROVAL_STATUS;
RUN;
QUIT;















