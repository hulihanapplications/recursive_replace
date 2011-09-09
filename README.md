# recursive_replace 

* A ruby gem for recursively replacing text in multiple files and directories. 
* Use with shell executable or in code. 
* It auto-escapes *most* characters, so you can replace code syntax and special characters easily without using regular expressions.
* Comes with a rspec testing suite for replacement verification of special characters, expressions and code syntax.
  
## Installation

```bash
gem install recursive_replace
```

## Examples

### From Console/Terminal

```bash
recursive_replace [original] [replacement] [optional_path] 
```

Replace *foo* with *bar* in current directory and its subdirectories: 

```bash
recursive_replace "foo" "bar"
```

Replace *foo* with *bar* in a specific file: 

```bash
recursive_replace "foo" "bar" file
```

Replace erb syntax:

```bash
recursive_replace "<%= @object[:foo] %>" "<%= @new_object[:bar] %>" 
```

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

## Testing

Want to add a test to see how recursive_replace performs with a specific situation or programming language? Pull the recursive_replace and run its rspec testing suite:

```bash
git clone git://github.com/hulihanapplications/recursive_replace.git
cd recursive_replace
rspec spec/
```