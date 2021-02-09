/**
 * Created by JetBrains PhpStorm.
 * User: Waxayaz
 * Date: 28/03/12
 * Time: 18:34
 */
__require("modules/JSx11-Log.js");
__require("modules/JSx11-Signals.js");
__require("modules/JSx11-Core.js");

var JSx11_BASE_URL = "http://localhost/JSx11-Client/";
var log =  null;
var jsx11 = null;

/***************************************************************************************************
 * Entry point of JSx11 Application
 * Executed when index.html page is loaded.
 */
$(function() {
    // Initialise Logger
    log = new JSx11Log();
    log.logLevel = log.LEVEL_DEBUG;

    // Initilaise JSx11 Application
    jsx11 = new JSx11();
    jsx11.initialise();
    jsx11.core.waitForModulesLoaded(function() {
        jsx11.initialiseUserDesktop();
    });
});
/*
*
***************************************************************************************************/



/***************************************************************************************************
 * JSx11 Main Class
 * ------------------------------------------------------------------------------------------------
 * This class initialise all JSx11-Client modules and configuration
 *
 */
var JSx11 = $.inherit({

    /**
     * Constructor - Build new JSx11-Client application
     */
    __constructor : function(){
        this.core = new JSx11Core();
        this.signalManager = new JSx11SignalManager();
    },


    /**
     * Initialise JSx11 Application
     */
    initialise: function() {
        // Initialise signal manager
        this.signalManager.initialise();

        // Register JSx11 Application Class as Signal listener
        addSignalListener(jsx11);

        // Load needed modules
        this.core.loadModule("ui/JSx11-Desktop");
        this.core.loadModule("ui/JSx11-Taskbar");

        // Callback
        jsx11.core.waitForModulesLoaded(function() {
            jsx11.desktop = new JSx11Desktop();
            jsx11.taskbar = new JSx11Taskbar();
        });
    },


    /**
     * Method triggered when signal is received
     * @param signal
     */
    onSignalReceived: function(signal) {
        if(signal.getType() == SIGNAL_KILL) {
            log.debug("Signal kill received !");
        } else {
            log.debug("Signal received: " + signal.getType());
        }
    },


    /**
     * Initialise User Desktop
     */
    initialiseUserDesktop: function() {
        // Render main layout
        this.core.renderTemplate("body", "UserDesktopLayout.html");

        // Initialise Taskbar and Desktop
        jsx11.taskbar.initialise();
        jsx11.desktop.initialise();

        sendSignal("toot");
        sendSignal(SIGNAL_KILL);
    }
});
/*
*
***************************************************************************************************/



/***************************************************************************************************
 * UTILS
 */
function executeAsync(method) {
    setTimeout(method, 50);
}

function debug(className, log_txt) {
    if (window.console != undefined) {
        if(log_txt)
            console.log("[JSx11-UI] ["+className+"] " + log_txt);
        else
            console.log("[JSx11-UI] "+ className);
    }
}

function __require(file) {
    document.write("<script type='text/javascript' src='resources/js/"+file+"'><\/script>");
}

function isUndefined(variable) {
    if(window.eval("typeof "+variable) != 'undefined') return false;
    else return true;
}