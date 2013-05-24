var wisp_c = require('compiler'),
    wisp_r = (require('reader')).read_;

function compile(str) {
  return wisp_c.compile_(wisp_r(str));
}
