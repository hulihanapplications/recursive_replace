# recursive_replace 

A ruby gem for recursively replacing text in multiple files and directories. It also escapes special characters, so you can replace code syntax and special characters easily. recursive_replace also comes with a testing suite for verification against several data types and programming languages.
  
## Installation

```bash
gem install recursive_replace
```

## Usage

### From Console/Terminal

```bash
recursive_replace [original] [replacement] [optional_path] 
```
```bash
echo "bad bad good" > test
recursive_replace bad good # replaced bad with bad
cat test # => good good good
rm test
```

### Ruby

```bash
echo \<%= @object[:bad] %\> > test
recursive_replace \<%= @object[:bad] %\> \<%= @new_object[:good] %\> 
cat test # => <%= @new_object[:good] %>
rm test
```

### From Code

```ruby
require "recursive_replace"
file = File.join("home", "bob", "Documents)
RecursiveReplace.replace("bad", "good", :path => file)
```