React = require 'react'

Icon = React.createClass
  displayName: 'Icon'

  propTypes:
    className: React.PropTypes.string
    name: React.PropTypes.string.isRequired
    style: React.PropTypes.object

  getDefaultProps: ->
    className: null
    style: {}

  render: ->
    React.DOM.svg(
      className: @props.className
      style: @props.style
      dangerouslySetInnerHTML: { __html: @_buildUseTag() }
    )

  _buildUseTag: ->
    "<use xlink:href='##{@props.name}' />" # because React doesn't support this element yet

module.exports = Icon
