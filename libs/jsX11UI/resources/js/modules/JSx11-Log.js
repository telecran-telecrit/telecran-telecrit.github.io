/**
 * Created by JetBrains PhpStorm.
 * User: Waxayaz
 * Date: 30/03/12
 * Time: 19:07
 * To change this template use File | Settings | File Templates.
 */

var JSx11Log = $.inherit({

   __constructor: function() {
       this.LEVEL_DEBUG = 0;
       this.LEVEL_INFO = 1;
       this.LEVEL_WARN = 2;
       this.LEVEL_ERROR = 3;

       this.log = false;
       this.logLevel = this.LEVEL_WARN;
       if(window.console != undefined) {
           this.log = true;
       }
   },

   __getTime: function() {
       var date = new Date();
       var res = "";
       res += date.getDate()>9?date.getDate():("0"+date.getDate());
       res += "/";
       var month= date.getMonth()+1;
       res += month>9?month:("0" + month);
       res += "/";
       res += date.getFullYear();
       res += " ";
       res += date.getHours()>9?date.getHours():("0" + date.getHours());
       res += ":";
       res += date.getMinutes()>9?date.getMinutes():("0" + date.getMinutes());
       res += ":";
       res += date.getSeconds()>9?date.getSeconds():("0" + date.getSeconds());
       res += ".";
       res += date.getMilliseconds();

       return res;
   },

   debug: function(className, log_txt) {
        if(this.log && this.logLevel == 0) {
            if(log_txt)
                console.log("[" + this.__getTime() + "] [JSx11-UI][debug] ["+className+"] " + log_txt);
            else
                console.log("[" + this.__getTime() + "] [JSx11-UI][debug] "+ className);
        }
   },

   info: function(className, log_txt) {
        if(this.log && this.logLevel <= 1) {
            if(log_txt)
                console.info("[" + this.__getTime() + "] [JSx11-UI][info] ["+className+"] " + log_txt);
            else
                console.info("[" + this.__getTime() + "] [JSx11-UI][info] "+ className);
        }
    },

   warn: function(className, log_txt) {
       if(this.log && this.logLevel <= 2) {
           if(log_txt)
               console.warn("[" + this.__getTime() + "] [JSx11-UI][warn] ["+className+"] " + log_txt);
           else
               console.warn("[" + this.__getTime() + "] [JSx11-UI][warn] "+ className);
       }
   },

   error: function(className, log_txt) {
       if(this.log && this.logLevel <= 3) {
           if(log_txt)
               console.error("[" + this.__getTime() + "] [JSx11-UI][error] ["+className+"] " + log_txt, "");
           else
           console.error("[" + this.__getTime() + "] [JSx11-UI][error] "+ className, "");
       }
   }
});