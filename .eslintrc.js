module.exports = {
  "env": {
    "browser": true,
    "es6": true
  },
  "extends": [
    "eslint:recommended",
    'plugin:vue/essential'
  ],
  "parser": "vue-eslint-parser",
  "parserOptions": {
    "sourceType": "module",
    "parser": "typescript-eslint-parser"
  },
  "rules": {
    "indent": [
      "error",
      2
    ],
    "linebreak-style": [
      "error",
      "unix"
    ],
    "quotes": [
      "error",
      "single"
    ],
    "semi": [
      "error",
      "always"
    ],
    "plugins": [
      "vue",
      "html"
    ]
  }
};
