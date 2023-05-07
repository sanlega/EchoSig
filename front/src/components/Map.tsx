import { useEffect, useState } from 'react';

export const Map: any = () => {
  const [map, setMap] = useState<google.maps.Map | null>(null);
  const [location, setLocation] = useState<google.maps.LatLng | null>(null);

  useEffect(() => {
    const map = new google.maps.Map(document.getElementById('map') as HTMLElement, {
      center: { lat: 0, lng: 0 },
      zoom: 17,
    });

    setMap(map);

    navigator.geolocation.getCurrentPosition(
      (position) => {
        const { latitude, longitude } = position.coords;
        const location = new google.maps.LatLng(latitude, longitude);
        map.setCenter(location);
        setLocation(location);
      },
      (error) => {
        console.error(error);
      },
      { enableHighAccuracy: true }
    );
  }, []);

  return (
    <div id="map" style={{ height: '70vh', width: '1024px', borderRadius: '40px'}}>
      {location && (
        <div>
          Your current location: {location.lat()}, {location.lng()}
        </div>
      )}
    </div>
  );
};

// style={{ height: '70vh', width: '1024px', borderRadius: '40px'}}
