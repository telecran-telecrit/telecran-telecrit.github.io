/**
 * Created by JetBrains PhpStorm.
 * User: Waxayaz
 * Date: 28/03/12
 * Time: 19:30
 * To change this template use File | Settings | File Templates.
 */

/**
 *
 */
var JSx11Desktop = $.inherit({
    __constructor: function() {
        this.backgroundImage = null;
    },

    initialise: function() {
        jsx11.core.renderTemplate("#desktop", "desktop/Desktop.html"); // Render Desktop Template
    }

});