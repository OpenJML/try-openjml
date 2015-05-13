{
  displayName:    'echo',
  name:           'echo',
  mimeTypes:      ['text/x-echo'],
  fileExtensions: ['.echo'],

  lineComments:      '//',
  blockCommentStart: '/*',
  blockCommentEnd:   '*/',

  keywords: ['hello', 'you'],

  operators: ['~'],


  tokenizer: {
    root: [

      ['[a-z_$][\\w$]*', { cases: { '@keywords': 'keyword',
                                   '@default': 'identifier' } }],


      { include: '@whitespace' },


      ['[{}()\\[\\]]', '@brackets'],
   ],

    whitespace: [
      ['[ \\t\\r\\n]+', 'white'],
      ['\\/\\*',       'comment', '@comment' ],
      ['\\/\\/.*$',    'comment'],
    ],

    comment: [
      ['[^\\/*]+', 'comment' ],
      ['\\/\\*',    'comment.invalid' ],
      ["\\*/",    'comment', '@pop'  ],
      ['[\\/*]',   'comment' ]
    ],
  },
}