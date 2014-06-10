function Tracking(){}

Tracking.prototype.config = function(conf){
	this.Name 	   = conf.trackName;
	this.eventLink = conf.eventLink;

	this.getNavigator();
	this.catchErrors();
} 


Tracking.prototype.getNavigator = function(){
	this._navigator = {};
	for (var i in navigator) this._navigator[i] = navigator[i];
	delete this._navigator.plugins;
	delete this._navigator.mimeTypes;
}

Tracking.prototype.e = function(name, values, callback){
	this.EventName = name;
	this.EventValues = values;
	this.EventCallback = callback;
	this.EventID  = '';

	this.sendEvent();
}

Tracking.prototype.sendEvent = function(data){
	/*Save the event to the DB*/
	this.EventArr = {
		'Track':this.Name,
		'Evnt':this.EventName,
		'EvntVal': typeof this.EventValues !== 'string' ? JSON.stringify(this.EventValues) : this.EventValues,
		'navigator': this._navigator
	} 

	$.ajax({
	  type: 'POST',
	  url: _track.eventLink,
	  data: JSON.stringify(this.EventArr),
	  success: function(data){
			_track.EventID = data;
	  },
	  dataType: 'json',
	  async:false
	});
}


Tracking.prototype.catchErrors = function(){
	window.onerror = function (errorMsg, url, lineNumber) {
	 	var msg = '_Error';
	 	var errData = {
	 		'errUrl:'	 : url,
	 		'lineNumber' : lineNumber,
	 		'errorMsg'	 : errorMsg,
	 		'LastEvent'	 : _track.EventName,
	 		'LastEventID': _track.EventID
	 	}
	 	_track.e(msg, JSON.stringify(errData));
	}
}

var _track = new  Tracking();

_track.config({
	trackName: 'Cod validation',
	eventLink: root_path+'tracking/setEvent'
})
