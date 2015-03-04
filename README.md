# react-svgicon
React component for rendering inline SVGs via an SVG sprite.

## Installation
```shell
$ npm install react-svgicon --save
```

## Usage
```javascript
var Icon = require('react-svgicon');

var Example = React.createClass({
  render: function() {
    return {
      Icon({
        name: 'icon-clock',   // String | required | xlink-href of your inline SVG without the #
        className: 'myClass', // String | optional
        style: {}             // Object | optional
      })
    }
  }
});
```

_Note: This library assumes you have already loaded your SVG sprite at
the top of your `<body>` element like this:_
```html
<body>
  <svg xmlns="http://www.w3.org/2000/svg" class="is-hidden">
    <symbol viewBox="0 0 36 36" id="icon-clock">
      <!-- SVG path/polygon code here -->
    </symbol>
  </svg>
  <!-- rest of code -->
</body>
```

## Contributing
* Fork it
* Create a feature branch
  ```shell
  $ git checkout -b my-feature-branch
  ```
* Create a pull request

## Development
Building the example code:
```shell
$ npm run build:example
```

Compiling the `src`:
```shell
$ npm run prepublish
```

Run the specs:
```shell
$ npm test
```
