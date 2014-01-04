Railscast sm-rc198  and sm-rc203 and sm-rc204
==============================================
Railscast sm-rc198
-------------------
Updating Selected posts at one click
----------------------------------

TO check posts object with same value
```
see sm-rc165 or action edit_multiple and update_multiple
see routes.rb
```
Git clone
```
git clone
```
Scaffold
```
#todo
```
Update method
```
It will help to update with a single line , but dont support validation
see posts controller
```
see applied validation in action update_individual
```
reject {|p| p.errors.empty?}
```
update only those fields which want
```
see posts/index.html.erb
```
Rails server
```
Railscast 203
---------------
logic for routes
```
see routes.rb
```
print elements of params
```
debug params
```
Railscast 204
----------------
h,raw, html_safe
```
see posts/comment.html.erb
raw and html_safe is used to to escape html(<,>, /, <b> tags etc are need escape when interacting with browser)
<%=raw "<strong>hiii</strong>" %>
h is used in helpers so only for view and controller
firstly h will escape input and then html_safe will render output properly
```
rails s
```
