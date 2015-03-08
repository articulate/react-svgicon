React = require('react')
ReactAddons = require('react/addons')
ReactTestUtils = React.addons.TestUtils
chai = require('chai')
sinon = require('sinon')
sinonChai = require('sinon-chai')
chai.use(sinonChai)
expect = chai.expect
jsdom = require('mocha-jsdom')

Icon = React.createFactory(require('../index'))

NAME_REQUIRED = 'Warning: Required prop `name` was not specified in `Icon`.'
NAME_INVALID = 'Warning: Invalid prop `name` of type `object` supplied to `Icon`, expected `string`.'
CLASSNAME_INVALID = 'Warning: Invalid prop `className` of type `object` supplied to `Icon`, expected `string`.'
STYLE_INVALID = 'Invariant Violation: The `style` prop expects a mapping from style properties to values, not a string.'

describe 'Icon', ->
  jsdom()

  beforeEach ->
    @div = document.createElement('div')
    document.body.appendChild(@div)

  afterEach ->
    React.unmountComponentAtNode(@div)
    document.body.removeChild(@div)

  describe 'Props', ->
    beforeEach ->
      @warnSpy = sinon.spy(console, 'warn')

    afterEach ->
      @warnSpy.restore()

    describe '`name`', ->
      describe 'when `name` is NOT passed', ->
        it 'warns `name` is required', ->
          React.render(Icon(), @div)
          expect(@warnSpy).to.have.been.calledWith(NAME_REQUIRED)

      describe 'when `name` is passed', ->
        it 'does NOT warn `name` prop is required', ->
          React.render(Icon(name: {}), @div)
          expect(@warnSpy).to.not.have.been.calledWith(NAME_REQUIRED)

      describe 'when `name` is NOT a string', ->
        it 'warns `name` prop is invalid', ->
          React.render(Icon(name: {}), @div)
          expect(@warnSpy).to.have.been.calledWith(NAME_INVALID)

      describe 'when `name` is a string', ->
        it 'does NOT warn `name` prop is invalid', ->
          React.render(Icon(name: 'icon-test'), @div)
          expect(@warnSpy).to.not.have.been.calledWith(NAME_INVALID)

    describe '`className`', ->
      describe 'when `className` is NOT a string', ->
        it 'warns `className` prop is invalid', ->
          React.render(Icon(name: 'icon-test', className: {}), @div)
          expect(@warnSpy).to.have.been.calledWith(CLASSNAME_INVALID)

      describe 'when `className` is a string', ->
        it 'does NOT warn `className` prop is invalid', ->
          React.render(Icon(name: 'icon-test', className: 'test'), @div)
          expect(@warnSpy).to.not.have.been.calledWith(CLASSNAME_INVALID)

    describe '`style`', ->
      describe 'when `style` is NOT an object', ->
        it 'throws a `style` is invalid error', ->
          expect(=>
            React.render(Icon(name: 'icon-test', style: ''), @div)
          ).to.throw(STYLE_INVALID)

      describe 'when `style` is an object', ->
        it 'does NOT throw a `style` is invalid error', ->
          expect(=>
            React.render(Icon(name: 'icon-test', style: {}), @div)
          ).to.not.throw(STYLE_INVALID)

  it 'renders the <svg> and <use> elements', ->
    React.render(Icon(name: 'icon-test'), @div)
    svgNode = @div.querySelector('svg')
    useNode = svgNode.querySelector('use')
    expect(svgNode).to.not.equal(null)
    expect(useNode).to.not.equal(null)

  it 'renders the className when provided', ->
    className = 'foo bar'
    React.render(Icon(name: 'icon-test', className: className), @div)
    svgNode = @div.querySelector('svg')
    expect(svgNode.className).to.equal(className)

  it 'renders the styles when provided', ->
    backgroundColor = 'rgb(0, 153, 255)'
    React.render(Icon(name: 'icon-test', style: { backgroundColor: backgroundColor }), @div)
    svgNode = @div.querySelector('svg')
    expect(svgNode.style.backgroundColor).to.equal(backgroundColor)

  it 'renders the className AND styles when provided', ->
    className = 'foo bar'
    backgroundColor = 'rgb(0, 153, 255)'
    React.render(Icon(name: 'icon-test', className: className, style: { backgroundColor: backgroundColor }), @div)
    svgNode = @div.querySelector('svg')
    expect(svgNode.className).to.equal(className)
    expect(svgNode.style.backgroundColor).to.equal(backgroundColor)
