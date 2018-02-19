#!/bin/sh

rsync -vrihtl DevCeption:/srv/docker ./configs --delete
rsync -vrihtl DevCeption:/srv/www ./ --delete
