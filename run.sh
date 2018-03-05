#!/bin/bash

docker run --rm -it -p 2369:2368 \
-v $(pwd)/ghost/config.js:/var/lib/ghost/config.js \
-v $(pwd)/ghost/content:/var/lib/ghost/content \
ghost:0.11.11

