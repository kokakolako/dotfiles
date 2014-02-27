//!javascript
//<adblock_subscriptions___SCRIPT
extensions.load("adblock_subscriptions", {
//<adblock_subscriptions___CONFIG

// Shortcut to subscribe to a filterlist
scSubscribe : null,
// Command to subscribe to a filterlist
cmdSubscribe : "adblock_subscribe",

// Shortcut to unsubscribe from a filterlist
scUnsubscribe : null,

// Command to unsubscribe from a filterlist
cmdUnsubscribe : "adblock_unsubscribe",

// Shortcut to update subscriptions and reload filter rules
// Note that dwb will also update all subscriptions on startup
scUpdate : null,

// Command to update subscriptions and reload filter rules
// Note that dwb will also update all subscriptions on startup
cmdUpdate : "adblock_update",

// Path to the filterlist directory, will be created if it doesn't exist.
filterListDir : data.configDir + "/adblock_lists"
//>adblock_subscriptions___CONFIG
});
//>adblock_subscriptions___SCRIPT
//<speeddial___SCRIPT
extensions.load("speeddial", {
//<speeddial___CONFIG
    // Shortcut for adding a site
    add : "sda",
    // Shortcut for showing the speedial site
    show : "sds",
    // Command for adding a site
    cmdAdd : null,
    // Shortcut for showing the speedial site
    cmdShow : null,
    // Number of vertical items, if set to null there will be no limit for
    // number of items
    nVert : 3,
    // Number of horizontal items
    nHorz : 3,
    // Limit of number of items, <= 0 means no limit
    limit : 0,
    // Whether to update snapshot images every time a bookmarked site is visited
    autoUpdate : false,
    // Cachedir where the template file and snapshots are saved
    cachedir : system.getEnv("HOME") + "/.local/share/dwb/speeddial",
    // Width of a snapshot image
    snapshotWidth : 640,
    // Height of a snapshot image
    snapshotHeight : 480
//>speeddial___CONFIG
});
//>speeddial___SCRIPT
//<downloadhandler___SCRIPT
extensions.load("downloadhandler", {
//<downloadhandler___CONFIG
   handler : [
     // Each handler must have 2 or 3 properties:
     //
     // command : command to execute, must contain %f which will be replaced with
     //           the filepath, this property is mandatory
     //
     // extension : a filename extension, optional
     //
     // mimeType  : a mimetype, optional
     //

     // { command : "xpdf %f", mimeType : "application/pdf" }
     // { command : "xdvi %f", extension : "dvi" }

   ]
//>downloadhandler___CONFIG
});
//>downloadhandler___SCRIPT
//<cookies___SCRIPT
extensions.load("cookies");
//>cookies___SCRIPT
//<formfiller___SCRIPT
extensions.load("formfiller", {
//<formfiller___CONFIG
// shortcut that gets and saves formdata
scGetForm : "efg",

// shortcut that fills a form
scFillForm : "eff",

// path to the formdata file
formData : data.configDir + "/forms",

// whether to use a gpg-encrypted file
useGPG : false,

// your GPG key ID (leave empty to use a symmetric cipher)
GPGKeyID : "",

// whether to use a GPG agent (requires non-empty GPGKeyID to work)
GPGAgent : false,

// additional arguments passed to gpg2 when encrypting the formdata
GPGOptEncrypt : "",

// additional arguments passed to gpg2 when decrypting the formdata
GPGOptDecrypt : "",

// whether to save the password in memory when gpg is used
keepPassword : true,

// whether to save the whole formdata in memory when gpg is used
keepFormdata : false

//>formfiller___CONFIG
});
//>formfiller___SCRIPT
//<autoquvi___SCRIPT
extensions.load("autoquvi", {
//<autoquvi___CONFIG
// The quvi command
quvi      : "quvi",

// External player command
player    : "mplayer %u",

// Whether to automatically play videos if quvi finds a playable
// video
autoPlay  : true,

// Whether to choose the quality before quvi starts
chooseQuality : true,

// A shortcut that spawns quvi for the current website
shortcut  : "",

// A command that spawns quvi for the current website
command  : "autoquvi",

//
// Whether to autospawn quvi only in the active tab
activeOnly : true

//>autoquvi___CONFIG
});
//>autoquvi___SCRIPT
