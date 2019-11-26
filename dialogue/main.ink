INCLUDE bag.ink
INCLUDE car.ink
INCLUDE ditch.ink
INCLUDE epilogue.ink
INCLUDE gas-station.ink
INCLUDE testing.ink

// player
VAR mechanic_skill = 0

// inventory
LIST fuels = none, gas, oxygen
LIST items = cooler, cables

// car properties
VAR car_fuel = none
VAR is_trunk_open = false
VAR is_hood_open = false
VAR is_car_started = false

// environment properties
VAR is_cable_attached = false
VAR is_gas_available = false