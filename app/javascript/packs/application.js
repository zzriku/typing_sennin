import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import 'images/typing.jpg';
import "favorite.js"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

