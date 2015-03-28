
# Make sure the properties actually exsists when called

var needle = 0.0;
var fuel_tank = func {
   var liters = 1000.0 * getprop("/consumables/fuel/total-fuel-m3");

   if (liters < 10) {
      needle = 12.75 + liters * 7.725;
   } else {
      needle = 48 + liters * 4.2;
   }

   setprop("/sim/model/fkdr1/fuel", needle);

   settimer( func {fuel_tank() },1.0);
}

fuel_tank();
