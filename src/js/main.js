import 'scss/main.scss';

// Both jquery and what-input are required by foundation-sites
import $ from 'jquery';
import whatInput from 'what-input';

// autocomplete is used by venue selection and datapicker is used to select
// event dates. These are used in the public "Notify us of Events" page as well
// as in the admin interface.
import 'jquery-ui/ui/widgets/autocomplete';
import 'jquery-ui/ui/widgets/datepicker';

// Used for the cookie alert in the public area.
import cookie from 'jquery.cookie';

// Expose jQuery to the global object
window.$ = $;

// TODO: Look at using "Tree Shaking" to only import the plugins we use
// See - https://get.foundation/sites/docs/javascript.html
import Foundation from 'foundation-sites';

// Add a new Abide custom pattern, see:
// https://get.foundation/sites/docs/abide.html#adding-custom-pattern-and-validator
Foundation.Abide.defaults.patterns['userid'] = /^[a-zA-Z0-9]{8,}$/;

// Initialise foundation, see:
// https://get.foundation/sites/docs/javascript.html#initializing
$(document).foundation();
