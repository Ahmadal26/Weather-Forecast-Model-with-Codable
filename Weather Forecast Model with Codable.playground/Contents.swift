
import UIKit

let jsonData = """
{
    "city": "Kuwait",
    "temperature": 25,
    "condition": "Sunny",
    "forecast": [
        {
            "day": "Monday",
            "high": 29,
            "low": 17,
            "condition": "Partly Cloudy"
        },
        {
            "day": "Tuesday",
            "high": 18,
            "low": 13,
            "condition": "Rain"
        }
    ]
}

""".data(using: .utf8)!





struct Weather : Codable {
    
    var temperature: Int
    var condition: String
    var city: String
    var forecast: [Forecast]
    

    
}
struct Forecast: Codable {
    
    var day: String
    var high: Double
    var low: Double
    var condition: String
}

do {
   
    let weather = try JSONDecoder().decode(Weather.self, from: jsonData)
    print("City: \(weather.city)")
    print("Temperature: \(weather.temperature)°C")
    print("Condition: \(weather.condition)")
    print("Forecast:")
    
    for weathers in weather.forecast{
        
        print("  Day: \(weathers.day), High: \(weathers.high)°C, Low: \(weathers.low)°C, Condition: \(weathers.condition)")
    }
    
} catch {
    print("Error decoding JSON: \(error)")
}



