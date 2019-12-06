var initialize_world_map;
initialize_world_map = function() {
  var visited_countries = gon.visited_countries;
  function countriesOutput() {
    debugger;
    var countriesData = [];
    for (i = 0; i < visited_countries.length; i++) {
      country = visited_countries[i];
      countriesData.push({
        id: country,
        showAsSelected: true,
      });
    }
    return countriesData;
  }
  var map = AmCharts.makeChart('mapdiv', {
    type: 'map',
    theme: 'dark',
    projection: 'miller',
    // language: 'JA',
    panEventsEnabled: false,
    dragMap: false,
    backgroundColor: '#F6F6F6',
    backgroundAlpha: 1,
    zoomOnDoubleClick: false,
    zoomControl: {
      homeButtonEnabled: false,
      zoomControlEnabled: false,
      panControlEnabled: false,
    },
    dataProvider: {
      map: 'worldHigh',
      getAreasFromMap: true,
      areas: countriesOutput(),
    },
    areasSettings: {
      autoZoom: false,
      color: '#BFBFBF',
      colorSolid: '#DEC9A4',
      selectedColor: '#DEC9A4',
      outlineColor: '#555555',
      rollOverColor: '#B9D3C2',
      rollOverOutlineColor: '#555555',
    },
  });
  map.language = 'JA';
};
