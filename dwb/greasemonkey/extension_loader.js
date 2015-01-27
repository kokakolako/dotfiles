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
//<supergenpass___SCRIPT
extensions.load("supergenpass", {
//<supergenpass___CONFIG
// Compatibility mode, always generate passwords that are
// compatible with the original supergenpass bookmarklet
compat : true,

// Additional salts that are added on a domain basis. 
// domainSalts has to be an object of the form
// { "example.com" : "foo", "example.co.uk" : "bar" }
// In Compatibility mode domain salts are disabled
domainSalts : {},

// The hash-algorithm to use, either ChecksumType.md5,
// ChecksumType.sha1 or ChecksumType.sha256, in
// compatibility mode it is set to ChecksumType.md5
hashMethod : ChecksumType.md5,

// Length of the password, the minimum length is 4, the
// maximum length depends on the hashMethod, for md5 it is
// 24, for sha1 it is 28 and for sha256 it is 44. 
length : 10, 

// Minimum number of rehashes, in compatibility mode it is
// set to 10
rehash : 10, 

// A salt that will additionally be added to the password, 
// in compatibility mode set to ""
salt : "", 

// Whether to save the master password or ask every time
// a password is generated
saveMasterPassword : false, 

// The shortcut to invoke this extension
shortcut : "ep",

// A shortcut that prints the generated password to stdout
// instead of injecting it into the website
shortcutPrint :  "",

// Whether to strip subdomains
stripSubdomains : true
//>supergenpass___CONFIG
});
//>supergenpass___SCRIPT
//<cookies___CONFIG
//>cookies___CONFIG
//<userscripts___SCRIPT
extensions.load("userscripts", {
//<userscripts___CONFIG
  // paths to userscripts, this extension will also load all scripts in 
  // $XDG_CONFIG_HOME/dwb/greasemonkey, it will also load all scripts in
  // $XDG_CONFIG_HOME/dwb/scripts but this is deprecated and will be
  // disabled in future versions.
  scripts : []
//>userscripts___CONFIG
});
//>userscripts___SCRIPT
