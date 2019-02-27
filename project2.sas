libname libsas '/folders/myfolders/project1';

Title PUBG users analysis;

proc means DATA=libsas.pubg_user_info;
	var solo_rating double_rating square_rating;
	title descriptive analysis of user performance;
run;

proc freq DATA=libsas.pubg_user_info;
	tables level1 level2;
	title descriptive analysis of classification variables;
run;

proc ttest DATA=libsas.pubg_user_info;
	class level1;
	var double_rating;
	title T-test for level1 & double_rating;
run;

proc ttest DATA=libsas.pubg_user_info;
	class level1;
	var square_rating;
	title T-test for level1 & square_rating;
run;

proc glm DATA=libsas.pubg_user_info;
	class level2;
	model double_rating = level2;
	means level2 / hovtest=levene;
	title ANOVA for level2 & double_rating;
run;

proc glm DATA=libsas.pubg_user_info;
	class level2;
	model square_rating = level2;
	means level2 / hovtest=levene;
	title ANOVA for level2 & square_rating;
run;

proc corr DATA=libsas.pubg_user_info
  	plots(only)=scatter(nvar=all ellipse=none);
	var solo_rating;
	with double_rating;
	title correlation between solo_rating and double_rating;
run;

proc corr DATA=libsas.pubg_user_info
  	plots(only)=scatter(nvar=all ellipse=none);
	var solo_rating;
	with square_rating;
	title correlation between solo_rating and square_rating;
run;

proc corr DATA=libsas.pubg_user_info
  	plots(only)=scatter(nvar=all ellipse=none);
	var double_rating;
	with square_rating;
	title correlation between double_rating and square_rating;
run;

%let interval = solo_chicken solo_damage_per_match solo_deaths_num
	    		solo_headshot_kills_sum solo_kills_max solo_kills_sum
	    		solo_play_times;

proc glmselect data=libsas.pubg_user_info plots=all;
	STEPWISE: model solo_rating = &interval / selection=stepwise details=steps select=SL slstay=0.05 slentry=0.05;
	title "Stepwise Model Selection for Solo Rating - SL 0.05";
run;

%let interval2 = double_chicken double_damage_per_match double_deaths_num
	    		double_headshot_kills_sum double_kills_max double_kills_sum
	    		double_play_times;

proc glmselect data=libsas.pubg_user_info plots=all;
	STEPWISE: model double_rating = &interval2 / selection=stepwise details=steps select=SL slstay=0.05 slentry=0.05;
	title "Stepwise Model Selection for Double Rating - SL 0.05";
run;
