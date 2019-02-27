libname libsas '/folders/myfolders/project1';

Title PUBG users infomation;
data libsas.pubg_user_info;
      infile "/folders/myfolders/project1/pubg_user_info.csv" dlm=',' firstobs=2;
      input	create_time:mmddyy10.
            double_chicken
	        double_damage_per_match
	        double_deaths_num
	        double_headshot_kills_sum
	        double_kills_max
	        double_kills_sum
	        double_play_times
	        double_rating
	        double_survived_second
	        id
	        mode:$3.
	        season:$10.
	        solo_chicken
	        solo_damage_per_match
	        solo_deaths_num
	        solo_headshot_kills_sum
	        solo_kills_max
	        solo_kills_sum
	        solo_play_times
	        solo_rating
	        level1:$5.
			level2:$5.
	        solo_survived_second
	        square_chicken
	        square_damage_per_match
	        square_deaths_num
	        square_headshot_kills_sum
	        square_kills_max
	        square_kills_sum
	        square_play_times
	        square_rating
	        square_survived_second
	        user_id:$20.;
      format create_time ddmmyy10.;
      label user_id ='user id'
            mode = 'mode(FPP or TPP)'
            season = 'season'
            solo_chicken ='solo chichen'
            solo_damage_per_match = 'solo damage per match'
            solo_deaths_num = 'solo deaths num'
            solo_headshot_kills_sum	= 'solo headshot kills sum'
            solo_kills_max = 'solo kills max'
            solo_kills_sum = 'solo kills sum'
            solo_play_times =	'solo play times'
            solo_rating	= 'solo rating'
            solo_survived_second = 'solo survived second'
            double_chicken = 'double chicken'
            double_damage_per_match = 'double damage per match'
            double_deaths_num	= 'double deaths num'
            double_headshot_kills_sum = 'double headshot kills sum'
            double_kills_max = 'double kills max'
            double_kills_sum = 'double kills sum'
            double_play_times	= 'double play times'
            double_rating = 'double rating'
            double_survived_second = 'double survived second'
            square_chicken = 'square chicken'
            square_damage_per_match	= 'square damage per match'
            square_deaths_num	= 'square deaths num'
            square_headshot_kills_sum = 'square headshot kills sum'
            square_kills_max = 'square kills max'
            square_kills_sum = 'square kills sum'
            square_play_times = 'square play times'
            square_rating = 'square rating'
            square_survived_second = 'square survived second';
      drop id;
run;

proc contents data=libsas.pubg_user_info;
run;

proc print data=libsas.pubg_user_info;
run;
