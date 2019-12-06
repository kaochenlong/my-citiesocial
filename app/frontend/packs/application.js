require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

import "controllers";

import "scripts/shared";
import "scripts/frontend";

import "styles/shared";
import "styles/frontend";
