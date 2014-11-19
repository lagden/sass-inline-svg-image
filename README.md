inline-svg-image
================

Embeds the contents of a svg image directly inside your stylesheet. For small images, this can be a performance benefit at the cost of a larger generated CSS file.

**PLUS:** Change svg color fill

    inline-svg-image($svg, [$color=nil, base64=true])
    
Usage and examples
------------------

### Compass

See [example/compass](https://github.com/lagden/sass-inline-svg-image/tree/master/example/compass)

**To generate stylesheet:**

    compass compile

or  

    sass --compass --require '../../inline-svg-image.rb' sass/example.sass > css/example.css

### Sass

See [example/sass](https://github.com/lagden/sass-inline-svg-image/tree/master/example/sass)

**To generate stylesheet:**

    sass --require '../../inline-svg-image.rb' example.sass > example.css


## Author

[Thiago Lagden](http://lagden.in)