$version: "2"

namespace hello

use alloy#simpleRestJson

@simpleRestJson
service WeatherService {
    operations: [GetWeather, CreatCity]
}

@http(method: "GET", uri: "/cities/{cityId}/weather")
@readonly
operation GetWeather {
    input := {
        @required
        @httpLabel
        cityId: CityId
    }
    output := {
        @required
        weather: String
        degrees: Integer
    }
}

@http(method: "POST", uri: "/cities")
operation CreatCity {
    input := {
        @required
        city: String
        @required
        country: String
    }
    output := {
        @required
        cityId: CityId
    }
}

string CityId
