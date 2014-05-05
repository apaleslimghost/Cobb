``#!/usr/bin/env node``

require! liftoff
{build, serve} = require './index'

Cobb = new liftoff name: \cobb
env <- Cobb.launch

if env.config-path?
	process.chdir env.config-base
	spec = require that

	[cmd, ...args] = env.argv._

	if cmd is \serve
		serve spec .listen env.argv.port ? 8080
	else
		build spec, env.argv._

else
	console.error "No cobbfile found."
	process.exit 2