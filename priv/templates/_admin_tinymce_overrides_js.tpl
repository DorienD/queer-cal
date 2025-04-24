tinyInit.style_formats = [
    { title: 'Headers', items: [
      { title: 'h2', block: 'h2' },
      { title: 'h3', block: 'h3' },
      { title: 'h4', block: 'h4' }
    ] },

    { title: 'Styles', items: [
      { title: 'Summary text', block: 'p', classes: 'summary' }
    ] },

    { title: 'Blocks', items: [
      { title: 'p', block: 'p' },
      { title: 'small', block: 'small'}      
    ] },

    { title: 'Containers', items: [
      { title: 'blockquote', block: 'blockquote', wrapper: true }
    ] }
]

tinyInit.link_class_list = [
    {title: 'None', value: ''},
    {title: 'Button', value: 'c-btn c-btn-primary'}
]

tinyInit.menubar = []

tinyInit.toolbar = [
    "styleselect | bold italic | bullist numlist | removeformat | link unlink | zlink zmedia | code"
]