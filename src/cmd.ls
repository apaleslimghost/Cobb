``#!/usr/bin/env node``

require! liftoff
{build, serve, tasks} = require './index'
{js-variants} = require \interpret

Cobb = new liftoff name: \cobb extensions: js-variants
env <- Cobb.launch

if env.config-path?
	process.chdir env.config-base
	spec = require that
	throw new SyntaxError "Malformed cobbfile" if spec not instanceof tasks

	[cmd, ...args] = env.argv._

	if cmd is \serve
		serve spec~task .listen env.argv.port ? 8080
	else
		build spec~task, env.argv._

else
	console.error "No cobbfile found."
	process.exit 2
