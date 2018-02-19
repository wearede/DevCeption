#!/bin/sh

rsync -vrihtl ./configs/docker DevCeption:/srv --delete
rsync -vrihtl ./www DevCeption:/srv --delete
