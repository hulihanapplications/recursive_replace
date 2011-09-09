# recursive_replace 

* A ruby gem for recursively replacing text in multiple files and directories. 
* Use with shell executable or in code. 
* It auto-escapes *most* characters, so you can replace code syntax and special characters easily without using regular expressions.
* Comes with a rspec testing suite for replacement verification of special characters, expressions and code syntax.
  
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
echo "<%= @object[:bad] %>" > test # use quotes when using special characters 
recursive_replace "<%= @object[:bad] %>" "<%= @new_object[:good] %>" 
cat test # => <%= @new_object[:good] %>
rm test
```

### Slashes

#### Replacing a forward slash

```bash
recursive_replace "/" "_" somedirectory/ 
```

#### Replacing a backslash

Replacing a backslash is the only time you'll actually need to escape an input character.  

```bash
recursive_replace "\\" "_" somedirectory/ 
```

### From Code

```ruby
require "recursive_replace"
file = File.join("home", "bob", "Documents")
RecursiveReplace.replace("bad", "good", :path => file)
```