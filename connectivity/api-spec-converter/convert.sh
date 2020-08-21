#!/bin/bash

# setup docker image
docker build -t api-spec .

# convert
curl -X OPTIONS http://theBoss:theBoss@localhost:8081/designer/api/persons > spec.wadl
python2 -m SimpleHTTPServer & 
pyPid=$! 
docker run --network host -it api-spec api-spec-converter --from wadl --to openapi_3 http://localhost:8000/spec.wadl > spec-openApi.json
cat spec-openApi.json
kill -s 9 $pyPid
