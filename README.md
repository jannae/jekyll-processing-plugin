# Processing Sketch Liquid Tag / Jekyll plugin

Simple Liquid tag plugin for rendering a Processing .pde sketch within a Jekyll page. Uses Processing.js and canvas.

Created by by Jannae, MIT License

## Setup

Include this link (or host the .js file) in your project site.

	<script src="//cdnjs.cloudflare.com/ajax/libs/processing.js/1.4.8/processing.min.js"></script>

## Usage

Default: 

	{% processing_sketch mysketches/sketch.pde --sketchid=sketch1 --width=640 --height=480 %}

Default code above will renders this codeblock:

	<script type="text/javascript">
		function getProcessingSketchID () { return 'sketch1'; }
	</script>
	<figure>
		<canvas id="sketch1" data-processing-sources="mysketches/sketch.pde" width="600" height="450" tabindex="0" style="image-rendering: -webkit-optimize-contrast !important;">
		<p>Your browser does not support the canvas tag.</p>
		</canvas>
		<figcaption>View source code: <a href="mysketches/sketch.pde">sketch.pde</a></figcaption>
	</figure>

## Options

--sketchid=someID (sets the ID tag for the canvas; recommended if there is to be more than one sketch on the page; default is 'sketch')  
--width=width of sketch (sets the width to render the sketch)  
--height=height of sketch (sets the height to render the sketch)  

## TODOS:
- This does not support more than one .pde file. Should it? Maybe yes?
- Width and height should input widthxheight (e.g., 640x480)