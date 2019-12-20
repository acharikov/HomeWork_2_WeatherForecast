//
// CurrentWeatherDataAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class ForecastDataAPI {
    /**
     * enum for parameter units
     */
    public enum Units_currentWeatherData: String {
        case standard = "standard"
        case metric = "metric"
        case imperial = "imperial"
    }

    /**
     * enum for parameter lang
     */
    public enum Lang_currentWeatherData: String {
        case ar = "ar"
        case bg = "bg"
        case ca = "ca"
        case cz = "cz"
        case de = "de"
        case el = "el"
        case en = "en"
        case fa = "fa"
        case fi = "fi"
        case fr = "fr"
        case gl = "gl"
        case hr = "hr"
        case hu = "hu"
        case it = "it"
        case ja = "ja"
        case kr = "kr"
        case la = "la"
        case lt = "lt"
        case mk = "mk"
        case nl = "nl"
        case pl = "pl"
        case pt = "pt"
        case ro = "ro"
        case ru = "ru"
        case se = "se"
        case sk = "sk"
        case sl = "sl"
        case es = "es"
        case tr = "tr"
        case ua = "ua"
        case vi = "vi"
        case zhCn = "zh_cn"
        case zhTw = "zh_tw"
    }

    /**
     * enum for parameter mode
     */
    public enum Mode_currentWeatherData: String {
        case json = "json"
        case xml = "xml"
        case html = "html"
    }

    /**
     Call current weather data for one location
     
     - parameter q: (query) **City name**. *Example: London*. You can call by city name, or by city name and country code. The API responds with a list of results that match a searching word. For the query value, type the city name and optionally the country code divided by a comma; use ISO 3166 country codes. (optional)
     - parameter id: (query) **City ID**. *Example: &#x60;2172797&#x60;*. You can call by city ID. The API responds with the exact result. The List of city IDs can be downloaded [here](http://bulk.openweathermap.org/sample/). You can include multiple cities in this parameter &amp;mdash; just separate them by commas. The limit of locations is 20. *Note: A single ID counts as a one API call. So, if you have city IDs, it&#39;s treated as 3 API calls.* (optional)
     - parameter lat: (query) **Latitude**. *Example: 35*. The latitude coordinate of the location of your interest. Must use with &#x60;lon&#x60;. (optional)
     - parameter lon: (query) **Longitude**. *Example: 139*. Longitude coordinate of the location of your interest. Must use with &#x60;lat&#x60;. (optional)
     - parameter zip: (query) **Zip code**. Search by zip code. *Example: 95050,us*. Please note that if the country is not specified, the search uses USA as a default. (optional)
     - parameter units: (query) **Units**. *Example: imperial*. Possible values: &#x60;standard&#x60;, &#x60;metric&#x60;, and &#x60;imperial&#x60;. When you do not use the &#x60;units&#x60; parameter, the format is &#x60;standard&#x60; by default. (optional, default to .imperial)
     - parameter lang: (query) **Language**. *Example: en*. You can use lang parameter to get the output in your language. We support the following languages that you can use with the corresponded lang values: Arabic - &#x60;ar&#x60;, Bulgarian - &#x60;bg&#x60;, Catalan - &#x60;ca&#x60;, Czech - &#x60;cz&#x60;, German - &#x60;de&#x60;, Greek - &#x60;el&#x60;, English - &#x60;en&#x60;, Persian (Farsi) - &#x60;fa&#x60;, Finnish - &#x60;fi&#x60;, French - &#x60;fr&#x60;, Galician - &#x60;gl&#x60;, Croatian - &#x60;hr&#x60;, Hungarian - &#x60;hu&#x60;, Italian - &#x60;it&#x60;, Japanese - &#x60;ja&#x60;, Korean - &#x60;kr&#x60;, Latvian - &#x60;la&#x60;, Lithuanian - &#x60;lt&#x60;, Macedonian - &#x60;mk&#x60;, Dutch - &#x60;nl&#x60;, Polish - &#x60;pl&#x60;, Portuguese - &#x60;pt&#x60;, Romanian - &#x60;ro&#x60;, Russian - &#x60;ru&#x60;, Swedish - &#x60;se&#x60;, Slovak - &#x60;sk&#x60;, Slovenian - &#x60;sl&#x60;, Spanish - &#x60;es&#x60;, Turkish - &#x60;tr&#x60;, Ukrainian - &#x60;ua&#x60;, Vietnamese - &#x60;vi&#x60;, Chinese Simplified - &#x60;zh_cn&#x60;, Chinese Traditional - &#x60;zh_tw&#x60;. (optional, default to .en)
     - parameter mode: (query) **Mode**. *Example: html*. Determines the format of the response. Possible values are &#x60;xml&#x60; and &#x60;html&#x60;. If the mode parameter is empty, the format is &#x60;json&#x60; by default. (optional, default to .json)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func forecastData(q: String? = nil, id: String? = nil, lat: String? = nil, lon: String? = nil, zip: String? = nil, units: Units_currentWeatherData? = nil, lang: Lang_currentWeatherData? = nil, mode: Mode_currentWeatherData? = nil, appKey: String, count: Int? = nil, completion: @escaping ((_ data: ForecastItems?,_ error: Error?) -> Void)) {
        
        forecastDataWithRequestBuilder(q: q, id: id, lat: lat, lon: lon, zip: zip, units: units, lang: lang, mode: mode, appKey: appKey, count: count).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Call current weather data for one location
     - GET /weather
     - Access current weather data for any location on Earth including over 200,000 cities! Current weather is frequently updated based on global models and data from more than 40,000 weather stations.
     - API Key:
       - type: apiKey appid (QUERY)
       - name: app_id
     - parameter q: (query) **City name**. *Example: London*. You can call by city name, or by city name and country code. The API responds with a list of results that match a searching word. For the query value, type the city name and optionally the country code divided by a comma; use ISO 3166 country codes. (optional)
     - parameter id: (query) **City ID**. *Example: &#x60;2172797&#x60;*. You can call by city ID. The API responds with the exact result. The List of city IDs can be downloaded [here](http://bulk.openweathermap.org/sample/). You can include multiple cities in this parameter &amp;mdash; just separate them by commas. The limit of locations is 20. *Note: A single ID counts as a one API call. So, if you have city IDs, it&#39;s treated as 3 API calls.* (optional)
     - parameter lat: (query) **Latitude**. *Example: 35*. The latitude coordinate of the location of your interest. Must use with &#x60;lon&#x60;. (optional)
     - parameter lon: (query) **Longitude**. *Example: 139*. Longitude coordinate of the location of your interest. Must use with &#x60;lat&#x60;. (optional)
     - parameter zip: (query) **Zip code**. Search by zip code. *Example: 95050,us*. Please note that if the country is not specified, the search uses USA as a default. (optional)
     - parameter units: (query) **Units**. *Example: imperial*. Possible values: &#x60;standard&#x60;, &#x60;metric&#x60;, and &#x60;imperial&#x60;. When you do not use the &#x60;units&#x60; parameter, the format is &#x60;standard&#x60; by default. (optional, default to .imperial)
     - parameter lang: (query) **Language**. *Example: en*. You can use lang parameter to get the output in your language. We support the following languages that you can use with the corresponded lang values: Arabic - &#x60;ar&#x60;, Bulgarian - &#x60;bg&#x60;, Catalan - &#x60;ca&#x60;, Czech - &#x60;cz&#x60;, German - &#x60;de&#x60;, Greek - &#x60;el&#x60;, English - &#x60;en&#x60;, Persian (Farsi) - &#x60;fa&#x60;, Finnish - &#x60;fi&#x60;, French - &#x60;fr&#x60;, Galician - &#x60;gl&#x60;, Croatian - &#x60;hr&#x60;, Hungarian - &#x60;hu&#x60;, Italian - &#x60;it&#x60;, Japanese - &#x60;ja&#x60;, Korean - &#x60;kr&#x60;, Latvian - &#x60;la&#x60;, Lithuanian - &#x60;lt&#x60;, Macedonian - &#x60;mk&#x60;, Dutch - &#x60;nl&#x60;, Polish - &#x60;pl&#x60;, Portuguese - &#x60;pt&#x60;, Romanian - &#x60;ro&#x60;, Russian - &#x60;ru&#x60;, Swedish - &#x60;se&#x60;, Slovak - &#x60;sk&#x60;, Slovenian - &#x60;sl&#x60;, Spanish - &#x60;es&#x60;, Turkish - &#x60;tr&#x60;, Ukrainian - &#x60;ua&#x60;, Vietnamese - &#x60;vi&#x60;, Chinese Simplified - &#x60;zh_cn&#x60;, Chinese Traditional - &#x60;zh_tw&#x60;. (optional, default to .en)
     - parameter mode: (query) **Mode**. *Example: html*. Determines the format of the response. Possible values are &#x60;xml&#x60; and &#x60;html&#x60;. If the mode parameter is empty, the format is &#x60;json&#x60; by default. (optional, default to .json)
     - returns: RequestBuilder<ForecastItems>
     */
    open class func forecastDataWithRequestBuilder(q: String? = nil, id: String? = nil, lat: String? = nil, lon: String? = nil, zip: String? = nil, units: Units_currentWeatherData? = nil, lang: Lang_currentWeatherData? = nil, mode: Mode_currentWeatherData? = nil, appKey: String, count: Int? = nil) -> RequestBuilder<ForecastItems> {
        let path = "/forecast"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "q": q?.encodeToJSON(),
            "id": id?.encodeToJSON(),
            "lat": lat?.encodeToJSON(),
            "lon": lon?.encodeToJSON(),
            "zip": zip?.encodeToJSON(),
            "units": units?.encodeToJSON(),
            "lang": lang?.encodeToJSON(),
            "mode": mode?.encodeToJSON(),
            "appid": appKey.encodeToJSON(),
            "cnt": count?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<ForecastItems>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
