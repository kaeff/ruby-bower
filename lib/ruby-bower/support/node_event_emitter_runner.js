// A custom execjs runner that expects the source to return an instance of EventEmitter
// http://nodejs.org/api/events.html#events_class_events_eventemitter
// Works in node only
(function(program, execJS) { execJS(program) })(function(callback) { #{source}
}, function(program) {
  var output, print = function(string) {
    process.stdout.write('' + string);
  };
  var callback = function(result){
    if (typeof result == 'undefined' && result !== null) {
      print('["ok"]');
    } else {
      try {
        print('["ok", ' + JSON.stringify(result) + ']');
      } catch (err) {
        print('["err"]');
      }
    }
  };
  var returnError = function(err) {
    print(JSON.stringify(['err', '' + err]));
  };

  // data and end -> success, error -> error
  try {
    program().on('data', callback).on('end', callback).on('error', returnError);
  } catch (err) {
    returnError(err);
  }
});
