# Tack Client Application

#### Directory Structure

###### Top Level
- **app/** --- client application
- **gulp/** --- build tasks
- **platforms/** --- Cordova platforms
- **plugins/** --- Cordova plugins
- **www/** --- build destination
- **Gulpfile.coffee** --- build configuration
- **package.json** --- dependency management
- **config.xml** --- Cordova configuration

###### app/

- img/ - images (only stores logo.png)
- sass/ --- SASS & style dependencies
- coffee/
  - behaviors/ --- Behaviors
  - components/ --- Components
  - config/ --- Configuration files
  - modules/ --- Modules
  - services/ --- Services
  - manifest.coffee --- manifest
  - app.coffee --- Application class

###### app/coffee

    - component_name/
      - component controller
      - views/
        - component views
        - templates/
          - component templates

  - config
    - configuration files
    - manifest

# # # # #

# TODO - abstract style guide into separate file

#Style Guide (maintained with .editorconfig)
- 2-space indentation
- single quotes for string constants, double quotes only when interpolated
-
