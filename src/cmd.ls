``#!/usr/bin/env node``

require! liftoff

Cobb = new liftoff name: \cobb
env <- Cobb.launch

if env.config-path?
	process.chdir env.config-base
	spec = require that
else
	console.error "No cobbfile found."
	process.exit 2