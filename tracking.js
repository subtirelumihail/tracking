function Tracking(){}

Tracking.prototype.config = function(conf){
	this.Name 	   = conf.trackName;
	this.userLink  = conf.userLink;
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

	this.sendEvent();
}

Tracking.prototype.sendEvent = function(data){
	/*Save the event to the DB*/
	this.EventArr = {
		'Evnt':this.EventName,
		'EvntVal':this.EventValues,
		'navigator': this._navigator
	} 

	$.post( _track.eventLink , JSON.stringify(this.EventArr), this.EventCallback, 'json' );
}


Tracking.prototype.catchErrors = function(){
	window.onerror = function (errorMsg, url, lineNumber) {
	 	var msg = '_Error';
	 	var Val = 'Line number '+lineNumber+': '+errorMsg;
	 	_track.e(msg, Val);
	}
}

var _track = new  Tracking();

_track.config({
	trackName: 'Cod validation',
	userLink:  root_path+'tracking/guint',
	eventLink: root_path+'tracking/setEvent'
})

