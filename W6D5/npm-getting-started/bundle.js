/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 178);
/******/ })
/************************************************************************/
/******/ ({

/***/ 178:
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _react = __webpack_require__(52);

var _react2 = _interopRequireDefault(_react);

var _reactDom = __webpack_require__(81);

var _reactDom2 = _interopRequireDefault(_reactDom);

var _calculator = __webpack_require__(80);

var _calculator2 = _interopRequireDefault(_calculator);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

document.addEventListener("DOMContentLoaded", function () {
	var root = document.getElementById("root");
	_reactDom2.default.render(_react2.default.createElement(_calculator2.default, null), root);
});

/***/ }),

/***/ 52:
/***/ (function(module, exports) {

throw new Error("Module build failed: Error: ENOENT: no such file or directory, open '/Users/BAOSS/Dropbox/Programming/AppAcademy/Curriculum/homeworks/W6D5/npm-getting-started/node_modules/react/react.js'\n    at Error (native)");

/***/ }),

/***/ 80:
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _react = __webpack_require__(52);

var _react2 = _interopRequireDefault(_react);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var Calculator = function (_React$Component) {
  _inherits(Calculator, _React$Component);

  function Calculator() {
    _classCallCheck(this, Calculator);

    var _this = _possibleConstructorReturn(this, (Calculator.__proto__ || Object.getPrototypeOf(Calculator)).call(this));

    _this.state = { result: 0, num1: "", num2: "" };

    _this.setnum1 = _this.setnum1.bind(_this);
    _this.setnum2 = _this.setnum2.bind(_this);
    _this.add = _this.add.bind(_this);
    _this.subtract = _this.subtract.bind(_this);
    _this.multiply = _this.multiply.bind(_this);
    _this.divide = _this.divide.bind(_this);
    _this.clear = _this.clear.bind(_this);
    // your code here
    return _this;
  }

  // your code here


  _createClass(Calculator, [{
    key: "setnum1",
    value: function setnum1(e) {
      var num1 = e.target.value ? parseInt(e.target.value) : "";
      this.setState({ num1: num1 });
    }
  }, {
    key: "setnum2",
    value: function setnum2(e) {
      var num2 = e.target.value ? parseInt(e.target.value) : "";
      this.setState({ num2: num2 });
    }
  }, {
    key: "add",
    value: function add(e) {
      e.preventDefault();
      var result = this.state.num1 + this.state.num2;
      this.setState({ result: result });
    }
  }, {
    key: "subtract",
    value: function subtract(e) {
      e.preventDefault();
      var result = this.state.num1 - this.state.num2;
      this.setState({ result: result });
    }
  }, {
    key: "multiply",
    value: function multiply(e) {
      e.preventDefault();
      var result = this.state.num1 * this.state.num2;
      this.setState({ result: result });
    }
  }, {
    key: "divide",
    value: function divide(e) {
      e.preventDefault();
      var result = this.state.num1 / this.state.num2;
      this.setState({ result: result });
    }
  }, {
    key: "clear",
    value: function clear(e) {
      e.preventDefault();
      this.setState({ result: 0, num1: "", num2: "" });
    }
  }, {
    key: "render",
    value: function render() {
      var _state = this.state,
          num1 = _state.num1,
          num2 = _state.num2,
          result = _state.result;

      return _react2.default.createElement(
        "div",
        null,
        _react2.default.createElement(
          "h1",
          null,
          result
        ),
        _react2.default.createElement("input", { onChange: this.setnum1, type: "text", value: num1 }),
        _react2.default.createElement("input", { onChange: this.setnum2, type: "text", value: num2 }),
        _react2.default.createElement(
          "button",
          { onClick: this.clear },
          "Clear"
        ),
        _react2.default.createElement("br", null),
        _react2.default.createElement(
          "button",
          { onClick: this.add },
          "+"
        ),
        _react2.default.createElement(
          "button",
          { onClick: this.subtract },
          "-"
        ),
        _react2.default.createElement(
          "button",
          { onClick: this.multiply },
          "*"
        ),
        _react2.default.createElement(
          "button",
          { onClick: this.divide },
          "/"
        )
      );
    }
  }]);

  return Calculator;
}(_react2.default.Component);

exports.default = Calculator;

/***/ }),

/***/ 81:
/***/ (function(module, exports) {

throw new Error("Module build failed: Error: ENOENT: no such file or directory, open '/Users/BAOSS/Dropbox/Programming/AppAcademy/Curriculum/homeworks/W6D5/npm-getting-started/node_modules/react-dom/index.js'\n    at Error (native)");

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map