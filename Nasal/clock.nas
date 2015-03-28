
# Make sure the properties actually exsists when called
setprop("/instrumentation/clock/local-hour", 0);
setprop("/instrumentation/clock/indicated-min", 0);

var ACUITY = 1/60;
var hours = var minutes = 0;
var clock_hour = func {
   hours = getprop("/instrumentation/clock/local-hour");
   minutes = getprop("/instrumentation/clock/indicated-min") * ACUITY;

   setprop("/sim/model/fkdr1/clock/hour", hours + minutes);

   settimer( func {clock_hour() },1.0);
}

clock_hour();
