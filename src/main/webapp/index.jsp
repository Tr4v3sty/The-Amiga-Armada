<html>
  <head>
    <title>The-Amiga-Armada</title>
    <style type="text/css">
      html, body, #basicMap {
          width: 100%;
          height: 100%;
          margin: 0;
      }
    </style>

    <script src="OpenLayers/OpenLayers.js"></script>
    <script>

    function init() {
      map = new OpenLayers.Map("basicMap");
      var mapnik         = new OpenLayers.Layer.OSM();
      var fromProjection = new OpenLayers.Projection("EPSG:4326");   // Transform from WGS 1984
      var toProjection   = new OpenLayers.Projection("EPSG:900913"); // to Spherical Mercator Projection
      var position       = new OpenLayers.LonLat(-80.84,35.23).transform( fromProjection, toProjection);
      var zoom           = 13; 

      /*var heatmap = new OpenLayers.Layer.Heatmap(
			  

  			
      );*/
      
	  
      var gwc = new OpenLayers.Layer.WMS(
              "Global Imagery",
              "http://maps.opengeo.org/geowebcache/service/wms",
              {layers: "bluemarble"},
              {tileOrigin: new OpenLayers.LonLat(-180, -90)}
          );
      
      var dm_wms = new OpenLayers.Layer.WMS(
              "DM Solutions Demo",
              "http://www2.dmsolutions.ca/cgi-bin/mswms_gmap",
              {layers: "bathymetry,land_fn,park,drain_fn,drainage," +
                       "prov_bound,fedlimit,rail,road,popplace",
               transparent: "true", format: "image/png"},
              {visibility: false}
          );

	  
 	  map.addControl(new OpenLayers.Control.LayerSwitcher({'ascending':false}));
	  map.addControl(new OpenLayers.Control.ScaleLine());
      map.addControl(new OpenLayers.Control.PanZoomBar());
      
      map.addLayers([mapnik, gwc, dm_wms]);
      map.setCenter(position, zoom );
    }


        
    
    </script>
  </head>
  <body onload="init();">
    <div id="basicMap" style="width: 98%; height: 98%"></div>
  </body>
</html>

