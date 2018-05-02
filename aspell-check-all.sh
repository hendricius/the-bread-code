#!/bin/bash

for f in **/*.md; do
	aspell --home-dir=. check $f
done