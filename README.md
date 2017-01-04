# Introduction.

[We use Liquid 3.0.6 as a template engine](http://liquidmarkup.org). Our engine support all default tags and filters.


# File structure.

Our engine have a strong file structure. All html file must have a .liquid extension. Also you must put your css file in "css" folder,
all js files in "js" folder, images in "image" folder, fonts in "fonts" folder. Your folder should be looked like this:

website:
  - css/
    - some_css_file.css
  - js/
    - some_js_file.js
  - images/
    - some_img.png
  - fonts/
    - some_font.ttf
  - layout.liquid
We valiadate all templates, before load to our system and you must check file structure.

## Our pages:
1.  about_page.liquid
2.  blog_page.liquid
3.  blog_record.liquid
4.  book.liquid
5.  contact_page.liquid
6.  custom_page.liquid
7.  faq_page.liquid
8.  index.liquid
9.  layout.liquid
10. gallery_page.liquid
11. membership_page.liquid
12. not_found_page.liquid
13. number.liquid
14. other_room.liquid
15. privacy_policy.liquid
16. terms_and_conditions.liquid


## Custom filters

Out engine have some custom filters:
  - attachment_url - return the valid url for attachments (images, files, etc.)
  - link_to - return the valid url for redirect to other pages
  - file_url - return the valid url for assets
  - get_native_title
  - get_translation

Usage:
  attachment_url:
    ```
    <img src="{{ photo.image | attachment_url: 'public' }}"/>
    ```

    This method accept 2 parameters:
      1. .image object
      2. attachment style, here is ('public')
  link_to:
    ```
    <a href="{{ '/link_to' | link_to: website_data.link_object }}" />Link title</a>
    ```

    This method accept 2 parameters:
      1. '/link_to', link path to redirect
      2. website_data.link_object - link object, must be passed to make a correct redirect

  file_url:
    ```
    <script acync type="text/javascript" src="{{ '/js/template.js' | file_url: website_data.template }}"> </script>
    ```

    This method accept 2 parameters:
      1. 'js/template.js' - path to file
      2. website_data.template - must be passed to make a correct link to file

  get_native_title:
    ```
    {{ website_data.lang | get_native_title }}
    ```
    This methods return the native title of lang, passed in website_data.lang

  get_translation:
    ```
    {{ facility.title | get_translation: website_data.id, website_data.lang }}
    ```
    This method return the translation of given text, if exist.
    With method accept 3 parameters: text, website_data.id, website_data.lang

## Drops
On all pages you can access to website_data drop - it's a main drop.
Also we have an additional drops:
  - page - this is a drop for custom_page.liquid
  - number - this is a drop for number.liquid
  - record - this is a drop for blog_record.liquid
  - room - this is a drop for room.liquid

## website_data drop methods
Common information:
  - favicon
  - hotel_name
  - phone_number
  - email_address
  - address
  - brand_color
  - header_image
  - logo
  - logo_text
  - template - return template id
  - text_area - return text area
  - contact_area_title - return website contact area title
  - blog_section_title - return blog section title
  - blog_section_description - return blog section title
  - contact_description_text - return description text
  - room_section_title - return hotel room section title
  - terms_and_conditions - return terms and conditions text
  - privacy_policy - return privacy policy text
  
Faq:
- faq_title
- questions - return website faq questions includes next methods:
  - question - return question
  - answer - return answer
  
Testimonials:
  - testimonials - testimonials list
    - title - testimonial title
    - body - testimonial body
    - name - testimonial name
    - link - testimonial link
  
Booking:
  If you use our booking system you must redirect to '/book' page:
    <a href="{{ '/book' | link_to: website_data.link_object }}"></a>
  else you need to redirect to another booking system using website_data.booking_link
     <a href="website_data.booking_link"></a>
  - booking_link
  - booking_button_color
  - booking_button_text

Features:
  - features_background_image - background image for features block
  - features
    - title - features title
    - description - features description
    - icon - features fontawesome icon name
    
SEO:
  - page_title
  - page_description
  - page_keywords
  
Links:
  Return an array of website links
  - top_links
    This methods return only links, available in top
  - footer_links
    This methods return only links, available in footer
  Link object:
    links - list of parent links
    category - category link
    value - link value
    title - link title
Room section:
  - room_section_title
  - room_section_description
  
Social links
  - youtube
  - instagram
  - linkedin
  - googleplus
  - tripadvisor_code
  - tripadvisor_listing_link
  
Membership:
  - membership_active
  - membership_placement
  - membership_description_color
  - membership_form_color
  
Rooms:
  - rooms
    - visible
    - room_type
      - photos
        - image
    - name
  - custom_rooms
    - visible
    - website_custom_room_photos
      - image
    - name

Send email:
  To send email you need to send POST request to '/send_email' with parameters:
    - part_a - this is random integer from website_data.rand_a
    - part_b - this is random integer from website_data.rand_b
    - answer - user must add website_data.rand_a to website_data.rand_b and write answer to input
    - name - user name
    - email - user email
    - message - user message

  Email sends from our system to hotel email and you can reply to user.

  Methods to send email:
    - rand_a
    - rand_b
  Photos:
   - about_photos
    - image
   - gallery_photos
    - image
    
## number drop methods:
 - name
 - description
 - room_type
  - photos
    - image

## page drop methods:
 - title
 - website_page_photos
  - image
 - content
 - meta_description - seo tag
 
## room drop methods
 - icon
 - website_custom_room_photos
  - image
 - meta_description - seo tag
 
## blog_record drop methods
 - cover - bolean, return true if image present
 - title - blog title
 - create_at - blog create_at
 - alt_text - blog img alt text
 - text - blog text
 - disqus_code
 - meta_description - seo tag
 - image
