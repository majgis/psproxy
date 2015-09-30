#!/usr/bin/env node

var psproxy = require('../index');

var setting = process.argv[2];

psproxy(setting);