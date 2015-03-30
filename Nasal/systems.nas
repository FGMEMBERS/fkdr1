
var ACUITY = 1/60;
var run_systems = func {

   # clock
   var hours = getprop("/instrumentation/clock/local-hour") or 0;
   var minutes = getprop("/instrumentation/clock/indicated-min") or 0;
   setprop("/sim/model/fkdr1/clock/hour", hours + minutes * ACUITY);

   # fuel gauge
   var liters = 1000.0 * getprop("/consumables/fuel/total-fuel-m3");

   if (liters < 10) {
      needle = 12.75 + liters * 7.725;
   } else {
      needle = 48 + liters * 4.2;
   }
   setprop("/sim/model/fkdr1/fuel", needle);

   # altitude adjusted
   var pressure = getprop("/systems/static/pressure-inhg") or 0;
   var presure_init = getprop("/sim/model/fkdr1/pressure-offset") or 0;
   setprop("/sim/model/fkdr1/pressure-inhg-adj", pressure + presure_init);

   settimer( func {run_systems() },0.1);
}

run_systems();
