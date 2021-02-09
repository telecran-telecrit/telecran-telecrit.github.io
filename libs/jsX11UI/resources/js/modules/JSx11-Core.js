/**
 * Created by JetBrains PhpStorm.
 * User: Waxayaz
 * Date: 28/03/12
 * Time: 19:32
 * To change this template use File | Settings | File Templates.
 */

var JSx11Core = $.inherit({

    __constructor: function() {
        // Vars used for loading modules
        this.loadingQueue = new Array();
        this.isLoading = false;

        // Call initialise method
        log.debug("JSx11Core","JSx11Core is instantiated !");
        this.initialise();
    },


    initialise: function() {
        log.debug("JSx11Core","JSx11Core is initialised !");
    },


    renderTemplate: function(target, template, callback) {
        $.get(JSx11_BASE_URL + "resources/templates/" + template)
        .success( function(data) {
            $(target).html(data);
                if(callback) callback();
        })
        .error(function() {
           $(target).html("Unable to load template !");
        });
    },


    /**
     * This method is loading a Module into application. The module will be queued and
     * loaded after loading of previously queued modules. The callback method is triggered
     * when module is loaded.
     *
     * How it works:
     *    1. The specified module name is pushed in loadingQueue with his
     *    callback method if she's specified. The callback method is triggered
     *
     *    2. If modules loader process is stopped, launch it.
     *
     * @param moduleName Name of module to load
     * @param loadingCallback Callback method
     */
    loadModule: function(moduleName, loadingCallback) {
        // Queue module
        if(loadingCallback) {
            this.loadingQueue.push({moduleName: moduleName, callback: loadingCallback});
        }
        else {
            this.loadingQueue.push({moduleName: moduleName});
        }

        // If loading process is stopped, start it
        if(!this.isLoading) {
           this.__loadQueuedModules();
        }
    },


    /**
     * This method is used to load queued modules.
     *
     * How it works:
     *   1. Get the next module's name to load, the first element in loadingQueue.
     *   2. Build module's script tag.
     *   3. Add a callback method which is triggered when script is loaded.
     *          - scriptTag.onload() is called under Firefox or Chrome
     *          - scriptTag.onreadystatechange() is called under old navigators like IE :)
     *      This callback method checks if modules are waiting to be loaded :
     *          - If yes, this method is called recursively while all waiting modules aren't loaded.
     *          - If no, call last loaded module callback method.
     *   4. Add tag to html page's head tag
     */
    __loadQueuedModules: function() {
        // Retrieve next module to load
        var module = this.loadingQueue.shift();
        log.debug("JSx11-Core", "Loading module "+module.moduleName+"...");

        // Load module
        this.isLoading = true;
        var scriptTag = document.createElement('script');
        scriptTag.type = 'text/javascript';
        scriptTag.async = true;
        scriptTag.src = 'resources/js/'+module.moduleName+".js";

        // Buils loading module callback
        var callback = function() {
            log.info("JSx11-Core", "Module "+module.moduleName+" is loaded !");
            if(jsx11.core.loadingQueue.length == 0) {
                jsx11.core.isLoading = false;
                log.debug("JSx11-Core", "All queued modules are loaded !");
                if(!isUndefined(module.callback)) {
                    module.callback();
                }
            } else {
                if(!isUndefined(module.callback)) {
                    module.callback();
                }
                jsx11.core.__loadQueuedModules();
            }
        }

        // Add callback which is triggered when module is loaded
        scriptTag.onload = callback;
        scriptTag.onreadystatechange = function() {
            if (this.readyState == 'complete') {
                callback();
            }
            if (this.readyState == 'loaded') {
                callback();
            }
        }

        // Add module to document -> Launch loading
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(scriptTag, x);
    },




    /**
     * This method is used to execute a callback method when
     * all waiting modules are loaded. Callbacks are concatenated
     * and executed in their add order when all waiting modules
     * are loaded.
     *
     * @param waitCallback Callback te execute when waiting modules are loaded
     */
    waitForModulesLoaded: function(waitCallback) {
        // If Modules are waiting to be loaded, add callback to last module
        if(jsx11.core.isLoading == true && jsx11.core.loadingQueue.length > 0) {
            var index = jsx11.core.loadingQueue.length-1;
            // If last module already has a callback, concatenate callbacks
            if(jsx11.core.loadingQueue[index].callback) {
                var oldCallback = jsx11.core.loadingQueue[index].callback;
                jsx11.core.loadingQueue[index].callback = function() {
                    oldCallback();
                    waitCallback();
                }
            }
            // Else set callback
            else {
                jsx11.core.loadingQueue[index].callback = waitCallback
            }
        }
        // If no modules are waiting to be loaded, and no module is loading, execute callback
        else if(jsx11.core.loadingQueue.length == 0 && jsx11.core.isLoading == false) {
            waitCallback();
        }
    }
});