React = require('react')
Example = React.createFactory(require('./Example.react'))

div = document.createElement('div')
document.body.appendChild(div)

React.render(Example(), div)
