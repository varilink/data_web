# DATA - Web

David Williamson @ Varilink Computing Ltd

------

Front-end *assets* used by the [Derby Arts and Theatre Association website](https://www.derbyartsandtheatre.org.uk/).

Assets are:
- css
- docs (currently PDF format only)
- images
- javascript

We use a number of external libraries in this repo; see the `package.json` file. Only our custom content is tracked in the `src/` folder. We use Sass in the `src/scss/` folder to customise external framework css.

The build process to generate our `dist/` folder, which is not tracked, uses the `webpack` command and configuration for this is provided in `webpack.config.js`.

Prior to using the `webpack` command we use Varilink's [Tools - Gimp](https://github.com/varilink/tools-gimp) to populate the `src/` folder with some images that are actually generated using Gimp from a set of Gimp source files. In those instances it is the Gimp source files that are tracked and not the various images in `src/` that are generated from them and the `.gitignore` file reflects this.

See our [DATA - Docker repo](https://github.com/varilink/data-docker), which contains the setup and instructions for installing the dependencies of this repo and building its `dist/` content.
