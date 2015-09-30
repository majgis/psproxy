var spawn = require('child_process').spawn;

function psproxy(setting) {
	var arg;

	if (setting === true || setting === 'on')
		arg = 'on';
	else if (setting === false || setting === 'off')
		arg = 'off';
	else
	  arg = '';

	var childProcess = spawn('sh', ['bin/psproxy.sh', arg]);
	childProcess.stdout.pipe(process.stdout);
}

module.exports = psproxy;