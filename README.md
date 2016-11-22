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

###### App
- coffee/
  - behaviors
    - behavior class files
    - manifest

  - components/
    - component_name/
      - component controller
      - views/
        - component views
        - templates/
          - component templates

  - config
    - configuration files
    - manifest

  - modules -
  - services -
  - views - REPLACE WITH Application directory
  - app.coffee - rename?
  - cordova_app.coffee - move into Application directory

- img/ - images used by the application (only stores logo.png)

- partials/ - REMOVE - move form_helpers into base module

- sass/ --- CSS & configuration

# # # # #

# TODO - abstract style guide into separate file





#Style Guide (maintained with .editorconfig)
- 2-space indentation


- single quotes for string constants, double quotes only when interpolated
-
