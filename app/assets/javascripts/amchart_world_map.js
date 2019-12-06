var initialize_world_map;
initialize_world_map = function() {
  var visited_countries = gon.visited_countries;
  function countriesOutput() {
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
    theme: 'light',
    projection: 'miller',
    panEventsEnabled: false,
    backgroundColor: '#B4DBEE',
    backgroundAlpha: 1,
    zoomControl: {
      zoomControlEnabled: true,
    },
    dataProvider: {
      map: 'worldHigh',
      getAreasFromMap: true,
      areas: countriesOutput(),
    },
    areasSettings: {
      autoZoom: false,
      color: '#BFBFBF',
      colorSolid: '#D3B288',
      selectedColor: '#D3A66C',
      outlineColor: '#2F3841',
      rollOverColor: '#C0E0D1',
      rollOverOutlineColor: '#2F3841',
    },
  });
};
