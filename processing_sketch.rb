# Processing Sketch Liquid Tag / Jekyll plugin
# v1.0.0
# by Jannae Jacks
# jannae@gmail.com / @jannae79
#
# Includes a processing .pde sketch within a blog post utilizing processing.js and canvas
#
# REQUIRES processing.js
#
# Include this link (or host the .js file) in your project site.
# <script src="//cdnjs.cloudflare.com/ajax/libs/processing.js/1.4.8/processing.min.js"></script>
#
# USAGE
# default: {% processing_sketch mysketches/sketch.pde --width=640 --height=480 %}
# (this will create the canvas markup for Processing.js to render your sketch)
#
#
# OPTIONS
# --sketchid=someID (sets the ID tag for the canvas; recommended if there is to be more than one sketch on the page; default is 'sketch')
# --width=width of sketch (sets the width to render the sketch)
# --height=height of sketch (sets the height to render the sketch)
#
# TODOS:
# - This does not support more than one .pde file. Should it?
# - Width and height should input widthxheight (e.g., 640x480)


module Jekyll
  class PSketch < Liquid::Tag

    @path = nil

    @sketchid = nil
    @width = nil
    @height = nil

    def initialize(tag_name, text, tokens)
      super

      # The path we're getting the sketch from (a dir inside your jekyll dir)
      @path = text.split(/\s+/)[0].strip

      # Defaults
      @sketchid = 'sketch'  # ID Name for sketch canvas.
      @width    = '640'     # Width for sketch
      @height   = '480'     # Height for sketch

      # Parse Options
      if text =~ /--sketchid=(\S+)/i
        @sketchid = text.match(/--sketchid=(\S+)/i)[1]
      end
      if text =~ /--width=(\S+)/i
        @width = text.match(/--width=(\S+)/i)[1]
      end
      if text =~ /--height=(\S+)/i
        @height = text.match(/--height=(\S+)/i)[1]
      end
    end

    def render(context)
      # Get the full path to the dir
      # Include a filter for Processing Sketches
      srcname = File.basename(@path)
      # Start building tag output
      source  = "<script type=\"text/javascript\">\n"
      source += "function getProcessingSketchID () { return '#{@sketchid}'; }</script>"
      source += "<figure>\n"
      source += "<canvas id=\"#{@sketchid}\" data-processing-sources=\"#{@path}\" width=\"#{@width}\" height=\"#{@height}\">\n"
      source += "<p>Your browser does not support the canvas tag.</p>\n</canvas>\n"
      source += "<figcaption>View source code: <a href=\"#{@path}\">#{srcname}</a></figcaption></figure>\n"
      source
    end
  end
end

Liquid::Template.register_tag('processing_sketch', Jekyll::PSketch)
