/**
 * Created by JetBrains PhpStorm.
 * User: Waxayaz
 * Date: 30/03/12
 * Time: 20:47
 * To change this template use File | Settings | File Templates.
 */

var SIGNAL_KILL = 0x00;
var SIGNAL_MINIMIZE = 0x01;
var SIGNAL_MAXIMIZE = 0x02;

var SIGNAL_LOGIN = 0x10;
var SIGNAL_LOGOUT = 0x11;

var JSx11SignalManager = $.inherit({
    __constructor: function() {
        this.isSending = false;
        this.signalQueue = new Array();
        this.signalListeners = new Array();
    },

    initialise: function() {
        // Add Global Methods
        sendSignal = function(signal, data) { jsx11.signalManager.sendSignal(signal, data); }
        addSignalListener = function(listener) { jsx11.signalManager.addSignalListener(listener); }
    },


    /**
     * Add Signals listener to JSx11 Application
     * @param listener
     */
    addSignalListener: function(listener) {
        if(!isUndefined(listener.onSignalReceived)){
            this.signalListeners.push(listener);
        } else {
            log.error("Cannot add listener object without onSignalReceived() method !")
        }
    },


    /**
     * Add signal to queue
     * @param signal
     * @param data
     */
    sendSignal: function(signal, data) {
        var jsx11Signal = new JSx11Signal(signal, data);
        this.signalQueue.push(jsx11Signal);

        if(!this.isSending) this.__sendNextSignalInQueue();
    },


    /**
     * Send next waiting signal in queue
     */
    __sendNextSignalInQueue: function() {
        this.isSending = true;

        // Get next signal in queue
        var signal = this.signalQueue.shift();

        // Send signal to each listener
        var listenerIndex;
        for(listenerIndex=0; listenerIndex<this.signalListeners.length; listenerIndex++) {
            var listener = this.signalListeners[listenerIndex];
            if(!isUndefined(listener.onSignalReceived)){
                setTimeout(function(){listener.onSignalReceived(signal);}, 20);
            }
        }

        if(this.signalQueue.length > 0) {
            this.__sendNextSignalInQueue();
        } else {
            this.isSending = false;
        }
    }

});


/**
 * This class represents a Signal send throw JSx11 Application
 */
var JSx11Signal = $.inherit({
    __constructor: function(type, data) {
        this.type = type;
        this.data = data;
    },
    getType: function() {
        return this.type;
    },
    getData: function() {
        return this.data;
    }
});