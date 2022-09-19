import Cocoa

let temperatureInCelsius: Double = 31
let temperatureInFahrenheit = (temperatureInCelsius * 9) / 5 + 32

print("""
Current temperature:
    in Celsius - \(temperatureInCelsius)°C
    in Fahrenheit - \(temperatureInFahrenheit)°F
""")
