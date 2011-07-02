///////GPS Functions

void gpsdump(TinyGPS &gps)
{
  float lat, lon;

  gps.f_get_position(&lat, &lon);
  Currentlat = lat;
 Currentlon = lon;
  feedgps(); // If we don't feed the gps during this long routine, we may drop characters and get checksum errors
}
  
bool feedgps()
{
  while (gpscom.available())
  {
    if (gps.encode(gpscom.read()))
      return true;
  }
  return false;
}
