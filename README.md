Cobb
====

Declarative streaming task runner and build tool. Like the love child of Gulp and Make.

Installation
------------

The CLI:

```npm install -g cobb```

The API:

```npm install cobb```

Cobbfile
--------

A Cobbfile is a Node module that exports a Cobb [task specification](/quarterto/Saito). It can be written either in JavaScript, or in any language that compiles to JavaScript via the `-r` flag.

```javascript

var tasks = require('cobb').tasks;

module.exports = tasks(function() {
  "%.min.js": this.dep('%.js', function(fileStream) {
    return fileStream.pipe(uglifyTransform);
  }),
  "main.js": function() { return fs.createReadStream('main.js') }
});
```

Then running `cobb main.min.js` will output a minified version of `main.js`. Note that the requirement for the explicit `main.js` task will go away in a future version. For more information and to report issues on the task system, see [Saito's repository](/quarterto/Saito). For issues in the streaming build part, have a look at [Miles](/quarterto/Miles).

Serving
-------

If `serve` is passed as the first argument to `cobb`, it starts a [development server](/quarterto/Eames) which treats the Cobbfile as a routes file. So, given the above Cobbfile, `cobb serve main.min.js` runs a server that responds to `GET /main.min.js` with the minified JavaScript. Cobb only serves the files that are passed in as positional arguments. This requirement will go away in a future version. To report issues on the development server, head over to [Eames](/quarterto).

Philosophy
----------

Cobb is little more than a thin CLI wrapper around Saito, Eames and Miles. Its API *is* Saito. Eames and Miles are little more than 10 lines each. Small modules doing one thing well, making minimal assumptions about how they're being used. &lt;/pretentiousness&gt;

Licence
-------
&copy; MMXIV Matt Brennan

![](http://2011.beercamp.com/img/totem01.gif)
