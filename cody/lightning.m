function d = lightning(s)
%Write a function named LightningDistance that outputs "distance" given input "seconds".
%Seconds is the time from seeing lightning to hearing thunder. The speed of sound is 768
%miles per hour at sea level; first define a variable with this value (good practice).
%Distance should be in miles.
speed_sound_mph = 768;
speed_sound_mpm = 768/60;
speed_sound_mps = speed_sound_mpm/60;
%velocity  = distance/time_taken.
%distance = velocity * time_taken

%distance_in_miles = velocity_in_miles_per_second * number_of_seconds

d = speed_sound_mps * s;


