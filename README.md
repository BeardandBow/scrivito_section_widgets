# ScrivitoSectionWidgets

This gem adds Scrivito widgets for sections, header videos and parallax effects to your app.

## Installation

Add this line to your application's Gemfile:

    gem 'scrivito_section_widgets'

Add this line to your stylesheet manifest:

    *= require scrivito_section_widgets

Add this line to your JavaScript manifest:

    //= require scrivito_section_widgets

## Full page width sections

Using Bootstrap 3? Nothing to do.

If you are not using Bootstrap, the width of the DOM element defining the page, should be set to 100%.
The widget adds a new DOM element named `section`. The class named `.container` defines the width of the page.

For Example:

```css
#wrap { // This comes from your CSS or CSS framework
  width: 100%;
  padding: 0;
  margin: 0;
}

section .container { // This is the style for the widget
  width: 1170px; // Change for your main width if needed
  padding: 15px 0;
  margin: 0 auto;
}
```
## Using video

If your app already includes a class named `Video`, please make sure that it defines the blob attribute as a binary.

```ruby
class Video < Obj
  attribute :blob, :binary
  ...
end
```

## Important note

We recommend to define the valid widget class method in your `obj.rb`. It lets you specify that sections can only be created at the top level of a page.

```ruby
def valid_widget_classes_for(field_name)
  if field_name == "body" # This is your main content field
    Obj.section_widgets
  else
    Scrivito.models.widgets.to_a - Obj.section_widgets
  end
end

def self.section_widgets
  [SectionContentWidget, SectionVideoWidget, SectionParallaxWidget]
end
```

## Localization

The following code represents the default localization for English. Copy it to your `en.yml` and change it if necessary:

```yaml
en:
  scrivito_section_content_widget:
    thumbnail:
      title: Section
      description: Add a section for your content. A Section can have a Background color to seperate some content
    details:
      background_color: Background Color
      padding_size: Padding top and bottom
  scrivito_section_parallax_widget:
    thumbnail:
      title: Parallax
      description: Add an image with parallax effect
    details:
      background_image: Background Image
      speed: Speed
      height: Height
  scrivito_section_video_widget:
    thumbnail:
      title: Background Video
      description: Add a background Video as section to your page
    details:
      background_video_mp4: Video MP4
      background_video_webm: Video WebM
      background_video_ogg: Video OGG
      background_image: Background Image
      height: Height
```
