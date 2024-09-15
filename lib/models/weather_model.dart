class WeatherModel {
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherNamestate;
  //normal constructor
  WeatherModel(
      {required this.weatherNamestate,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});
  //named constructor
  // the factroy key word solve the nalable varible becouse return objec from the class without assumaint operation
  factory WeatherModel.fromJeson(dynamic Data) {
    Map weathertemp = Data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        weatherNamestate: weathertemp["condition"]["text"],
        date: Data['location']['localtime'],
        temp: Data["current"]["temp_c"],
        maxTemp: weathertemp["maxtemp_c"],
        minTemp: weathertemp["mintemp_c"]);
    //mafdy saad
    //ie
  }
}
