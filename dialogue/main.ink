INCLUDE bag.ink
INCLUDE car.ink
INCLUDE ditch.ink
INCLUDE epilogue.ink
INCLUDE gas-station.ink
INCLUDE testing.ink

// player
VAR mechanic_skill = 1

// inventory
LIST fuels = none, gas, rocket, quantum
LIST items = cooler, cables

// car properties
VAR car_fuel = none
VAR is_trunk_open = false
VAR is_hood_open = true
VAR is_car_started = false

// environment properties
VAR is_cable_attached = true
VAR is_gas_available = false

// item properties
VAR is_cooler_full = false