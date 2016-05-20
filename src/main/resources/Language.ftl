{
  "displayName":    "java",
  "name":           "java",
  "mimeTypes":      ["text/x-java"],
  "fileExtensions": [".java"],

  "lineComments":      "//",
  "blockCommentStart": "/*",
  "blockCommentEnd":   "*/",

  "keywords": ["public", "class", "static", "int", "void"],

  "operators": ["~", "+", "-"],


  "tokenizer": {
    "root": [

      ["[a-z_$][\\w$]*", { "cases": { "@keywords": "keyword",
                                   "@default": "identifier" } }],


      { "include": "@whitespace" },


      ["[{}()\\[\\]]", "@brackets"],
   ],

    "whitespace": [
      ["[ \\t\\r\\n]+", "white"],
      ["\\/\\*",       "comment", "@comment" ],
      ["\\/\\/.*$",    "comment"],
    ],

    "comment": [
      ["[^\\/*]+", "comment" ],
      ["\\/\\*",    "comment.invalid" ],
      ["\\*/",    "comment", "@pop"  ],
      ["[\\/*]",   "comment" ]
    ],
  },
}
