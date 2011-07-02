//Define constants for math equations
#define MILES_PER_METER      0.00062137f
#define EARTH_RADIUS_METERS  6372795.0f

float DistanceBetween2Points( float Lat1, float Lon1, float Lat2, float Lon2 )
  {
    float dLat = radians( Lat2 - Lat1 );
    float dLon = radians( Lon2 - Lon1 );
  
    float a = sin( dLat / 2.0f ) * sin( dLat / 2.0f ) +
            cos( radians( Lat1 ) ) * cos( radians( Lat2 ) ) *
            sin( dLon / 2.0f ) * sin( dLon / 2.0f );
            
    float d = 2.0f * atan2( sqrt( a ), sqrt( 1.0f - a ) ) * EARTH_RADIUS_METERS * .00062137;
    return d;
  }



int DirectionToPoint(float Lat1, float Lon1, float Lat2, float Lon2)
{
  float dLat1 = ( Lat2 - Lat1 );
  float dLon1 = ( Lon2 - Lon1 );
  float y = sin(dLon1) * cos(Lat2);
  float x = cos(Lat1) * sin(Lat2) - sin(Lat1) * cos (Lat2) * cos(dLon1);

int bearing = atan2(x,y);
//Convert to degrees
bearing = (bearing * 180.0) / 3.14;
//Normalize
bearing = 360 - (bearing + 360) % 360;

return bearing;
}
