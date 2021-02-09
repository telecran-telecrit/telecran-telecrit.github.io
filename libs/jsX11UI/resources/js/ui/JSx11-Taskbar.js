/**
 * Created by JetBrains PhpStorm.
 * User: Waxayaz
 * Date: 28/03/12
 * Time: 19:31
 * To change this template use File | Settings | File Templates.
 */

var JSx11Taskbar = $.inherit({
    __constructor: function() {
        this.height = 40;
        this.startMenu = new StartMenu();
    },

    initialise: function() {
        // Render Taskbar Template
        jsx11.core.renderTemplate("#taskbar", "desktop/Taskbar.html", function(){
            $("#taskbar").css("height", jsx11.taskbar.height+"px");
            $("#taskbarContent").css("height", jsx11.taskbar.height+"px")

            // Initialise Start Menu
            jsx11.taskbar.startMenu.initialise();
        });
    }
});


var StartMenu = $.inherit({
    __constructor: function() {

    },

    initialise: function() {
        $("#startMenuIcon").click(function(){
            $("#startMenu").toggle();
        });
        $("#desktop").click(function(){
           if( $("#startMenu").css("display") != "none" ) $("#startMenu").toggle();
        });
        $("#startMenu .items .item").click(function() {
            $("#startMenu").toggle();
            alert("T'as click sur : " + $(this).html());
        });

        var date = new Date();
        $("#systemTime .time").html((date.getHours()>9?date.getHours():"0"+date.getHours()) + ":" + (date.getMinutes()>9?date.getMinutes():"0"+date.getMinutes()));
        $("#systemTime .date").html((date.getDate()>9?date.getDate():"0"+date.getDate())+ "/" + (date.getMonth()>8?date.getMonth()+1:"0"+(date.getMonth()+1)) + "/" + date.getFullYear());
    }
});