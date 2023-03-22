import java.util.Scanner; //<>// //<>//
Table theTable;
ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
PFont standard;
int x = 30;
ArrayList <String> floridaAirports = new ArrayList<String>();

void setup() {
  theTable = loadTable("flights2k.csv", "header");
  initFlights();
  countCitiesInState();
  standard =loadFont("AppleSDGothicNeo-UltraLight-20.vlw");
  textFont(standard);
  size(1000, 1000);
  background(#FCFCFC);
}

void initFlights() {
  int rowCount = theTable.getRowCount();
  for (int i = 0; i < rowCount; i++)
  {
    TableRow row = theTable.getRow(i);
    flightsArray.add(new DataPoint(row));
    //  println(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " +flightsArray.get(i).origin + " " +flightsArray.get(i).originCity + " " +flightsArray.get(i).originState +" " +
    //  flightsArray.get(i).originWAC + " " +flightsArray.get(i).dest + " " +flightsArray.get(i).destCity + " " +flightsArray.get(i).destState + " " +flightsArray.get(i).destWAC + " " +flightsArray.get(i).crsDepTime + " " +
    //  flightsArray.get(i).depTime + " " +flightsArray.get(i).crsArrTime +" " + flightsArray.get(i).arrTime + " " +flightsArray.get(i).cancelled + " " +flightsArray.get(i).diverted + " " +flightsArray.get(i).distance);
  }
}

void countCitiesInState() {
  for (int i = 0; i < flightsArray.size(); i++)
  {
    if (flightsArray.get(i).originState.equals("FL"))
    {
      floridaAirports.add(flightsArray.get(i).originCity);
    }
  }
  HashMap<String, Integer> freqMap = new HashMap<String, Integer>();
  for (String city : floridaAirports) {
    if (freqMap.containsKey(city)) {
      freqMap.put(city, freqMap.get(city) + 1);
    } else {
      freqMap.put(city, 1);
    }
  }

  for (String key : freqMap.keySet()) {
    int frequency = freqMap.get(key);
    System.out.println(key + ": " + frequency);
  }
}
void draw() {
  for (int i = 0; i < flightsArray.size(); i++)
  {
    fill(0);
    text(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " +flightsArray.get(i).origin + " " +flightsArray.get(i).originCity + " " +flightsArray.get(i).originState +" " +
      flightsArray.get(i).originWAC + " " +flightsArray.get(i).dest + " " +flightsArray.get(i).destCity + " " +flightsArray.get(i).destState + " " +flightsArray.get(i).destWAC + " " +flightsArray.get(i).crsDepTime + " " +
      flightsArray.get(i).depTime + " " +flightsArray.get(i).crsArrTime +" " + flightsArray.get(i).arrTime + " " +flightsArray.get(i).cancelled + " " +flightsArray.get(i).diverted + " " +flightsArray.get(i).distance, 10, x);
    x = x+30;
  }
}
