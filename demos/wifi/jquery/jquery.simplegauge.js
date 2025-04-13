/**
 * Simple analog and digital gauge plugin for jQuery to build dashboards
 * @version    1.1.0
 * @release    2021-09-05
 * @repository https://github.com/peterthoeny/jquery.simplegauge
 * @author     Peter Thoeny, https://twiki.org/ & https://github.com/peterthoeny
 * @copyright  2021 Peter Thoeny, https://github.com/peterthoeny
 * @license    MIT, https://opensource.org/licenses/mit-license
 */
(function($) {

    'use strict';

    let debug = false;

    function debugLog(msg) {
        if(debug) {
           console.log('- simpleGauge: ' + msg);
        }
    }

    /**
     *  SimpleGauge class definition
     */
    let SimpleGauge = function (element, options) {
        if (element && element instanceof jQuery) {
            this.init(element, options);
        }
    };

    SimpleGauge.prototype = {
        constructor: SimpleGauge,

        init: function (element, options) {
            let self = this;
            this.options = this._mergeDeep($.fn.simpleGauge.defaults, options);
            this.$element = $(element);
            this.draw();
            $(window).on('resize', function () {
                self.draw();
            });
        },

        draw: function () {
            this.$element.html(this.options.template);
            this.$container = this.$element.find('.simpleGauge_container');
            this.$gauge     = this.$element.find('.simpleGauge');
            this.$bars      = this.$element.find('.simpleGauge_bars');
            this.$labels    = this.$element.find('.simpleGauge_labels');
            this.$ticks     = this.$element.find('.simpleGauge_ticks');
            this.$pointers  = this.$element.find('.simpleGauge_pointers');
            this.$digital   = this.$element.find('.simpleGauge_digital');
            this.$title     = this.$element.find('.simpleGauge_title');
            this.setContainer();
            this.setTitle();
            if(this.options.type.match(/\banalog\b/)) {
                this.createAnalogBars();
                this.createAnalogLabels();
                this.createAnalogTicks();
                this.createAnalogPointer();
            }
            this.setValue(this.options.value); // set digital and/or analog value
        },

        setContainer: function () {
            let eWidth = this.$element.width();
            let eHeight = this.$element.height();
            let cWidth = this.options.width;
            let cHeight = this.options.height;
            if(typeof cWidth === 'string') {
                let m = cWidth.match(/([+\-0-9\.]+)(%?)/) || [ eWidth ];
                cWidth = m[2] ? eWidth * Number(m[1]) / 100 : Number(m[1]);
            }
            if(typeof cHeight === 'string') {
                let m = cHeight.match(/([+\-0-9\.]+)(%?)/) || [ eHeight ]
                cHeight = m[2] ? eHeight * Number(m[1]) / 100 : Number(m[1]);
            }
            if(!cWidth && !cHeight) {
                cWidth = Math.min(eWidth, eHeight);
                cHeight = cWidth;
            } else if(!cWidth) {
                cWidth = eWidth;
            } else if(!cHeight) {
                cHeight = eHeight;
            }
            this.$container.css({
                marginLeft: (eWidth - cWidth) / 2,
                marginTop:  (eHeight - cHeight) / 2,
                width:      cWidth,
                height:     cHeight,
                overflow:   'hidden'
            });
            if(this.options.container) {
                if(this.options.container.style) {
                    let style = this.options.container.style;
                    let css = this._styleToCss(style, $.fn.simpleGauge.defaults.container.style);
                    this.$gauge.css(css);
                }
                let scale = this.options.container.scale;
                if(scale) {
                    let css = {
                        width: scale + '%',
                        height: scale + '%'
                    };
                    this.$gauge.css(css);
                }
            }
            this.options.gaugeWidth = this.$gauge.innerWidth();
            this.options.gaugeHeight = this.$gauge.innerHeight();
        },

        setTitle: function () {
            if(this.options.title && this.options.title.text) {
                this.$title.html('<span>' + this.options.title.text + '</span>');
                let style = this.options.title.style;
                let css = this._styleToCss(style, $.fn.simpleGauge.defaults.title.style);
                if(css.top) {
                    this.$title.css({ top: css.top });
                    delete css.top;
                }
                this.$title.find('> span').css(css);
            }
        },

        getAngleFromValue: function (value) {
            return (((value - this.options.min) / (this.options.max - this.options.min) * (this.options.analog.maxAngle - this.options.analog.minAngle)) + this.options.analog.minAngle);
        },

        getPointFromAngle: function (w, h, angle) {
            angle = (angle - 90) * Math.PI / 180;
            return [
                (Math.cos(angle) * w / 2),
                (Math.sin(angle) * h / 2)
            ];
        },
/*
        getPointFromAngleUNUSED: function (w, h, angle) {
            w = w / 2;
            h = h / 2;
            angle = (angle + 0.01 + 360 * 2 - 90) % 360;
            let a = angle * Math.PI / 180;
            let tan = Math.tan(a);
            let div = Math.pow(h * h + w * w * tan * tan, 0.5); // √h2+w2(tan𝜃)2
            let x = w * h / div;
            let y = w * h * tan / div;
            if(angle > 90 && angle < 270) {
                return [ -x, -y ];
            } else {
                return [ x, y ];
            }
        },
*/
        getBarColor: function (value) {
            let color = '#666';
            this.options.bars.colors.forEach(function(set) {
                if(Number(set[0]) <= value) {
                   color = set[1];
                }
            });
            return color;
        },

        createAnalogBars: function () {
            let self = this;
            this.$bars.html('');
            this.$bars.css({
                marginLeft: this.options.gaugeWidth / 2,
                marginTop: this.options.gaugeHeight / 2
            });
            let maxIdx = this.options.bars.colors.length - 1;
            this.options.bars.colors.forEach((colorArr, idx) => {
                let value = Number(colorArr[0]);
                let color  = colorArr[1];
                let scale1 = Number(colorArr[2] || this.options.bars.scale1);
                let scale2 = Number(colorArr[3] || this.options.bars.scale2);
                let startAngle = self.getAngleFromValue(value);
                let endVal = idx + 1 > maxIdx ? this.options.max : this.options.bars.colors[idx + 1][0];
                let endAngle = self.getAngleFromValue(endVal);
                let width1  = this.options.gaugeWidth * scale1 / 100;
                let width2 = this.options.gaugeWidth * scale2 / 100;
                let width = (width2 + width1) / 2;
                let height1 = this.options.gaugeHeight * scale1 / 100;
                let height2 = this.options.gaugeHeight * scale2 / 100;
                let height = (height2 + height1) / 2;
                let strokeWidth = Math.abs(height2 - height1);
                let radius = (width + height) / 2;
                let startCoord = this.getPointFromAngle(width, height, startAngle);
                let endCoord   = this.getPointFromAngle(width, height, endAngle);
                let d = 'M ' + startCoord
                      + ' A ' + width / 2 + ' ' + height / 2
                      + ' 0 ' + (Math.abs(endAngle - startAngle) > 180 ? 1 : 0) + ' 1 ' + endCoord;
                this.appendSVG(this.$bars, 'path', {
                    class:  'simpleGauge_bar',
                    style:  this.options.bars.style,
                    d:      d,
                    stroke: color,
                    'stroke-width': strokeWidth,
                    fill:   'none'
                });
            });
        },

        createAnalogLabels: function () {
            this.$labels.css({
                marginLeft: this.options.gaugeWidth / 2,
                marginTop: this.options.gaugeHeight / 2
            });
            let step = (this.options.max - this.options.min) / this.options.labels.count;
            let width = this.options.gaugeWidth * this.options.labels.scale / 100;
            let height = this.options.gaugeHeight * this.options.labels.scale / 100;
            let labelTemplate = this.options.labels.text;
            if(typeof labelTemplate != 'string') {
                labelTemplate = $.fn.simpleGauge.defaults.labels.text;
            }
            for(let val = this.options.min; val <= this.options.max; val += step) {
                let angle = this.getAngleFromValue(val);
                let coord = this.getPointFromAngle(width, height, angle);
                let labelVal = val;
                let html = labelTemplate.replace(/\{value(?:\.(\d+))?\}/g, function(m, c1) {
                    if(c1) {
                        let factor = 10 ** parseInt(c1);
                        labelVal = Math.round(labelVal * factor) / factor;
                    }
                    return labelVal.toString();
                });
                let $label = $('<div>').addClass('simpleGauge_label').html(html);
                this.$labels.append($label);
                let css = this._styleToCss(this.options.labels.style, {
                    left: coord[0] - $label.width() / 2,
                    top: coord[1] - $label.height() / 2
                });
                $label.css(css);
            }
        },

        createAnalogTicks: function () {
            this.$ticks.css({
                marginLeft: this.options.gaugeWidth / 2,
                marginTop: this.options.gaugeHeight / 2
            });
            if(this.options.ticks.count) {
                let step = (this.options.max - this.options.min) / this.options.ticks.count;
                let width1 = this.options.gaugeWidth * this.options.ticks.scale1 / 100;
                let width2 = this.options.gaugeWidth * this.options.ticks.scale2 / 100;
                let width = (width2 + width1) / 2;
                let height1 = this.options.gaugeHeight * this.options.ticks.scale1 / 100;
                let height2 = this.options.gaugeHeight * this.options.ticks.scale2 / 100;
                let height = (height2 + height1) / 2;
                let tickHeight = Math.abs(height2 - height1);
                for(let val = this.options.min; val <= this.options.max; val += step) {
                    let angle = this.getAngleFromValue(val);
                    let coord = this.getPointFromAngle(width, height, angle);
                    let $tick = $('<div>').addClass('simpleGauge_tick');
                    this.$ticks.append($tick);
                    let css = this._styleToCss(this.options.ticks.style, {
                        transform: 'rotate(' + angle + 'deg)',
                        height: tickHeight,
                        left: coord[0] - $tick.width() / 2,
                        top: coord[1] - tickHeight / 2
                    });
                    if(css.color) {
                       css.backgroundColor = css.color;
                    }
                    $tick.css(css);
                }
            }
            if(this.options.ticks.count && this.options.subTicks.count) {
                let step = (this.options.max - this.options.min)
                         / (this.options.ticks.count * this.options.subTicks.count);
                let width1 = this.options.gaugeWidth * this.options.subTicks.scale1 / 100;
                let width2 = this.options.gaugeWidth * this.options.subTicks.scale2 / 100;
                let width = (width2 + width1) / 2;
                let height1 = this.options.gaugeHeight * this.options.subTicks.scale1 / 100;
                let height2 = this.options.gaugeHeight * this.options.subTicks.scale2 / 100;
                let height = (height2 + height1) / 2;
                let tickHeight = Math.abs(height2 - height1);
                for(let val = this.options.min; val <= this.options.max; val += step) {
                    let angle = this.getAngleFromValue(val);
                    let coord = this.getPointFromAngle(width, height, angle);
                    let $tick = $('<div>').addClass('simpleGauge_tick');
                    this.$ticks.append($tick);
                    let css = this._styleToCss(this.options.subTicks.style, {
                        transform: 'rotate(' + angle + 'deg)',
                        height: tickHeight,
                        left: coord[0] - $tick.width() / 2,
                        top: coord[1] - tickHeight / 2
                    });
                    if(css.color) {
                       css.backgroundColor = css.color;
                    }
                    $tick.css(css);
                }
            }
        },

        createAnalogPointer: function () {
            let css = this._styleToCss(this.options.pointer.style, $.fn.simpleGauge.defaults.pointer.style);
            this.$pointers.css({
                marginLeft: this.options.gaugeWidth / 2,
                marginTop: this.options.gaugeHeight / 2
            });
            this.appendSVG(this.$pointers, 'polyline', {
                class:          'simpleGauge_pointer',
                points:         this.options.pointer.shape,
                fill:           css.color,
                stroke:         css['border-color'] || css.borderColor || css.color,
                'stroke-width': css['border-width'] || css.borderWidth || 0
            });
            this.$pointers.find('.simpleGauge_pointer').css(css);
        },

        appendSVG: function ($elem, type, attributes) {
            let path = document.createElementNS('http://www.w3.org/2000/svg', type);
            $.each(attributes, function (name, value) {
                path.setAttribute(name, value);
            });
            $elem.append(path);
        },

        getValue: function () {
            let value = this.options.value;
            debugLog('getValue(): ' + value);
            return value;
        },

        setValue: function (value) {
            debugLog('setValue(' + value + ')');
            this.options.value = Number(value);
            if(this.options.type.match(/\bdigital\b/)) {
                this.setDigital();
            }
            if(this.options.type.match(/\banalog\b/)) {
                this.setAnalog();
            }
            return null;
        },

        setDigital: function () {
            if(this.options.digital && this.options.digital.text) {
                let html = this.options.digital.text;
                if(typeof html != 'string') {
                    html = $.fn.simpleGauge.defaults.digital.text;
                }
                let value = this.options.value;
                html = html.replace(/\{value(?:\.(\d+))?\}/g, function(m, c1) {
                    if(c1) {
                        let factor = 10 ** parseInt(c1);
                        value = Math.round(value * factor) / factor;
                    }
                    return value.toString();
                });
                this.$digital.html('<span>' + html + '</span>');
                let style = this.options.digital.style;
                let css = this._styleToCss(style, $.fn.simpleGauge.defaults.digital.style);
                if(css.top) {
                    this.$digital.css({ top: css.top });
                    delete css.top;
                }
                if(css.color && css.color === 'auto') {
                    css.color = this.getBarColor(value);
                }
                this.$digital.find('> span').css(css);
            }
        },

        setAnalog: function () {
            let angle = this.getAngleFromValue(this.options.value);
            let size = Math.min(this.options.gaugeWidth, this.options.gaugeHeight);
            let scale = size / 100 * this.options.pointer.scale / 100 / 2;
            let css = {
                transform: 'scale(' + scale + ') rotate(' + (angle + 180) + 'deg)',
            };
            this.$pointers.find('.simpleGauge_pointer').css(css);
        },

        _mergeDeep: function(target, source) {
            function _isObject(item) {
                return (item && typeof item === 'object' && !Array.isArray(item));
            }
            let output = Object.assign({}, target);
            if (_isObject(target) && _isObject(source)) {
                Object.keys(source).forEach(key => {
                    if (_isObject(source[key])) {
                        if (!(key in target)) {
                            Object.assign(output, { [key]: source[key] });
                        } else {
                            output[key] = this._mergeDeep(target[key], source[key]);
                        }
                    } else if(source[key] != undefined) {
                        Object.assign(output, { [key]: source[key] });
                    }
                });
            }
            return output;
        },

        _styleToCss: function (style, defaults) {
            let css = JSON.parse(JSON.stringify(defaults));
            if(typeof style === 'string') {
                style.split(/\s*;\s*/).filter(Boolean).forEach(function(txt) {
                    let keyVal = txt.split(/\s*:\s*/);
                    if(keyVal.length === 2) {
                        css[keyVal[0]] = keyVal[1];
                    }
                });
            } else if(typeof style === 'object') {
                Object.keys(style).forEach(function(key) {
                    css[key] = style[key];
                });
            }
            return css;
        }

    };

    $.fn.simpleGauge = function(options, val) {
        let isInit = typeof options === 'object';
        if(isInit && options.debug != undefined) {
           debug = options.debug;
        }
        let result = null;
        this.each(function () {
            let $this = $(this);
            let data = $this.data('plugin-simplegauge');
            if(isInit) {
                if(data) {
                    $this.html('');
                }
                $this.data('plugin-simplegauge', (data = new SimpleGauge($this, options)));
            } else if(typeof options === 'string') {
                result = data[options](val); // example: $('#demo').simpleGauge('setValue', 123);
            } else {
                // ignore undefined state
                debugLog('plugin parameter error');
            }
        });
        return result;
    };

    $.fn.simpleGauge.defaults = {
        template: [
            '<div class="simpleGauge_container">',
            '<div class="simpleGauge">',
            '<div class="simpleGauge_title"></div>',
            '<svg class="simpleGauge_bars simpleGauge_block" version="1.1" xmlns="http://www.w3.org/2000/svg"></svg>',
            '<div class="simpleGauge_labels simpleGauge_block"></div>',
            '<div class="simpleGauge_ticks simpleGauge_block"></div>',
            '<svg class="simpleGauge_pointers simpleGauge_block" version="1.1" xmlns="http://www.w3.org/2000/svg"></svg>',
            '<div class="simpleGauge_digital"></div>',
            '</div>',
            '</div>'
        ].join(''),

        min:    0,
        max:    100,
        value:  0,

        type:   'analog digital',
        container: {
            scale: 100,
            style: {}
        },
        title: {
            text: '',
            style: {}
        },
        digital: {
            text: '{value.1}',
            style: {
                color: 'auto'
            }
        },
        analog: {
            minAngle:   -120,
            maxAngle:   120
        },
        labels: {
            text:   '{value}',
            count:  10,
            scale:  95,
            style:  ''
        },
        ticks: {
            count:  10,
            scale1: 77,
            scale2: 83,
            style:  ''
        },
        subTicks: {
            count:  0,
            scale1: 80,
            scale2: 83,
            style:  ''
        },
        bars: {
            scale1: 75,
            scale2: 80,
            style:  '',
            colors: [
                [ 0,  '#666666', 0, 0 ],
                [ 50, '#ffa500', 0, 0 ],
                [ 90, '#dd2222', 0, 0 ]
            ]
        },
        pointer: {
            scale: 85,
            shape: [
                '-2,-10',
                '2,-10',
                '2.1,-5.3',
                '4,-4',
                '5.3,-2.1',
                '5.7,0',
                '5.3,2.1',
                '4,4',
                '2.1,5.3',
                '2,50',
                '1.5,96',
                '0,100',
                '-1,96',
                '-2,50',
                '-2.1,5.3',
                '-4,4',
                '-5.3,2.1',
                '-5.7,0',
                '-5.3,-2.1',
                '-4,-4',
                '-2.1,-5.3',
                '-2,-10'
            ].join(' '),
            style: {
                color:       '#778',
                borderWidth: 0,
                borderColor: '#778'
            }
        }

    };

})(jQuery);

// EOF
