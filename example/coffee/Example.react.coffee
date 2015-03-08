React = require('react')
Icon = React.createFactory(require('../../index'))
{div, h2} = React.DOM

Example = React.createClass
  displayName: 'Example'

  render: ->
    div null,
      div className: 'example',
        h2 null, 'No styles'
        Icon(name: 'icon-clock')

      div className: 'example',
        h2 null, 'With className'
        Icon(name: 'icon-clock', className: 'icon--colored')

      div className: 'example',
        h2 null, 'With inline styles'
        Icon(name: 'icon-clock', style: { fill: '#CCC' })

module.exports = Example
