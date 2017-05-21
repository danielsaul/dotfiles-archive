module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: '"Inconsolata-dz for Powerline", "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,240,229,0.6)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#f8f8f2',

    // terminal background color
    backgroundColor: '#151718',

    // border color (window, tabs)
    borderColor: '#151718',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: 'x-row > span { line-height: 1.2em;}',

    // set to `true` if you're using a Linux set up
    // that doesn't shows native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '15px 20px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#151718',
      red: '#f92672',
      green: '#a6e22e',
      yellow: '#ffd569',
      blue: '#42a6eb',
      magenta: '#ae81ff',
      cyan: '#66d9ef',
      white: '#f8f8f2',
      lightBlack: '#75715e',
      lightRed: '#ff2038',
      lightGreen: '#b0ff5e',
      lightYellow: '#ffe600',
      lightBlue: '#39aeff',
      lightMagenta: '#dc95f1',
      lightCyan: '#26d3f4',
      lightWhite: '#ffffff'
    },
    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: 'zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: ["hyperterm-clicky", "hyperterm-cursor"], //"nord-hyper"],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
